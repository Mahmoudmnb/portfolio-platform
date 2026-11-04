import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class IntroAboutUsView extends StatelessComponent {
  @override
  Component build(BuildContext context) {
    return section(
      classes: "relative w-full max-w-7xl mx-auto px-6 sm:px-8 pt-16 sm:pt-24 pb-20 sm:pb-28",
      [
        div(
          classes: "max-w-4xl flex flex-col items-start space-y-6 sm:space-y-8",
          [
            div(
              classes: "inline-flex items-center gap-2.5 px-3 py-1 rounded-full bg-surface-container-low shadow-sm",
              [
                span(
                  classes: "inline-block w-2 h-2 rounded-full bg-secondary shadow-[0_0_8px_#4cd7f6] animate-pulse",
                  [],
                ),
                span(
                  classes: "font-label-mono text-label-mono text-secondary tracking-widest uppercase",
                  [
                    .text("ABOUT BROTHERS-TECH"),
                  ],
                ),
              ],
            ),
            h1(
              classes: "font-display-hero text-display-hero text-on-surface tracking-tight",
              [
                .text(" Small Team. "),
                span(
                  classes: "block bg-gradient-to-r from-primary via-secondary to-primary bg-clip-text text-transparent",
                  [
                    .text(" Serious Software. "),
                  ],
                ),
              ],
            ),
            p(
              classes: "font-body-lg text-body-lg text-on-surface-variant max-w-2xl leading-relaxed",
              [
                .text(
                  " Brothers-Tech is a software development team focused on building practical, reliable digital products across mobile, web and desktop. ",
                ),
              ],
            ),
            div(
              classes: "pt-4 flex flex-wrap items-center gap-3 sm:gap-4 font-label-mono text-label-mono text-tertiary",
              [
                span(
                  classes: "flex items-center gap-2",
                  [
                    span(
                      classes: "material-symbols-outlined text-secondary text-[16px]",
                      [
                        .text("verified"),
                      ],
                    ),
                    .text(" Practitioner-Led "),
                  ],
                ),
                span(
                  classes: "text-outline-variant",
                  [
                    .text("•"),
                  ],
                ),
                span(
                  classes: "flex items-center gap-2",
                  [
                    span(
                      classes: "material-symbols-outlined text-secondary text-[16px]",
                      [
                        .text("forum"),
                      ],
                    ),
                    .text(" Direct Communication "),
                  ],
                ),
                span(
                  classes: "text-outline-variant",
                  [
                    .text("•"),
                  ],
                ),
                span(
                  classes: "flex items-center gap-2",
                  [
                    span(
                      classes: "material-symbols-outlined text-secondary text-[16px]",
                      [
                        .text("devices"),
                      ],
                    ),
                    .text(" Multi-Platform Craft "),
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
