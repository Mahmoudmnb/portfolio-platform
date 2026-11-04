import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../components/team_member_card.dart';

class TeamMembersView extends StatelessComponent {
  @override
  Component build(BuildContext context) {
    return section(
      classes: "relative w-full max-w-7xl mx-auto px-6 sm:px-8 py-16 sm:py-24",
      [
        div(
          classes: "max-w-3xl mb-14 sm:mb-16",
          [
            div(
              classes:
                  "flex items-center gap-2 font-label-mono text-label-mono text-secondary uppercase tracking-widest mb-3",
              [
                span(
                  [
                    .text("04"),
                  ],
                ),
                span(classes: "w-8 h-[1px] bg-secondary/40", []),
                span(
                  [
                    .text("Engineers & Designers"),
                  ],
                ),
              ],
            ),
            h2(
              classes: "font-headline-lg text-headline-lg text-on-surface tracking-tight",
              [
                .text(" Small by design. Driven by craft. "),
              ],
            ),
            p(
              classes: "font-body-lg text-body-lg text-on-surface-variant mt-3",
              [
                .text(
                  " We keep the team lean so every project gets direct attention from experienced practitioners. No junior delegates, no outsourced accounts. ",
                ),
              ],
            ),
          ],
        ),
        div(
          classes: "grid grid-cols-1 md:grid-cols-3 gap-8",
          [
            TeamMemberCard(
              name: 'Mahmoud Bannan',
              roleTag: 'FOUNDER / MOBILE DEVELOPER / BACK-END DEVELOPER',
              roleSubtitle: 'FOUNDER & Mobile Developer & Back-end Developer',
              bio:
                  'Building reliable mobile applications and robust back-end systems with a focus on clean architecture, performance, and maintainable code.',
              imageSrc: 'assets/images/Mahmoud.png',
              imageAlt:
                  'Editorial portrait of a male technical lead engineer in a minimalist dark studio setting, moody cinematic soft lighting with subtle cool cyan rim light, wearing a dark crewneck, thoughtful and focused expression.',
              badgeColorClass: 'text-secondary',
              socialLinks: [
                (label: 'LinkedIn', url: 'https://www.linkedin.com/in/mahmoudbannan'),
                (label: 'GitHub', url: 'https://github.com/Mahmoudmnb'),
              ],
            ),
            TeamMemberCard(
              name: 'Mohammed Deeb Jalab',
              roleTag: 'FOUNDER / MOBILE DEVELOPER / FRONT-END WEB DEVELOPER',
              roleSubtitle: 'FOUNDER & Mobile Developer & Front-end Web Developer',
              bio:
                  'Building polished mobile applications and responsive web experiences with clean code, intuitive interfaces, and dependable performance.',
              imageSrc: 'assets/images/Mohammed.jpg',
              imageAlt: 'Portrait of Mohammed Deeb Jalab, founder, mobile developer, and front-end web developer',
              badgeColorClass: 'text-primary',
              socialLinks: [
                (label: 'LinkedIn', url: 'https://www.linkedin.com/in/mouhammed-deeb-jalab'),
                (label: 'GitHub', url: 'https://github.com/Mohamed-Jalab'),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
