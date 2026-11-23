import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class OurServicesView extends StatelessComponent {
  @override
  Component build(BuildContext context) {
    return section(
      classes: "relative w-full overflow-hidden px-6 lg:px-12 py-16 lg:py-24",
      [
        div(
          classes:
              "absolute -top-32 left-1/2 -translate-x-1/2 w-[720px] h-[360px] bg-gradient-to-b from-primary/15 via-secondary/5 to-transparent blur-3xl pointer-events-none -z-10",
          [],
        ),
        div(
          classes: "max-w-6xl mx-auto flex flex-col items-center text-center",
          [
            div(
              classes:
                  "inline-flex items-center gap-space-sm px-3.5 py-1 rounded-full bg-surface-container-high shadow-sm mb-space-lg",
              [
                span(
                  classes: "relative flex h-2 w-2",
                  [
                    span(
                      classes: "animate-ping absolute inline-flex h-full w-full rounded-full bg-secondary opacity-75",
                      [],
                    ),
                    span(classes: "relative inline-flex rounded-full h-2 w-2 bg-secondary", []),
                  ],
                ),
                span(
                  classes: "font-label-mono text-label-mono uppercase tracking-widest text-secondary font-medium",
                  [
                    .text("Our Services"),
                  ],
                ),
              ],
            ),
            h1(
              classes: "font-display-hero text-display-hero tracking-tight text-on-surface max-w-4xl mb-space-md",
              [
                .text(" From Idea to "),
                span(
                  classes:
                      "text-transparent bg-clip-text bg-gradient-to-r from-primary via-secondary to-secondary-fixed",
                  [
                    .text("Working Software."),
                  ],
                ),
              ],
            ),
            p(
              classes: "font-body-lg text-body-lg text-on-surface-variant max-w-2xl leading-relaxed mb-space-xl",
              [
                .text(
                  " Brothers-Tech designs and develops mobile, web, desktop, and connected software solutions built around real business needs. ",
                ),
              ],
            ),
            div(
              classes: "w-full max-w-4xl p-1 rounded-xl bg-surface-container-low shadow-md",
              [
                div(
                  classes:
                      "px-6 py-3 rounded-lg bg-surface-container flex flex-wrap items-center justify-between gap-y-3 gap-x-6 text-on-surface-variant font-label-mono text-label-mono",
                  [
                    div(
                      classes: "flex items-center gap-space-xs",
                      [
                        span(classes: "w-1.5 h-1.5 rounded-full bg-secondary", []),
                        span(
                          classes: "text-on-surface",
                          [
                            .text("5 Core Practices"),
                          ],
                        ),
                      ],
                    ),
                    span(
                      classes: "hidden sm:inline text-outline-variant font-mono",
                      [
                        .text("•"),
                      ],
                    ),
                    div(
                      classes: "flex items-center gap-space-xs",
                      [
                        span(classes: "w-1.5 h-1.5 rounded-full bg-secondary", []),
                        span(
                          classes: "text-on-surface",
                          [
                            .text("Multi-Platform Architecture"),
                          ],
                        ),
                      ],
                    ),
                    span(
                      classes: "hidden sm:inline text-outline-variant font-mono",
                      [
                        .text("•"),
                      ],
                    ),
                    div(
                      classes: "flex items-center gap-space-xs",
                      [
                        span(classes: "w-1.5 h-1.5 rounded-full bg-secondary", []),
                        span(
                          classes: "text-on-surface",
                          [
                            .text("Production Grade Systems"),
                          ],
                        ),
                      ],
                    ),
                    span(
                      classes: "hidden sm:inline text-outline-variant font-mono",
                      [
                        .text("•"),
                      ],
                    ),
                    div(
                      classes: "flex items-center gap-space-xs",
                      [
                        span(classes: "w-1.5 h-1.5 rounded-full bg-secondary", []),
                        span(
                          classes: "text-on-surface",
                          [
                            .text("Zero Vendor Lock-in"),
                          ],
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

