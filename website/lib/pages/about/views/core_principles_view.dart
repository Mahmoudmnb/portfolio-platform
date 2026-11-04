import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../components/principle_card.dart';

class CorePrinciplesView extends StatelessComponent {
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
                    .text("01"),
                  ],
                ),
                span(classes: "w-8 h-[1px] bg-secondary/40", []),
                span(
                  [
                    .text("Core Principles"),
                  ],
                ),
              ],
            ),
            h2(
              classes: "font-headline-lg text-headline-lg text-on-surface tracking-tight",
              [
                .text(" What defines Brothers-Tech. "),
              ],
            ),
            p(
              classes: "font-body-lg text-body-lg text-on-surface-variant mt-3",
              [
                .text(
                  " Engineering guidelines that dictate how we write every file, architect every database, and ship every release. ",
                ),
              ],
            ),
          ],
        ),
        div(
          classes: "grid grid-cols-1 md:grid-cols-2 gap-6 lg:gap-8",
          [
            PrincipleCard(
              icon: 'view_in_ar',
              colorTheme: .secondary,
              title: 'Product First',
              description:
                  "We don't just write code to ticket specs; we think about user adoption, business viability, and real-world utility before touching a keyboard. A technically flawless feature is worthless if it creates user confusion.",
              footerTag: 'FOCUS // OUTCOME OVER CEREMONY',
            ),
            PrincipleCard(
              icon: 'signal_cellular_connected_no_internet_4_bar',
              title: 'Built for Real Use',
              description:
                  'Software needs to work under edge conditions, slow connections, and messy human workflows—not just in clean local demos. We test for battery drain, unstable networks, and unexpected inputs from day one.',
              footerTag: 'RESILIENCE // ZERO CHEAP DEMOS',
            ),
            PrincipleCard(
              icon: 'code_blocks',
              colorTheme: .secondary,
              title: 'Clean Engineering',
              description:
                  'Maintainable codebases, type-safety, modular architecture, and zero unnecessary dependencies that slow future development down. We leave systems clean so your in-house team can step in without dread.',
              footerTag: 'INTEGRITY // ZERO CODE BLOAT',
            ),
            PrincipleCard(
              icon: 'all_inclusive',

              title: 'Long-Term Thinking',
              description:
                  'We build systems designed to be operated, maintained, and evolved gracefully long after initial launch day. Smart schema versioning, backward compatibility, and sound migration paths are non-negotiable.',
              footerTag: 'LIFECYCLE // OPERATIONAL MATURITY',
            ),
          ],
        ),
      ],
    );
  }
}
