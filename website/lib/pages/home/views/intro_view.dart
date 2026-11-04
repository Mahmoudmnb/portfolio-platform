import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class IntroView extends StatelessComponent {
  @override
  Component build(BuildContext context) {
    return section(
      classes: "relative w-full overflow-hidden bg-surface py-16 sm:py-24 lg:py-28",
      [
        div(
          classes:
              "absolute -top-24 left-1/2 -translate-x-1/2 w-[800px] h-[500px] bg-gradient-to-b from-primary/10 via-secondary/5 to-transparent blur-3xl pointer-events-none -z-10",
          [],
        ),
        div(
          classes:
              "absolute top-1/3 -right-24 w-96 h-96 bg-primary-container/10 rounded-full blur-3xl pointer-events-none -z-10",
          [],
        ),
        div(
          classes: "max-w-7xl mx-auto px-6 sm:px-8",
          [
            div(
              classes: "flex items-center",
              [
                div(
                  classes: "max-w-4xl flex flex-col items-start space-y-6",
                  [
                    div(
                      classes:
                          "inline-flex items-center gap-2.5 px-3.5 py-1.5 rounded-full bg-surface-container-high border border-outline-variant/30 text-secondary",
                      [
                        span(
                          classes: "relative flex h-2 w-2",
                          [
                            span(
                              classes:
                                  "animate-ping absolute inline-flex h-full w-full rounded-full bg-secondary opacity-75",
                              [],
                            ),
                            span(
                              classes: "relative inline-flex rounded-full h-2 w-2 bg-secondary",
                              [],
                            ),
                          ],
                        ),
                        span(
                          classes: "font-label-mono text-label-mono uppercase tracking-wider font-semibold",
                          [
                            .text("MULTI-PLATFORM SOFTWARE STUDIO"),
                          ],
                        ),
                      ],
                    ),
                    h1(
                      classes:
                          "font-display-hero text-headline-lg lg:text-display-hero text-on-surface font-semibold tracking-tight leading-[1.1]",
                      [
                        .text(" We Build Software That "),
                        span(
                          classes:
                              "bg-gradient-to-r from-primary via-secondary to-secondary-container bg-clip-text text-transparent",
                          [
                            .text("Moves Businesses Forward."),
                          ],
                        ),
                      ],
                    ),
                    p(
                      classes: "font-body-lg text-body-lg text-on-surface-variant max-w-xl leading-relaxed",
                      [
                        .text(
                          " From mobile apps to web platforms and desktop systems, Brothers-Tech designs and develops reliable digital products built around real business needs. ",
                        ),
                      ],
                    ),
                    div(
                      classes: "flex flex-wrap items-center gap-4 pt-2 w-full sm:w-auto",
                      [
                        a(
                          classes:
                              "inline-flex items-center justify-center h-12 px-7 rounded-lg bg-primary-container text-on-primary-container font-body-md text-body-md font-semibold hover:bg-primary transition-all duration-200 shadow-[inset_0_1px_0_rgba(255,255,255,0.25),0_0_24px_rgba(77,142,255,0.35)] group",
                          href: "/contact",
                          attributes: {
                            "data-path": "contact",
                          },
                          [
                            span(
                              [
                                .text("Start Your Project"),
                              ],
                            ),
                            span(
                              classes:
                                  "material-symbols-outlined ml-2 text-base transition-transform group-hover:translate-x-1",
                              [
                                .text("arrow_forward"),
                              ],
                            ),
                          ],
                        ),
                        a(
                          classes:
                              "inline-flex items-center justify-center h-12 px-7 rounded-lg bg-surface-container-high/60 hover:bg-surface-container-high text-on-surface font-body-md text-body-md font-medium border border-outline-variant/40 hover:border-outline/50 transition-all duration-200",
                          href: "#selected-work",
                          [
                            .text(" Explore Our Work "),
                          ],
                        ),
                      ],
                    ),
                    div(
                      classes:
                          "pt-6 flex flex-wrap items-center gap-3 sm:gap-4 border-t border-outline-variant/20 w-full text-on-surface-variant text-body-sm font-label-mono",
                      [
                        div(
                          classes: "flex items-center gap-2",
                          [
                            span(
                              classes: "material-symbols-outlined text-secondary text-base",
                              [
                                .text("check_circle"),
                              ],
                            ),
                            span(
                              classes: "text-on-surface font-medium",
                              [
                                .text("Real-World Products"),
                              ],
                            ),
                          ],
                        ),
                        span(
                          classes: "text-outline-variant",
                          [
                            .text("•"),
                          ],
                        ),
                        div(
                          classes: "flex items-center gap-2",
                          [
                            span(
                              classes: "material-symbols-outlined text-primary text-base",
                              [
                                .text("devices"),
                              ],
                            ),
                            span(
                              classes: "text-on-surface font-medium",
                              [
                                .text("Multi-Platform Dev"),
                              ],
                            ),
                          ],
                        ),
                        span(
                          classes: "text-outline-variant",
                          [
                            .text("•"),
                          ],
                        ),
                        div(
                          classes: "flex items-center gap-2",
                          [
                            span(
                              classes: "material-symbols-outlined text-secondary text-base",
                              [
                                .text("verified"),
                              ],
                            ),
                            span(
                              classes: "text-on-surface font-medium",
                              [
                                .text("End-to-End Delivery"),
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
        ),
      ],
    );
  }
}
