import 'package:jaspr/dom.dart';
import 'package:jaspr/server.dart';

class FeatureCard extends StatelessComponent {
  final String tag;
  final String title;
  final String description;
  final String imageSrc;
  final String imageAlt;
  final bool reversed;

  const FeatureCard({
    required this.tag,
    required this.title,
    required this.description,
    required this.imageSrc,
    required this.imageAlt,
    this.reversed = false,
    super.key,
  });

  @override
  Component build(BuildContext context) {
    final textContent = div(
      classes: 'lg:col-span-6 flex flex-col items-start',
      [
        div(
          classes:
              'inline-flex items-center px-3 py-1 rounded-md bg-surface-container-high text-secondary font-label-mono-xs text-label-mono-xs uppercase tracking-wider mb-space-md',
          [.text(tag)],
        ),
        h2(
          classes: 'font-headline-lg text-headline-lg text-on-surface tracking-tight leading-tight mb-space-md',
          [.text(title)],
        ),
        p(
          classes: 'font-body-lg text-body-lg text-on-surface-variant leading-relaxed mb-space-lg',
          [.text(description)],
        ),
      ],
    );

    final imageContent = div(
      classes: 'lg:col-span-6 relative w-full flex items-center justify-center',
      [
        img(
          classes: 'block w-full max-w-lg h-auto rounded-2xl shadow-2xl',
          src: imageSrc,
          alt: imageAlt,
          loading: MediaLoading.lazy,
        ),
      ],
    );

    return div(
      classes: 'grid grid-cols-1 lg:grid-cols-12 gap-12 lg:gap-16 items-center',
      reversed
          ? [
              // Reverse DOM ordering on desktop for accessibility/tab indexing
              div(
                classes: 'order-2 lg:order-1 lg:col-span-6 relative w-full flex items-center justify-center',
                [imageContent],
              ),
              div(
                classes: 'order-1 lg:order-2 lg:col-span-6 flex flex-col items-start',
                [textContent],
              ),
            ]
          : [textContent, imageContent],
    );
  }
}
