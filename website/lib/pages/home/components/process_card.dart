import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../../core/utils/enums.dart';

class ProcessCard extends StatelessComponent {
  final String stepNumber;
  final String category;
  final String title;
  final String description;
  final ColorTheme colorTheme;

  const ProcessCard({
    required this.stepNumber,
    required this.category,
    required this.title,
    required this.description,
    this.colorTheme = .primary,
    super.key,
  });

  @override
  Component build(BuildContext context) {
    final isSecondary = colorTheme == .secondary;
    final borderColor = isSecondary ? 'hover:border-secondary/40' : 'hover:border-primary/40';
    final badgeBorder = isSecondary
        ? 'border-secondary text-secondary shadow-[0_0_12px_rgba(76,215,246,0.4)]'
        : 'border-primary text-primary shadow-[0_0_12px_rgba(173,198,255,0.4)]';

    return div(
      classes:
          "relative z-10 p-6 rounded-2xl bg-surface-container border border-outline-variant/35 flex flex-col space-y-3 group $borderColor transition-colors",
      [
        div(
          classes:
              "w-10 h-10 rounded-full bg-surface-container-high border-2 $badgeBorder flex items-center justify-center font-label-mono font-bold text-sm",
          [
            .text(" $stepNumber "),
          ],
        ),
        div(
          classes: "font-label-mono text-label-mono text-secondary uppercase font-semibold",
          [
            .text(" $category "),
          ],
        ),
        h4(
          classes: "font-headline-sm text-body-md font-semibold text-on-surface",
          [
            .text(title),
          ],
        ),
        p(
          classes: "font-body-sm text-body-sm text-on-surface-variant leading-relaxed",
          [
            .text(description),
          ],
        ),
      ],
    );
  }
}
