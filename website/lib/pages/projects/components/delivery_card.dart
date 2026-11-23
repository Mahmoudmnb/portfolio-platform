import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../../core/utils/app_constants.dart';
import '../../../core/utils/enums.dart';

class DeliveryCard extends StatelessComponent {
  final String icon;
  final String title;
  final String description;
  final ColorTheme colorTheme;

  const DeliveryCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    this.colorTheme = .primary,
  });

  @override
  Component build(BuildContext context) {
    return div(
      classes:
          "p-6 rounded-xl bg-surface-container-low border border-outline-variant/30 hover:border-${colorTheme.name}/40 transition-colors space-y-3",
      [
        div(
          classes:
              "w-10 h-10 rounded-lg bg-surface-container-high flex items-center justify-center text-${colorTheme.name}",
          [
            span(
              classes: "material-symbols-outlined text-[24px]",
              [.text(icon)],
            ),
          ],
        ),
        h4(
          classes: "font-headline-sm text-headline-sm text-on-surface font-semibold",
          [.text(title)],
        ),
        p(
          classes: "font-body-sm text-body-sm text-on-surface-variant leading-relaxed",
          [.text(description)],
        ),
      ],
    );
  }
}
