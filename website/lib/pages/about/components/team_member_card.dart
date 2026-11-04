import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class TeamMemberCard extends StatelessComponent {
  final String name;
  final String roleTag;
  final String roleSubtitle;
  final String bio;
  final String imageSrc;
  final String imageAlt;
  final List<({String label, String url})> socialLinks;
  final String badgeColorClass;

  const TeamMemberCard({
    super.key,
    required this.name,
    required this.roleTag,
    required this.roleSubtitle,
    required this.bio,
    required this.imageSrc,
    required this.imageAlt,
    required this.socialLinks,
    required this.badgeColorClass,
  });

  @override
  Component build(BuildContext context) {
    return div(
      classes:
          'group rounded-xl bg-surface-container-low overflow-hidden shadow-sm flex flex-col justify-between hover:bg-surface-container transition-all duration-300',
      [
        div([
          div(
            classes: 'relative w-full h-72 overflow-hidden bg-surface-container-highest',
            [
              img(
                classes:
                    'w-full h-full object-cover grayscale contrast-125 group-hover:scale-105 transition-transform duration-500',
                src: imageSrc,
                alt: imageAlt,
              ),
              div(
                classes: 'absolute inset-0 bg-gradient-to-t from-surface-container-low via-transparent to-transparent',
                [],
              ),
            ],
          ),
          div(
            classes: 'p-6 sm:p-8 space-y-3',
            [
              div(
                classes: 'flex items-center justify-between',
                [
                  span(
                    classes: 'font-label-mono text-label-mono-xs $badgeColorClass uppercase tracking-wider',
                    [.text(roleTag)],
                  ),
                ],
              ),
              h3(
                classes: 'font-headline-md text-headline-md text-on-surface font-semibold',
                [.text(name)],
              ),
              p(
                classes: 'font-body-sm text-body-sm text-tertiary',
                [.text(roleSubtitle)],
              ),
              p(
                classes: 'font-body-md text-body-md text-on-surface-variant pt-2 leading-relaxed',
                [.text(bio)],
              ),
            ],
          ),
        ]),
        div(
          classes:
              'px-6 sm:px-8 pb-6 sm:pb-8 pt-2 flex items-center gap-4 font-label-mono text-label-mono text-primary',
          [
            for (var i = 0; i < socialLinks.length; i++) ...[
              if (i > 0) span(classes: 'text-outline-variant', [.text('•')]),
              a(
                classes: 'inline-flex items-center gap-1 hover:text-secondary transition-colors',
                href: socialLinks[i].url,
                target: .blank,
                attributes: {'rel': 'noopener noreferrer'},
                [
                  span([.text(socialLinks[i].label)]),
                  span(
                    classes: 'material-symbols-outlined text-[14px]',
                    [.text('north_east')],
                  ),
                ],
              ),
            ],
          ],
        ),
      ],
    );
  }
}
