import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class PhilosophiesView extends StatelessComponent {
  @override
  Component build(BuildContext context) {
    return section(
      classes: "relative w-full max-w-7xl mx-auto px-6 sm:px-8 py-16 sm:py-24",
      [
        div(
          classes: "rounded-xl bg-surface-container-lowest p-8 sm:p-14 shadow-2xl relative overflow-hidden",
          [
            div(
              classes:
                  "absolute top-0 left-0 right-0 h-[2px] bg-gradient-to-r from-transparent via-secondary to-transparent opacity-80",
              [],
            ),
            div(
              classes: "max-w-2xl mb-12 sm:mb-16",
              [
                div(
                  classes:
                      "flex items-center gap-2 font-label-mono text-label-mono text-secondary uppercase tracking-widest mb-3",
                  [
                    span(
                      [
                        .text("03"),
                      ],
                    ),
                    span(classes: "w-8 h-[1px] bg-secondary/40", []),
                    span(
                      [
                        .text("Engineering Philosophy"),
                      ],
                    ),
                  ],
                ),
                h2(
                  classes: "font-headline-lg text-headline-lg text-on-surface tracking-tight",
                  [
                    .text(" Good software isn't just code. "),
                  ],
                ),
                p(
                  classes: "font-body-lg text-body-lg text-on-surface-variant mt-2",
                  [
                    .text(
                      " Lines of code are a liability, not an asset. Value is measured by human simplicity and operational endurance. ",
                    ),
                  ],
                ),
              ],
            ),
            div(
              classes: "grid grid-cols-1 md:grid-cols-3 gap-8 sm:gap-10",
              [
                div(
                  classes: "space-y-4",
                  [
                    span(
                      classes: "font-label-mono text-headline-sm text-secondary font-semibold",
                      [
                        .text("01"),
                      ],
                    ),
                    h3(
                      classes: "font-headline-md text-headline-md text-on-surface",
                      [
                        .text(" It solves a real problem "),
                      ],
                    ),
                    p(
                      classes: "font-body-md text-body-md text-on-surface-variant leading-relaxed",
                      [
                        .text(
                          " If it doesn't eliminate friction or unlock a genuine capability, no amount of engineering polish will save it. We question assumptions early so time isn't wasted building what nobody uses. ",
                        ),
                      ],
                    ),
                  ],
                ),
                div(
                  classes: "space-y-4",
                  [
                    span(
                      classes: "font-label-mono text-headline-sm text-primary font-semibold",
                      [
                        .text("02"),
                      ],
                    ),
                    h3(
                      classes: "font-headline-md text-headline-md text-on-surface",
                      [
                        .text(" It feels simple to use "),
                      ],
                    ),
                    p(
                      classes: "font-body-md text-body-md text-on-surface-variant leading-relaxed",
                      [
                        .text(
                          " True sophistication is making complex distributed logic feel effortless, intuitive, and responsive to the user. Fast micro-interactions and sensible defaults beat confusing menus every time. ",
                        ),
                      ],
                    ),
                  ],
                ),
                div(
                  classes: "space-y-4",
                  [
                    span(
                      classes: "font-label-mono text-headline-sm text-secondary font-semibold",
                      [
                        .text("03"),
                      ],
                    ),
                    h3(
                      classes: "font-headline-md text-headline-md text-on-surface",
                      [
                        .text(" It can grow "),
                      ],
                    ),
                    p(
                      classes: "font-body-md text-body-md text-on-surface-variant leading-relaxed",
                      [
                        .text(
                          " Architected from day one so adding a mobile client, a new API endpoint, or doubling user volume doesn't require a complete rewrite. Modularity allows gradual evolution without friction. ",
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
