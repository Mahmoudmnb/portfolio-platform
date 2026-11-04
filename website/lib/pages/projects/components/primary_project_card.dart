import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class PrimaryProjectCard extends StatelessComponent {
  @override
  Component build(BuildContext context) {
    return section(
      classes: "project-item w-full max-w-7xl mx-auto px-6 sm:px-8 mb-20",
      attributes: {
        "data-categories": "web mobile multi",
      },
      [
        div(
          classes:
              "relative w-full rounded-2xl bg-gradient-to-br from-surface-container to-surface-container-low border border-outline-variant/40 hover:border-primary/50 transition-all duration-300 overflow-hidden shadow-2xl group",
          [
            div(
              classes:
                  "absolute -top-32 -left-32 w-80 h-80 bg-primary/20 rounded-full blur-[96px] pointer-events-none transition-opacity duration-300 group-hover:opacity-100 opacity-60",
              [],
            ),
            div(
              classes: "grid grid-cols-1 lg:grid-cols-12 gap-8 p-8 lg:p-12 items-center",
              [
                div(
                  classes: "lg:col-span-6 flex flex-col space-y-6 z-10",
                  [
                    div(
                      classes: "flex flex-wrap items-center gap-2",
                      [
                        span(
                          classes:
                              "px-2.5 py-1 rounded bg-secondary/10 border border-secondary/30 font-label-mono text-label-mono-xs text-secondary uppercase font-semibold",
                          [
                            .text(" Featured Flagship "),
                          ],
                        ),
                        span(
                          classes: "text-outline-variant",
                          [
                            .text("•"),
                          ],
                        ),
                        span(
                          classes:
                              "font-label-mono text-label-mono-xs text-on-surface-variant tracking-wider uppercase",
                          [
                            .text(" Multi-Platform • Dashboard + iOS/Android Mobile "),
                          ],
                        ),
                      ],
                    ),
                    h2(
                      classes:
                          "font-headline-lg text-headline-lg text-on-surface font-semibold tracking-tight group-hover:text-primary transition-colors",
                      [
                        .text(" Quran Institute Management System "),
                      ],
                    ),
                    p(
                      classes: "font-body-lg text-body-lg text-on-surface-variant leading-relaxed",
                      [
                        .text(
                          " A multi-platform Quran institute management system with dedicated admin, teacher, and student applications, customized and deployed in 3 different versions for three institutes, with features adapted to each institute’s specific workflow and requirements. ",
                        ),
                      ],
                    ),
                    div(
                      classes: "flex flex-wrap gap-2 pt-2",
                      [
                        span(
                          classes:
                              "px-2.5 py-1 rounded bg-surface-container-high border border-outline-variant/30 font-label-mono text-label-mono-xs text-primary",
                          [
                            .text("Multi-Platform"),
                          ],
                        ),
                        span(
                          classes:
                              "px-2.5 py-1 rounded bg-surface-container-high border border-outline-variant/30 font-label-mono text-label-mono-xs text-primary",
                          [
                            .text("Admin Desktop"),
                          ],
                        ),
                        span(
                          classes:
                              "px-2.5 py-1 rounded bg-surface-container-high border border-outline-variant/30 font-label-mono text-label-mono-xs text-primary",
                          [
                            .text("Instructor App"),
                          ],
                        ),
                        span(
                          classes:
                              "px-2.5 py-1 rounded bg-surface-container-high border border-outline-variant/30 font-label-mono text-label-mono-xs text-primary",
                          [
                            .text("Student App"),
                          ],
                        ),
                      ],
                    ),
                    div(
                      classes: "flex flex-wrap items-center gap-4 pt-4",
                      [
                        a(
                          classes:
                              "inline-flex items-center gap-2 h-11 px-6 rounded-lg bg-primary-container text-on-primary-container font-headline-sm text-body-md font-medium hover:bg-primary transition-all duration-200 shadow-[0_0_20px_rgba(77,142,255,0.4)]",
                          href: "https://play.google.com/store/apps/details?id=com.brothers.alsaad_mosque_institute",
                          attributes: {
                            "rel": "noopener noreferrer",
                            "target": "_blank",
                          },
                          [
                            span(
                              classes: "material-symbols-outlined text-[20px]",
                              [
                                .text("android"),
                              ],
                            ),
                            span(
                              [
                                .text("Android"),
                              ],
                            ),
                            span(
                              classes: "material-symbols-outlined text-[18px]",
                              [
                                .text("north_east"),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                div(
                  classes: "lg:col-span-6 relative flex items-center justify-center",
                  [
                    div(
                      classes:
                          "absolute inset-0 bg-gradient-to-tr from-secondary-container/20 to-primary-container/20 rounded-2xl blur-3xl opacity-50",
                      [],
                    ),
                    div(
                      classes:
                          "relative w-full overflow-hidden rounded-xl border border-outline-variant/50 bg-surface-container-lowest shadow-2xl",
                      [
                        img(
                          classes: "block h-auto w-full",
                          src: "assets/images/alsaad/Quran%20System.png",
                          alt: "Quran Institute Management System dashboard and mobile applications",
                          attributes: {
                            "decoding": "async",
                          },
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
