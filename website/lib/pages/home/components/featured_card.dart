import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../../core/utils/app_constants.dart';
import '../../../core/utils/enums.dart';

class FeaturedCard extends StatelessComponent {
  final String title, description, iconName;
  final ColorTheme colorTheme;
  const FeaturedCard({
    required this.title,
    required this.description,
    required this.iconName,
    this.colorTheme = .primary,
  });

  @override
  Component build(BuildContext context) {
    final isPrimary = colorTheme == .primary;
    return div(
      classes:
          "p-7 rounded-2xl bg-surface-container border border-outline-variant/30 hover:border-${isPrimary ? "primary" : "secondary"}/40 transition-all duration-300 space-y-4",
      [
        div(
          classes:
              "w-12 h-12 rounded-xl bg-${isPrimary ? "primary" : "secondary"}/10 border border-${isPrimary ? "primary" : "secondary"}/20 flex items-center justify-center text-${isPrimary ? "primary" : "secondary"}",
          [
            span(
              classes: "material-symbols-outlined text-2xl",
              [
                .text(iconName),
              ],
            ),
          ],
        ),
        h3(
          classes: "font-headline-sm text-headline-sm text-on-surface font-semibold",
          [
            .text(" $title "),
          ],
        ),
        p(
          classes: "font-body-sm text-body-sm text-on-surface-variant leading-relaxed",
          [
            .text(
              " $description ",
            ),
          ],
        ),
      ],
    );
  }
}
