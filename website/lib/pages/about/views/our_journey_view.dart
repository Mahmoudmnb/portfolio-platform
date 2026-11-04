import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../components/phase_card.dart';

class OurJourneyView extends StatelessComponent {
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
                    .text("02"),
                  ],
                ),
                span(classes: "w-8 h-[1px] bg-secondary/40", []),
                span(
                  [
                    .text("Our Journey"),
                  ],
                ),
              ],
            ),
            h2(
              classes: "font-headline-lg text-headline-lg text-on-surface tracking-tight",
              [
                .text(" Built through real projects. "),
              ],
            ),
            p(
              classes: "font-body-lg text-body-lg text-on-surface-variant mt-3",
              [
                .text(
                  " Capability is forged through shipping real software under tight constraints, not memorizing abstract buzzwords. ",
                ),
              ],
            ),
          ],
        ),
        div(
          classes: "relative grid grid-cols-1 md:grid-cols-4 gap-6",
          [
            PhaseCard(
              phaseNumber: 'PHASE 01',
              title: 'Learn',
              description:
                  'Deeply immersing in domain constraints, user behavior, and technology primitives before proposing any architectural pattern.',
              footerIcon: 'search',
              footerText: 'Discovery & Scoping',
              colorTheme: .secondary,
              glowShadowClass: 'shadow-[0_0_8px_#4cd7f6]',
            ),
            PhaseCard(
              phaseNumber: 'PHASE 02',
              title: 'Build',
              description:
                  'Translating architecture into clean, testable software across mobile, web, and desktop with zero intermediate handoffs.',
              footerIcon: 'code',
              footerText: 'Disciplined Coding',
              glowShadowClass: 'shadow-[0_0_8px_#adc6ff]',
            ),
            PhaseCard(
              phaseNumber: 'PHASE 03',
              title: 'Ship',
              description:
                  'Deploying production releases with disciplined QA, smooth automated CI/CD, and stringent App Store or cloud compliance.',
              footerIcon: 'rocket_launch',
              footerText: 'Automated Releases',
              colorTheme: .secondary,
              glowShadowClass: 'shadow-[0_0_8px_#4cd7f6]',
            ),
            PhaseCard(
              phaseNumber: 'PHASE 04',
              title: 'Improve',
              description:
                  'Listening to real user feedback, monitoring edge cases, profiling bottlenecks, and refining performance continuously.',
              footerIcon: 'refresh',
              footerText: 'Telemetry & Polish',
              glowShadowClass: 'shadow-[0_0_8px_#adc6ff]',
            ),
          ],
        ),
      ],
    );
  }
}
