import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../../core/utils/enums.dart';

class PhaseCard extends StatelessComponent {
  final String phaseNumber;
  final String title;
  final String description;
  final String footerIcon;
  final String footerText;
  final ColorTheme colorTheme;
  final String glowShadowClass; // e.g., 'shadow-[0_0_8px_#4cd7f6]' or 'shadow-[0_0_8px_#adc6ff]'

  const PhaseCard({
    super.key,
    required this.phaseNumber,
    required this.title,
    required this.description,
    required this.footerIcon,
    required this.footerText,
    this.colorTheme = .primary,
    required this.glowShadowClass,
  });

  @override
  Component build(BuildContext context) {
    return div(
      classes: 'relative p-6 sm:p-8 rounded-xl bg-surface-container-low shadow-sm flex flex-col',
      [
        div(
          classes: 'flex items-center justify-between mb-6',
          [
            span(
              classes: 'font-label-mono text-label-mono text-${colorTheme.name}',
              [.text(phaseNumber)],
            ),
            div(
              classes: 'w-3 h-3 rounded-full bg-${colorTheme.name} $glowShadowClass',
              [],
            ),
          ],
        ),
        h3(
          classes: 'font-headline-md text-headline-md text-on-surface mb-2',
          [.text(title)],
        ),
        p(
          classes: 'font-body-sm text-body-sm text-on-surface-variant leading-relaxed flex-1',
          [.text(description)],
        ),
        div(
          classes: 'mt-6 pt-4 flex items-center gap-2 text-tertiary font-label-mono-xs',
          [
            span(
              classes: 'material-symbols-outlined text-[14px]',
              [.text(footerIcon)],
            ),
            span([.text(footerText)]),
          ],
        ),
      ],
    );
  }
}
