import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

enum StoreType { android, ios }

class StoreButton extends StatelessComponent {
  final String href;
  final String label;
  final StoreType type;

  const StoreButton({
    required this.href,
    required this.label,
    required this.type,
    super.key,
  });

  @override
  Component build(BuildContext context)  {
    final isAndroid = type == StoreType.android;
    final baseClasses = isAndroid
        ? 'inline-flex items-center gap-2 px-4 py-2 rounded-lg bg-primary-container text-on-primary-container font-body-md text-body-sm font-semibold hover:bg-primary transition-all shadow-[0_0_20px_rgba(77,142,255,0.3)] group/store-android'
        : 'inline-flex items-center gap-2 px-4 py-2 rounded-lg bg-surface-container-high text-on-surface font-body-md text-body-sm font-semibold border border-outline-variant/40 hover:border-secondary/60 hover:text-secondary transition-all group/store-ios';

    final hoverGroupClass = isAndroid ? 'group-hover/store-android:translate-x-1' : 'group-hover/store-ios:translate-x-1';

    return a(
      classes: baseClasses,
      href: href,
      target: Target.blank,
      attributes: {
        'rel': 'noopener noreferrer',
        'aria-label': 'Download $label',
      },
      [
        if (isAndroid)
          span(
            classes: 'material-symbols-outlined text-[18px]',
            [.text('android')],
          )
        else
          svg(
            classes: 'w-[18px] h-[18px] fill-current',
            attributes: {
              'aria-hidden': 'true',
              'viewBox': '0 0 384 512',
            },
            [
              path(
                d: 'M318.7 268.7c-.2-36.7 16.4-64.4 50-84.8-18.8-26.9-47.2-41.7-84.7-44.6-35.5-2.8-74.3 20.7-88.5 20.7-15 0-49.4-19.7-76.4-19.7C63.3 141.2 4 184.8 4 273.5c0 26.9 4.9 54.6 14.8 83.1 13.2 36.7 60.8 126.7 110.5 125.2 26-.6 44.3-18.4 78.2-18.4 32.9 0 49.8 18.4 78.8 18.4 50.1-.7 93.3-82.5 105.9-119.3-67.1-31.6-73.5-93.3-73.5-95.6zm-23.2-164.2c27.3-32.4 24.8-61.9 24-72.5-24.1 1.4-52 16.4-67.9 34.9-17.5 19.8-27.8 44.3-25.6 71.9 26.1 2 49.9-11.4 69.5-34.3z',
                [],
              ),
            ],
          ),
        span([.text(label)]),
        span(
          classes: 'material-symbols-outlined text-[15px] $hoverGroupClass transition-transform',
          [.text('open_in_new')],
        ),
      ],
    );
  }
}