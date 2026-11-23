import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class StepCard extends StatelessComponent {
  final String stepTag, iconName, title, description, deliverable;

  StepCard({
    super.key,
    required this.stepTag,
    required this.iconName,
    required this.title,
    required this.description,
    required this.deliverable,
  });
  @override
  Component build(BuildContext context) {
    return div(
      classes:
          'p-6 rounded-2xl bg-surface-container shadow-md hover:bg-surface-container-high transition-colors flex flex-col justify-between h-full',
      [
        div([
          div(
            classes: 'flex items-center justify-between mb-4',
            [
              span(
                classes: 'font-label-mono text-label-mono text-secondary font-bold',
                [.text(stepTag)],
              ),
              span(
                classes: 'material-symbols-outlined text-on-surface-variant text-[20px]',
                [.text(iconName)],
              ),
            ],
          ),
          h3(
            classes: 'font-headline-sm text-headline-sm text-on-surface font-semibold mb-2',
            [.text(title)],
          ),
          p(
            classes: 'font-body-md text-body-md text-on-surface-variant leading-relaxed',
            [.text(description)],
          ),
        ]),
        div(
          classes: 'pt-6 font-label-mono-xs text-label-mono-xs text-secondary flex items-center gap-1',
          [
            span([.text('Deliverable: $deliverable')]),
          ],
        ),
      ],
    );
  }
}
