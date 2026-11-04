import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../components/featured_card.dart';

class WhyUsView extends StatelessComponent {
  @override
  Component build(BuildContext context) {
    return section(
      classes: "w-full bg-surface py-20 lg:py-28 relative",
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
                        .text("WHY BROTHERS-TECH"),
                      ],
                    ),
                  ],
                ),
                h2(
                  classes:
                      "font-headline-lg text-headline-lg lg:text-[44px] lg:leading-[52px] text-on-surface font-semibold tracking-tight",
                  [
                    .text(" More Than Code. We Build Products. "),
                  ],
                ),
                p(
                  classes: "font-body-lg text-body-lg text-on-surface-variant leading-relaxed",
                  [
                    .text(
                      " We combine engineering rigour with genuine product strategy so your digital systems run flawlessly under pressure and drive bottom-line velocity. ",
                    ),
                  ],
                ),
              ],
            ),
            div(
              classes: "grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6",
              [
                FeaturedCard(
                  title: "Built for Real-World Use",
                  description:
                      "Software designed around actual user behaviors, unforgiving real conditions, and measurable business requirements.",
                  iconName: "verified_user",
                ),
                FeaturedCard(
                  title: "One Team, Multi-Platform",
                  description:
                      "Mobile, web, and desktop products planned and delivered seamlessly by one coordinated team.",
                  iconName: "hub",
                  colorTheme: .secondary,
                ),
                FeaturedCard(
                  title: "Scalable Architecture",
                  description:
                      "Clean code modularity and database schemas engineered to scale from initial prototype to millions of monthly active users.",
                  iconName: "layers",
                ),
                FeaturedCard(
                  title: "From Idea to Release",
                  description:
                      "Complete lifecycle ownership: product discovery, interface architecture, QA testing, deployment, and ongoing post-launch refinement.",
                  iconName: "rocket_launch",
                  colorTheme: .secondary,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
