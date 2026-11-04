import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../../core/utils/enums.dart';

class FeatureMetricCard extends StatelessComponent {
  final String iconName;
  final String title;
  final String description;
  final ColorTheme colorTheme;
  final String? descriptionClasses;

  const FeatureMetricCard({
    required this.iconName,
    required this.title,
    required this.description,
    this.colorTheme = .primary,
    this.descriptionClasses,
    super.key,
  });

  @override
  Component build(BuildContext context) {
    final iconColor = colorTheme == .secondary ? 'text-secondary' : 'text-primary';
    final descClass = descriptionClasses ?? 'font-body-sm text-body-sm text-on-surface-variant';

    return div(
      classes: "flex flex-col space-y-1.5 pt-4 sm:pt-0 sm:px-4 first:px-0",
      [
        div(
          classes: "flex items-center gap-2",
          [
            span(
              classes: "material-symbols-outlined $iconColor text-xl",
              [.text(iconName)],
            ),
            span(
              classes: "font-headline-sm text-headline-sm text-on-surface font-semibold",
              [.text(title)],
            ),
          ],
        ),
        p(
          classes: descClass,
          [.text(description)],
        ),
      ],
    );
  }
}
