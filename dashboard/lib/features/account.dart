import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_api/portfolio_api.dart';

import '../core/session.dart';
import '../core/ui.dart';

class AccountScreen extends ConsumerStatefulWidget {
  const AccountScreen({super.key});
  @override
  ConsumerState<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends ConsumerState<AccountScreen> {
  final current = TextEditingController(),
      password = TextEditingController(),
      confirmation = TextEditingController();
  bool busy = false, hidden = true;
  Object? error;
  Map<String, String> fields = {};
  @override
  void dispose() {
    current.dispose();
    password.dispose();
    confirmation.dispose();
    super.dispose();
  }

  Future<void> logout(bool all) async {
    if (!await confirm(
      context,
      all ? 'Sign out all devices?' : 'Sign out?',
      'Unsent form edits will be discarded.',
      action: 'Sign out',
    )) {
      return;
    }
    setState(() => busy = true);
    try {
      await ref.read(sessionProvider).logout(all: all);
    } catch (e) {
      if (mounted) {
        setState(() => error = e);
        final local = await confirm(
          context,
          'Server revocation failed',
          'You can retry sign-out, or remove this device’s credentials only. Local removal cannot revoke the server token.',
          action: 'Local-only sign out',
        );
        if (local) await ref.read(sessionProvider).clear();
      }
    } finally {
      if (mounted) setState(() => busy = false);
    }
  }

  Future<void> changePassword() async {
    final payload = WritePayload('PasswordUpdate', {
      'current_password': current.text,
      'password': password.text,
      'password_confirmation': confirmation.text,
    });
    fields = payload.validate();
    setState(() {});
    if (fields.isNotEmpty) return;
    setState(() => busy = true);
    try {
      await ref.read(sessionProvider).changePassword(payload);
    } catch (e) {
      if (mounted) setState(() => error = e);
    } finally {
      current.clear();
      password.clear();
      confirmation.clear();
      if (mounted) setState(() => busy = false);
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Account & security')),
    body: SafeArea(
      child: PageBody(
        children: [
          Text(
            ref.read(sessionProvider).user?.email ?? '',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 24),
          const Text(
            'Changing your password revokes all tokens and requires signing in again. Use 12+ characters with upper/lower case and numbers; maximum 72 UTF-8 bytes.',
          ),
          const SizedBox(height: 16),
          for (final e in {
            'current_password': current,
            'password': password,
            'password_confirmation': confirmation,
          }.entries)
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: TextField(
                controller: e.value,
                enabled: !busy,
                obscureText: hidden,
                autofillHints: [
                  e.key == 'current_password'
                      ? AutofillHints.password
                      : AutofillHints.newPassword,
                ],
                decoration: InputDecoration(
                  labelText: label(e.key),
                  errorText: fields[e.key],
                ),
              ),
            ),
          TextButton.icon(
            onPressed: () => setState(() => hidden = !hidden),
            icon: Icon(hidden ? Icons.visibility : Icons.visibility_off),
            label: Text(hidden ? 'Show passwords' : 'Hide passwords'),
          ),
          if (error != null) ErrorPanel(error!),
          FilledButton(
            onPressed: busy ? null : changePassword,
            child: const Text('Change password'),
          ),
          const SizedBox(height: 24),
          OutlinedButton(
            onPressed: busy ? null : () => logout(false),
            child: const Text('Sign out this device'),
          ),
          TextButton(
            onPressed: busy ? null : () => logout(true),
            child: const Text('Sign out all devices'),
          ),
          TextButton(
            onPressed: () => showLicensePage(
              context: context,
              applicationName: 'Bannan Studio',
            ),
            child: const Text('Open-source licenses'),
          ),
          const Text(
            'Owner recovery requires the server command app:recover-owner. Contact your server administrator.',
          ),
        ],
      ),
    ),
  );
}
