import 'dart:async';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_api/portfolio_api.dart';

import '../core/session.dart';
import '../core/ui.dart';

class UploadScreen extends ConsumerStatefulWidget {
  const UploadScreen({super.key});
  @override
  ConsumerState<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends ConsumerState<UploadScreen> {
  bool busy = false;
  double? progress;
  Object? error;
  CancelToken? cancel;
  Directory? staging;
  @override
  void dispose() {
    cancel?.cancel();
    staging?.delete(recursive: true).catchError((_) => Directory(''));
    super.dispose();
  }

  Future<void> upload() async {
    setState(() {
      busy = true;
      error = null;
      progress = null;
    });
    try {
      final picked = await FilePicker.pickFile(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'jpeg', 'png', 'webp'],
      );
      if (!mounted || picked == null) return;
      final file = picked;
      if ((await file.length() ?? 10485761) > 10485760) {
        throw const ApiFailure(
          'Choose an accessible JPEG, PNG or WebP image up to 10 MiB.',
        );
      }
      staging = await Directory.systemTemp.createTemp('bannan-upload-');
      final copy = File('${staging!.path}/image.${file.extension ?? 'img'}');
      final sink = copy.openWrite();
      await sink.addStream(file.readAsByteStream());
      await sink.close();
      if (!mounted) return;
      cancel = CancelToken();
      final result = await ref
          .read(apiProvider)
          .upload(
            copy.path,
            file.name,
            cancel: cancel,
            progress: (sent, total) {
              if (mounted) {
                setState(() => progress = total > 0 ? sent / total : null);
              }
            },
          );
      await staging?.delete(recursive: true);
      staging = null;
      if (mounted) {
        await Navigator.pushReplacement(
          context,
          MaterialPageRoute<void>(builder: (_) => MediaDetailScreen(result.id)),
        );
      }
    } catch (e) {
      if (mounted) setState(() => error = e);
    } finally {
      try {
        await staging?.delete(recursive: true);
      } catch (_) {}
      staging = null;
      if (mounted) setState(() => busy = false);
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Upload image')),
    body: SafeArea(
      child: PageBody(
        children: [
          const Text(
            'Choose a JPEG, PNG or WebP image. Up to 10 MiB, 8,000 pixels per side and 20 megapixels. Images are validated and processed by the server.',
          ),
          const SizedBox(height: 24),
          if (error != null) ErrorPanel(error!),
          if (busy) ...[
            LinearProgressIndicator(value: progress),
            Text(
              progress == null
                  ? 'Choosing image…'
                  : '${(progress! * 100).round()}% bytes sent. Processing follows transfer.',
            ),
            TextButton(
              onPressed: () => cancel?.cancel(),
              child: const Text('Cancel transfer'),
            ),
          ] else
            FilledButton.icon(
              onPressed: upload,
              icon: const Icon(Icons.photo_library_outlined),
              label: const Text('Choose image'),
            ),
        ],
      ),
    ),
  );
}

class MediaDetailScreen extends ConsumerStatefulWidget {
  final int id;
  const MediaDetailScreen(this.id, {super.key});
  @override
  ConsumerState<MediaDetailScreen> createState() => _MediaDetailScreenState();
}

class _MediaDetailScreenState extends ConsumerState<MediaDetailScreen>
    with WidgetsBindingObserver {
  Json? media;
  Object? error;
  Timer? timer;
  CancelToken? cancel;
  int ticks = 0;
  DateTime? started;
  bool active = true, loading = false, removing = false, timedOut = false;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    check(restart: true);
  }

  @override
  void dispose() {
    active = false;
    timer?.cancel();
    cancel?.cancel();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    active = state == AppLifecycleState.resumed;
    if (!active) {
      timer?.cancel();
      cancel?.cancel();
    } else {
      check(restart: true);
    }
  }

  Future<void> check({bool restart = false}) async {
    timer?.cancel();
    if (restart) {
      started = DateTime.now();
      ticks = 0;
      timedOut = false;
    }
    if (!active || !mounted) return;
    cancel = CancelToken();
    setState(() => loading = true);
    try {
      final value = await ref
          .read(apiProvider)
          .detail(Resource.media, widget.id, cancel: cancel);
      if (!mounted || !active) return;
      setState(() {
        media = value;
        error = null;
      });
      if (['processing', 'deleting'].contains(value['status'])) {
        timedOut =
            ticks >= 25 ||
            DateTime.now().difference(started ?? DateTime.now()) >=
                const Duration(minutes: 2);
        if (!timedOut) {
          final delay = ticks == 0
              ? 2
              : ticks == 1
              ? 3
              : 5;
          ticks++;
          timer = Timer(Duration(seconds: delay), () => check());
        }
      }
    } on ApiFailure catch (e) {
      if (mounted && active) {
        if (e.status == 404 && (removing || media?['status'] == 'deleting')) {
          Navigator.pop(context);
          return;
        }
        setState(() => error = e);
      }
    } catch (e) {
      if (mounted && active) setState(() => error = e);
    } finally {
      if (mounted) setState(() => loading = false);
    }
  }

  Future<void> remove() async {
    if (!await confirm(
      context,
      'Delete library image?',
      'Used ${media?['usage_count'] ?? 0} times. Detach it from entries, drafts, inactive profiles and site settings first. Deleting a library image cannot be undone.',
      action: 'Delete image',
    )) {
      return;
    }
    setState(() => removing = true);
    try {
      await ref.read(apiProvider).delete(Resource.media, widget.id);
      if (mounted) await check(restart: true);
    } catch (e) {
      if (mounted) setState(() => error = e);
    } finally {
      if (mounted) setState(() => removing = false);
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Image details')),
    body: SafeArea(
      child: PageBody(
        children: [
          if (loading) const LinearProgressIndicator(),
          if (error != null)
            ErrorPanel(error!, retry: () => check(restart: true)),
          if (media != null) ...[
            if (media!['status'] == 'ready')
              Center(
                child: PublicThumbnail(media!['url'] as String?, size: 240),
              ),
            const SizedBox(height: 24),
            Text(
              '${media!['original_filename']}',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text('Status: ${label(media!['status'] as String)}'),
            Text(
              '${media!['width']} × ${media!['height']} · ${media!['bytes']} bytes',
            ),
            Text('Used ${media!['usage_count']} times'),
            if (media!['failure_message'] != null)
              Text('${media!['failure_message']}'),
            if (media!['status'] == 'processing')
              Text(
                timedOut
                    ? 'Your upload is complete. Processing is taking longer. Check again later; you do not need to upload it again.'
                    : 'Upload received. Processing on the server… This may take several minutes.',
              ),
            if (media!['status'] == 'failed')
              const Text('Processing failed. Upload a new image.'),
            if (media!['status'] == 'deleting')
              const Text(
                'Deletion is in progress. This image cannot be attached.',
              ),
            OutlinedButton(
              onPressed: loading ? null : () => check(restart: true),
              child: const Text('Check again'),
            ),
            TextButton.icon(
              onPressed: removing || media!['status'] == 'deleting'
                  ? null
                  : remove,
              icon: const Icon(Icons.delete_outline),
              label: const Text('Delete library image'),
            ),
          ],
        ],
      ),
    ),
  );
}
