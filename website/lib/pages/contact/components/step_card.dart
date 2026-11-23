import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../../core/utils/app_constants.dart';
import '../../../core/utils/enums.dart';

class StepCard extends StatelessComponent {
  const StepCard({
    required this.stepNumber,
    required this.iconName,
    required this.title,
    required this.description,
    this.colorTheme = .primary,
    super.key,
  });

  final String stepNumber;
  final String iconName;
  final String title;
  final String description;
  final ColorTheme colorTheme;

  @override
  Component build(BuildContext context) {
    return div(
      classes:
          "p-6 rounded-xl bg-surface-container/70 border border-outline-variant/30 relative flex flex-col justify-between hover:border-${colorTheme.name}/40 transition-colors group",
      [
        div(
          classes: "space-y-4",
          [
            div(
              classes: "flex items-center justify-between",
              [
                span(
                  classes: "font-label-mono text-[20px] font-semibold text-${colorTheme.name}",
                  [.text(stepNumber)],
                ),
                span(
                  classes:
                      "material-symbols-outlined text-outline group-hover:text-${colorTheme.name} transition-colors text-[22px]",
                  [.text(iconName)],
                ),
              ],
            ),
            h3(
              classes: "font-headline-sm text-headline-sm text-on-surface font-medium",
              [.text(title)],
            ),
            p(
              classes: "font-body-sm text-body-sm text-on-surface-variant leading-relaxed",
              [.text(description)],
            ),
          ],
        ),
        div(
          classes:
              "mt-8 h-1 w-12 rounded-full bg-outline-variant/40 group-hover:bg-${colorTheme.name} transition-colors",
          [],
        ),
      ],
    );
  }
}
