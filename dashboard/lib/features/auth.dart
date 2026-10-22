import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/session.dart';
import '../core/ui.dart';
import '../app/theme.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});
  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final email = TextEditingController(), password = TextEditingController();
  final form = GlobalKey<FormState>();
  bool busy = false, hidden = true;
  Object? error;
  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  Future<void> submit() async {
    if (!form.currentState!.validate()) return;
    setState(() => busy = true);
    try {
      await ref.read(sessionProvider).login(email.text.trim(), password.text);
    } catch (e) {
      if (mounted) setState(() => error = e);
    } finally {
      password.clear();
      if (mounted) setState(() => busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final session = ref.read(sessionProvider);
    return Scaffold(
      body: SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: AutofillGroup(
                child: Form(
                  key: form,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const StudioHeading(
                        eyebrow: 'BANNAN / STUDIO',
                        title: 'Your work, in one place.',
                      ),
                      const SizedBox(height: 40),
                      const Text(
                        'Manage your portfolio, team and inquiries.',
                        style: TextStyle(color: muted),
                      ),
                      const SizedBox(height: 16),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: StatusBadge('Owner access only'),
                      ),
                      const SizedBox(height: 16),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                'Welcome back',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                session.state == SessionState.expired
                                    ? 'Session expired. Sign in to review your unsaved work.'
                                    : 'Sign in to your studio dashboard.',
                                style: const TextStyle(color: muted),
                              ),
                              const SizedBox(height: 12),
                              TextFormField(
                                key: const ValueKey('login-email'),
                                controller: email,
                                decoration: const InputDecoration(
                                  labelText: 'Email',
                                ),
                                autofillHints: const [
                                  AutofillHints.username,
                                  AutofillHints.email,
                                ],
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                                validator: (v) => v == null || !v.contains('@')
                                    ? 'Enter your email'
                                    : null,
                              ),
                              const SizedBox(height: 12),
                              TextFormField(
                                key: const ValueKey('login-password'),
                                controller: password,
                                obscureText: hidden,
                                autofillHints: const [AutofillHints.password],
                                textInputAction: TextInputAction.done,
                                onFieldSubmitted: (_) => busy ? null : submit(),
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  suffixIcon: IconButton(
                                    tooltip: hidden
                                        ? 'Show password'
                                        : 'Hide password',
                                    onPressed: () =>
                                        setState(() => hidden = !hidden),
                                    icon: Icon(
                                      hidden
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined,
                                    ),
                                  ),
                                ),
                                validator: (v) => v == null || v.isEmpty
                                    ? 'Enter your password'
                                    : null,
                              ),
                              const SizedBox(height: 12),
                              if (error != null) ErrorPanel(error!),
                              if (session.error != null)
                                Text(session.error.toString()),
                              FilledButton(
                                onPressed: busy ? null : submit,
                                child: Text(busy ? 'Signing in…' : 'Sign in'),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Owner access is set up on the server.',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'A quieter space to keep your work moving.',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(height: 16),
                      ExpansionTile(
                        title: const Text('Account recovery'),
                        children: const [
                          Text(
                            'Ask your server administrator to run app:recover-owner.',
                          ),
                        ],
                      ),
                      if (session.state == SessionState.expired)
                        TextButton(
                          onPressed: () => session.clear(),
                          child: const Text('Cancel and discard unsaved work'),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SessionCheck extends ConsumerWidget {
  const SessionCheck({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = ref.read(sessionProvider);
    return Scaffold(
      body: SafeArea(
        child: PageBody(
          children: [
            Text(
              'Bannan Studio',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            if (s.state == SessionState.checking)
              const Center(child: CircularProgressIndicator())
            else ...[
              ErrorPanel(
                s.error ?? 'Owner access is unavailable.',
                retry: () => s.bootstrap(),
              ),
              TextButton(
                onPressed: () => s.clear(),
                child: const Text('Sign out on this device'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
