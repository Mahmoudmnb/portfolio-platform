import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../components/process_card.dart';

class HowWeWorkView extends StatelessComponent {
  @override
  Component build(BuildContext context) {
    return section(
      classes: "w-full bg-surface-container-low py-20 lg:py-28 relative border-y border-outline-variant/20",
      [
        div(
          classes: "max-w-7xl mx-auto px-6 sm:px-8",
          [
            div(
              classes: "max-w-3xl mb-16 space-y-4",
              [
                div(
                  classes:
                      "inline-flex items-center gap-2 font-label-mono text-label-mono uppercase tracking-wider text-secondary",
                  [
                    span(classes: "h-1.5 w-1.5 rounded-full bg-secondary", []),
                    span(
                      [
                        .text("HOW WE WORK"),
                      ],
                    ),
                  ],
                ),
                h2(
                  classes:
                      "font-headline-lg text-headline-lg lg:text-[44px] lg:leading-[52px] text-on-surface font-semibold tracking-tight",
                  [
                    .text(" From Idea to Launch. "),
                  ],
                ),
                p(
                  classes: "font-body-lg text-body-lg text-on-surface-variant",
                  [
                    .text(
                      " A disciplined five-stage development pipeline designed to eliminate rework, ensure transparent execution, and protect delivery milestones. ",
                    ),
                  ],
                ),
              ],
            ),
            div(
              classes: "relative grid grid-cols-1 md:grid-cols-5 gap-6",
              [
                div(
                  classes:
                      "hidden md:block absolute top-10 left-12 right-12 h-0.5 bg-gradient-to-r from-primary via-secondary to-primary-container z-0 opacity-40",
                  [],
                ),
                const ProcessCard(
                  stepNumber: "01",
                  category: "DISCOVER",
                  title: "Define & Align",
                  description:
                      "Understand the business, users, technical requirements, edge cases, and core conversion goals.",
                  colorTheme: .primary,
                ),
                const ProcessCard(
                  stepNumber: "02",
                  category: "DESIGN",
                  title: "Plan & Prototype",
                  description:
                      "Wireframe user flows, design interactive UI systems, and validate high-fidelity prototypes.",
                  colorTheme: .secondary,
                ),
                const ProcessCard(
                  stepNumber: "03",
                  category: "DEVELOP",
                  title: "Engineered Code",
                  description:
                      "Transform approved specifications into reliable software with clean architectures and CI/CD.",
                  colorTheme: .primary,
                ),
                const ProcessCard(
                  stepNumber: "04",
                  category: "TEST",
                  title: "Rigorous QA",
                  description:
                      "Verify automated test suites, end-to-end integration, performance under load, and system stability.",
                  colorTheme: .secondary,
                ),
                const ProcessCard(
                  stepNumber: "05",
                  category: "LAUNCH",
                  title: "Deploy & Scale",
                  description:
                      "Zero-downtime production deployment, store approval submission, telemetry setup, and iteration.",
                  colorTheme: .primary,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
