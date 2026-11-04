import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class IntroProjectsView extends StatelessComponent {
  @override
  Component build(BuildContext context) {
    return section(
      classes: "relative w-full max-w-7xl mx-auto px-6 sm:px-8 pt-10 pb-16 overflow-hidden",
      [
        div(
          classes:
              "absolute -top-24 left-1/4 w-96 h-96 bg-primary/10 rounded-full blur-[128px] pointer-events-none -z-10",
          [],
        ),
        div(
          classes:
              "absolute top-1/2 right-10 w-80 h-80 bg-secondary/10 rounded-full blur-[110px] pointer-events-none -z-10",
          [],
        ),
        div(
          classes: "flex flex-col items-start gap-6 max-w-4xl",
          [
            div(
              classes:
                  "inline-flex items-center gap-2 px-3 py-1 rounded-full bg-surface-container-high border border-outline-variant/30 backdrop-blur-md",
              [
                span(
                  classes: "w-2 h-2 rounded-full bg-secondary shadow-[0_0_10px_#4cd7f6] animate-pulse",
                  [],
                ),
                span(
                  classes: "font-label-mono text-label-mono-xs uppercase tracking-widest text-secondary font-medium",
                  [
                    .text("Selected Work"),
                  ],
                ),
                span(
                  classes: "text-outline-variant",
                  [
                    .text("|"),
                  ],
                ),
                span(
                  classes: "font-label-mono text-label-mono-xs text-on-surface-variant",
                  [
                    .text("Production Case Studies"),
                  ],
                ),
              ],
            ),
            h1(
              classes: "font-display-hero text-display-hero text-on-surface tracking-tight",
              [
                .text(" Products We've "),
                span(
                  classes:
                      "text-transparent bg-clip-text bg-gradient-to-r from-primary via-secondary to-secondary-fixed",
                  [
                    .text("Brought to Life."),
                  ],
                ),
              ],
            ),
            p(
              classes: "font-body-lg text-body-lg text-on-surface-variant max-w-2xl leading-relaxed",
              [
                .text(
                  " From consumer mobile apps to high-throughput web dashboards and mission-critical desktop systems, explore the digital products engineered and deployed by Brothers-Tech. ",
                ),
              ],
            ),
            div(
              classes:
                  "flex flex-wrap items-center gap-x-6 gap-y-3 pt-2 font-label-mono text-label-mono text-on-surface-variant",
              [
                div(
                  classes: "flex items-center gap-2",
                  [
                    span(
                      classes: "material-symbols-outlined text-secondary text-[18px]",
                      [
                        .text("verified"),
                      ],
                    ),
                    span(
                      classes: "text-on-surface font-medium",
                      [
                        .text("14+ Platforms Shipped"),
                      ],
                    ),
                  ],
                ),
                span(
                  classes: "text-outline-variant hidden sm:inline",
                  [
                    .text("•"),
                  ],
                ),
                div(
                  classes: "flex items-center gap-2",
                  [
                    span(
                      classes: "material-symbols-outlined text-primary text-[18px]",
                      [
                        .text("phone_iphone"),
                      ],
                    ),
                    span(
                      [
                        .text("Android & iOS"),
                      ],
                    ),
                  ],
                ),
                span(
                  classes: "text-outline-variant hidden sm:inline",
                  [
                    .text("•"),
                  ],
                ),
                div(
                  classes: "flex items-center gap-2",
                  [
                    span(
                      classes: "material-symbols-outlined text-primary text-[18px]",
                      [
                        .text("laptop_chromebook"),
                      ],
                    ),
                    span(
                      [
                        .text("Modern Web"),
                      ],
                    ),
                  ],
                ),
                span(
                  classes: "text-outline-variant hidden sm:inline",
                  [
                    .text("•"),
                  ],
                ),
                div(
                  classes: "flex items-center gap-2",
                  [
                    span(
                      classes: "material-symbols-outlined text-primary text-[18px]",
                      [
                        .text("desktop_windows"),
                      ],
                    ),
                    span(
                      [
                        .text("Native Desktop"),
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
