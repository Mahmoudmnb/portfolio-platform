import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class GetInTouchView extends StatelessComponent {
  @override
  Component build(BuildContext context) {
    return section(
      classes: "w-full bg-surface py-20 lg:py-28 relative overflow-hidden",
      [
        div(
          classes: "max-w-7xl mx-auto px-6 sm:px-8",
          [
            div(
              classes:
                  "relative rounded-3xl bg-surface-container-high/90 border border-outline-variant/50 p-10 sm:p-14 lg:p-16 overflow-hidden shadow-2xl",
              [
                div(
                  classes:
                      "absolute -top-32 -right-32 w-96 h-96 bg-primary/20 rounded-full blur-3xl pointer-events-none",
                  [],
                ),
                div(
                  classes:
                      "absolute -bottom-32 -left-32 w-96 h-96 bg-secondary/15 rounded-full blur-3xl pointer-events-none",
                  [],
                ),
                div(
                  classes: "relative z-10 max-w-3xl space-y-6",
                  [
                    div(
                      classes:
                          "inline-flex items-center gap-2 px-3 py-1 rounded-full bg-surface-container-lowest border border-outline-variant/30 text-secondary",
                      [
                        span(classes: "w-2 h-2 rounded-full bg-secondary", []),
                        span(
                          classes: "font-label-mono text-label-mono uppercase tracking-wider font-semibold",
                          [
                            .text("GET IN TOUCH"),
                          ],
                        ),
                      ],
                    ),
                    h2(
                      classes:
                          "font-headline-lg text-headline-lg lg:text-[44px] lg:leading-[52px] text-on-surface font-semibold tracking-tight",
                      [
                        .text(" Have an Idea? Let’s Build It Together. "),
                      ],
                    ),
                    p(
                      classes: "font-body-lg text-body-lg text-on-surface-variant leading-relaxed",
                      [
                        .text(
                          " Whether you’re starting something new or improving an existing product, let’s turn your idea into reliable, production-ready software. ",
                        ),
                      ],
                    ),
                    div(
                      classes: "pt-4 flex flex-wrap items-center gap-4",
                      [
                        a(
                          classes:
                              "inline-flex items-center justify-center h-12 px-8 rounded-lg bg-primary-container text-on-primary-container font-body-md text-body-md font-semibold hover:bg-primary transition-all duration-200 shadow-[inset_0_1px_0_rgba(255,255,255,0.25),0_0_24px_rgba(77,142,255,0.4)] group",
                          href: "/contact",
                          attributes: {
                            "data-path": "contact",
                          },
                          [
                            span(
                              [
                                .text("Tell Us About Your Project"),
                              ],
                            ),
                            span(
                              classes:
                                  "material-symbols-outlined ml-2 text-base group-hover:translate-x-1 transition-transform",
                              [
                                .text("arrow_forward"),
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
