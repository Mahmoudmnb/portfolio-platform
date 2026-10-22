import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'session.dart';
import '../app/theme.dart';

import 'package:portfolio_api/portfolio_api.dart';
import 'package:url_launcher/url_launcher.dart';

class PageBody extends StatelessWidget {
  final List<Widget> children;
  const PageBody({super.key, required this.children});
  @override
  Widget build(BuildContext context) => Align(
    alignment: Alignment.topCenter,
    child: ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 840),
      child: ListView(padding: const EdgeInsets.all(24), children: children),
    ),
  );
}

class ErrorPanel extends StatelessWidget {
  final Object error;
  final VoidCallback? retry;
  const ErrorPanel(this.error, {super.key, this.retry});
  @override
  Widget build(BuildContext context) => Semantics(
    liveRegion: true,
    child: Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              error is ApiFailure
                  ? error.toString()
                  : 'Unable to load this information. Please try again.',
            ),
            if (error is ApiFailure && (error as ApiFailure).status == 429)
              Text(
                'Wait ${(error as ApiFailure).retryAfter?.inSeconds ?? 60} seconds before retrying.',
              ),
            if (retry != null)
              RetryAction(
                onRetry: retry!,
                delay:
                    error is ApiFailure && (error as ApiFailure).status == 429
                    ? (error as ApiFailure).retryAfter ??
                          const Duration(seconds: 60)
                    : Duration.zero,
              ),
            if (error is ApiFailure && (error as ApiFailure).status == 403)
              Consumer(
                builder: (context, ref, _) => TextButton(
                  onPressed: () async {
                    if (await confirm(
                      context,
                      'Sign out on this device?',
                      'Owner access is forbidden. Local credential removal cannot prove server token revocation.',
                      action: 'Remove local credentials',
                    )) {
                      await ref.read(sessionProvider).clear();
                    }
                  },
                  child: const Text('Sign out on this device'),
                ),
              ),
          ],
        ),
      ),
    ),
  );
}

Future<bool> confirm(
  BuildContext context,
  String title,
  String message, {
  String action = 'Confirm',
}) async =>
    await showDialog<bool>(
      context: context,
      builder: (c) => AlertDialog(
        title: Text(title),
        content: SingleChildScrollView(child: Text(message)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(c, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(c, true),
            child: Text(action),
          ),
        ],
      ),
    ) ??
    false;
void notice(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}

Future<void> openWeb(BuildContext context, String url) async {
  if (!safeWebUrl(url)) {
    notice(context, 'This link is unsafe.');
    return;
  }
  try {
    if (!await launchUrl(
          Uri.parse(url),
          mode: LaunchMode.externalApplication,
        ) &&
        context.mounted) {
      notice(context, 'No app could open this link.');
    }
  } catch (_) {
    if (context.mounted) notice(context, 'Unable to open this link.');
  }
}

String label(String value) => value
    .replaceAll('_', ' ')
    .replaceAll('-', ' ')
    .split(' ')
    .map((s) => s.isEmpty ? s : '${s[0].toUpperCase()}${s.substring(1)}')
    .join(' ');
String localTime(dynamic value) {
  final d = DateTime.tryParse(value?.toString() ?? '');
  return d?.toLocal().toString().split('.').first ?? '—';
}

class PublicThumbnail extends ConsumerWidget {
  final String? url;
  final double size;
  const PublicThumbnail(this.url, {super.key, this.size = 64});
  @override
  Widget build(BuildContext context, WidgetRef ref) => SizedBox(
    width: size,
    height: size,
    child:
        url != null && safeMediaUrl(url!, apiBase: ref.watch(apiProvider).base)
        ? ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              url!,
              fit: BoxFit.cover,
              headers: const {},
              errorBuilder: (_, e, s) =>
                  const Icon(Icons.broken_image_outlined),
            ),
          )
        : const Icon(Icons.image_outlined),
  );
}

Future<void> openMail(
  BuildContext context,
  String email,
  String subject,
) async {
  final uri = Uri(
    scheme: 'mailto',
    path: email,
    query: 'subject=${Uri.encodeComponent(subject)}',
  );
  try {
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication) &&
        context.mounted) {
      notice(context, 'No email app is available.');
    }
  } catch (_) {
    if (context.mounted) notice(context, 'Unable to open your email app.');
  }
}

class RetryAction extends StatefulWidget {
  final VoidCallback onRetry;
  final Duration delay;
  const RetryAction({super.key, required this.onRetry, required this.delay});
  @override
  State<RetryAction> createState() => _RetryActionState();
}

class _RetryActionState extends State<RetryAction> {
  late int remaining;
  Timer? timer;
  @override
  void initState() {
    super.initState();
    remaining = widget.delay.inSeconds;
    if (remaining > 0) {
      timer = Timer.periodic(const Duration(seconds: 1), (t) {
        if (!mounted) return;
        setState(() => remaining--);
        if (remaining <= 0) t.cancel();
      });
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => TextButton(
    onPressed: remaining > 0 ? null : widget.onRetry,
    child: Text(remaining > 0 ? 'Retry in $remaining seconds' : 'Retry'),
  );
}

class StudioHeading extends StatelessWidget {
  final String eyebrow, title;
  const StudioHeading({super.key, required this.eyebrow, required this.title});
  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(eyebrow, style: Theme.of(context).textTheme.bodySmall),
      const SizedBox(height: 4),
      Semantics(
        header: true,
        child: Text(title, style: Theme.of(context).textTheme.headlineSmall),
      ),
    ],
  );
}

class StatusBadge extends StatelessWidget {
  final String status;
  const StatusBadge(this.status, {super.key});
  @override
  Widget build(BuildContext context) {
    final colors = switch (status.toLowerCase()) {
      'draft' ||
      'processing' ||
      'limited' => (const Color(0xFF805600), const Color(0xFFFFF1D5)),
      'failed' ||
      'unavailable' => (const Color(0xFFB53B35), const Color(0xFFFDECE9)),
      'archived' ||
      'deleting' ||
      'inactive' => (const Color(0xFF295F99), const Color(0xFFEAF1FA)),
      _ => (teal, const Color(0xFFE5F2EC)),
    };
    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.$2,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Text(
          status.isEmpty
              ? status
              : status[0].toUpperCase() + status.substring(1),
          style: Theme.of(context).textTheme.bodySmall
              ?.copyWith(color: colors.$1),
        ),
      ),
    );
  }
}
