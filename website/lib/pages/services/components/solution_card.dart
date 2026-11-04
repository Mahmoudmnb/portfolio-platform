import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class SolutionCard extends StatelessComponent {
  final String iconName;
  final String title;
  final String description;
  final String footerText;
  final String? customClasses; // e.g. "md:col-span-2 xl:col-span-2"
  final String? iconBgClass;

  SolutionCard({
    super.key,
    required this.iconName,
    required this.title,
    required this.description,
    required this.footerText,
     this.customClasses,
     this.iconBgClass,
  });

  @override
  Component build(BuildContext context) {
    final defaultCardClasses = 
        'p-6 rounded-2xl bg-surface-container flex flex-col justify-between shadow-sm hover:bg-surface-container-high transition-colors';
    
    final cardClasses = customClasses != null 
        ? '$defaultCardClasses $customClasses' 
        : defaultCardClasses;

    final defaultIconBg = 'w-10 h-10 rounded-lg bg-surface-container-highest flex items-center justify-center mb-4';
    final iconBgClasses = iconBgClass != null
        ? 'w-10 h-10 rounded-lg $iconBgClass flex items-center justify-center mb-4'
        : defaultIconBg;
    return div(
      classes: cardClasses,
      [
        div(
          [
            div(
              classes: iconBgClasses,
              [
                span(
                  classes: 'material-symbols-outlined text-secondary text-[22px]',
                  [.text(iconName)],
                ),
              ],
            ),
            h3(
              classes: 'font-headline-sm text-headline-sm text-on-surface font-semibold mb-2',
              [.text(title)],
            ),
            p(
              classes: 'font-body-md text-body-md text-on-surface-variant',
              [.text(description)],
            ),
          ],
        ),
        div(
          classes: 'mt-4 pt-3 flex items-center gap-2 text-on-surface-variant font-label-mono-xs text-label-mono-xs',
          [
            span(classes: 'w-1.5 h-1.5 rounded-full bg-secondary', []),
            span([.text(footerText)]),
          ],
        ),
      ],
    );
  }
}
