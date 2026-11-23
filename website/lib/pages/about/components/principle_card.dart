import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../../core/utils/app_constants.dart';
import '../../../core/utils/enums.dart';

class PrincipleCard extends StatelessComponent {
  final String icon;
  final String title;
  final String description;
  final String footerTag;
  final ColorTheme colorTheme;
  const PrincipleCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.footerTag,
    this.colorTheme = .primary,
  });

  @override
  Component build(BuildContext context) {
    return div(
      classes:
          'p-8 sm:p-10 rounded-xl bg-surface-container-low shadow-sm flex flex-col justify-between hover:bg-surface-container transition-colors duration-300',
      [
        div([
          div(
            classes: 'w-12 h-12 rounded-lg bg-surface-container-highest flex items-center justify-center mb-6',
            [
              span(
                classes: 'material-symbols-outlined text-${colorTheme.name} text-[24px]',
                [.text(icon)],
              ),
            ],
          ),
          h3(
            classes: 'font-headline-md text-headline-md text-on-surface mb-3',
            [.text(title)],
          ),
          p(
            classes: 'font-body-md text-body-md text-on-surface-variant leading-relaxed',
            [.text(description)],
          ),
        ]),
        div(
          classes: 'mt-8 pt-4 font-label-mono text-label-mono-xs text-tertiary',
          [.text(footerTag)],
        ),
      ],
    );
  }
}
