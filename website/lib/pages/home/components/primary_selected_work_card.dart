import 'package:jaspr/dom.dart';
import 'package:jaspr/server.dart';

class PrimarySelectedWorkCard extends StatelessComponent {
  @override
  Component build(BuildContext context) {
    return div(
      classes:
          "p-8 sm:p-10 lg:p-12 rounded-3xl bg-surface-container border border-outline-variant/40 hover:border-primary/50 transition-all duration-300 mb-8 shadow-2xl",
      [
        div(
          classes: "grid grid-cols-1 lg:grid-cols-12 gap-10 items-center",
          [
            div(
              classes: "lg:col-span-6 space-y-6",
              [
                div(
                  classes: "font-label-mono text-label-mono text-secondary uppercase tracking-wider",
                  [
                    .text(" Featured Project • Education "),
                  ],
                ),
                h3(
                  classes: "font-headline-lg text-headline-md sm:text-headline-lg text-on-surface font-semibold",
                  [
                    .text(" Prime - Education Platform "),
                  ],
                ),
                p(
                  classes: "font-body-lg text-body-lg text-on-surface-variant leading-relaxed",
                  [
                    .text(
                      " Mobile learning platform for medical students at Aleppo University. ",
                    ),
                  ],
                ),
                ul(
                  classes: "space-y-2 text-on-surface-variant font-body-md text-body-md",
                  [
                    li(
                      classes: "flex items-start gap-2",
                      [
                        span(classes: "text-secondary mt-0.5", [
                          .text("•"),
                        ]),
                        span([
                          .text(
                            "Built question banks, previous exams, videos, PDFs, and learning resources.",
                          ),
                        ]),
                      ],
                    ),
                    li(
                      classes: "flex items-start gap-2",
                      [
                        span(classes: "text-secondary mt-0.5", [
                          .text("•"),
                        ]),
                        span([
                          .text("Integrated an AI assistant and offline content access."),
                        ]),
                      ],
                    ),
                    li(
                      classes: "flex items-start gap-2",
                      [
                        span(classes: "text-secondary mt-0.5", [
                          .text("•"),
                        ]),
                        span([
                          .text("Implemented content encryption."),
                        ]),
                      ],
                    ),
                  ],
                ),
                div(
                  classes: "flex flex-wrap gap-2 pt-2",
                  [
                    span(
                      classes:
                          "px-3 py-1 rounded-md bg-surface-container-high text-secondary font-label-mono text-label-mono border border-secondary/20",
                      [
                        .text("Android/iOS"),
                      ],
                    ),
                    span(
                      classes:
                          "px-3 py-1 rounded-md bg-surface-container-high text-secondary font-label-mono text-label-mono border border-secondary/20",
                      [
                        .text("Encryption"),
                      ],
                    ),
                    span(
                      classes:
                          "px-3 py-1 rounded-md bg-surface-container-high text-secondary font-label-mono text-label-mono border border-secondary/20",
                      [
                        .text("AI Assistant"),
                      ],
                    ),
                    span(
                      classes:
                          "px-3 py-1 rounded-md bg-surface-container-high text-secondary font-label-mono text-label-mono border border-secondary/20",
                      [
                        .text("Offline Data"),
                      ],
                    ),
                  ],
                ),
                div(
                  classes: "pt-4 flex flex-wrap gap-3",
                  [
                    a(
                      classes:
                          "inline-flex items-center gap-2 px-6 py-3 rounded-lg bg-primary-container text-on-primary-container font-body-md text-body-md font-semibold hover:bg-primary transition-all shadow-[0_0_20px_rgba(77,142,255,0.3)] group",
                      href: "https://play.google.com/store/apps/details?id=com.brothers.prime",
                      attributes: {
                        "target": "_blank",
                        "rel": "noopener noreferrer",
                        "aria-label": "Download Prime for Android from Google Play",
                      },
                      [
                        span(classes: "material-symbols-outlined text-lg", [
                          .text("android"),
                        ]),
                        span([
                          .text("Android"),
                        ]),
                        span(
                          classes: "material-symbols-outlined text-base group-hover:translate-x-1 transition-transform",
                          [
                            .text("open_in_new"),
                          ],
                        ),
                      ],
                    ),
                    a(
                      classes:
                          "inline-flex items-center gap-2 px-6 py-3 rounded-lg bg-surface-container-high text-on-surface font-body-md text-body-md font-semibold border border-outline-variant/40 hover:border-secondary/60 hover:text-secondary transition-all group",
                      href: "https://apps.apple.com/us/app/prime/id6758918919",
                      attributes: {
                        "target": "_blank",
                        "rel": "noopener noreferrer",
                        "aria-label": "Download Prime for iOS from the App Store",
                      },
                      [
                        svg(
                          viewBox: "0 0 384 512",
                          classes: "w-5 h-5 fill-current",
                          attributes: {
                            "aria-hidden": "true",
                          },
                          [
                            path(
                              d: "M318.7 268.7c-.2-36.7 16.4-64.4 50-84.8-18.8-26.9-47.2-41.7-84.7-44.6-35.5-2.8-74.3 20.7-88.5 20.7-15 0-49.4-19.7-76.4-19.7C63.3 141.2 4 184.8 4 273.5c0 26.9 4.9 54.6 14.8 83.1 13.2 36.7 60.8 126.7 110.5 125.2 26-.6 44.3-18.4 78.2-18.4 32.9 0 49.8 18.4 78.8 18.4 50.1-.7 93.3-82.5 105.9-119.3-67.1-31.6-73.5-93.3-73.5-95.6zm-23.2-164.2c27.3-32.4 24.8-61.9 24-72.5-24.1 1.4-52 16.4-67.9 34.9-17.5 19.8-27.8 44.3-25.6 71.9 26.1 2 49.9-11.4 69.5-34.3z",
                              [],
                            ),
                          ],
                        ),
                        span([
                          .text("iOS"),
                        ]),
                        span(
                          classes: "material-symbols-outlined text-base group-hover:translate-x-1 transition-transform",
                          [
                            .text("open_in_new"),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            div(
              classes: "lg:col-span-6 relative flex items-center justify-center px-2 pt-2 pb-12 sm:p-6 sm:pb-16",
              [
                div(
                  classes:
                      "w-full max-w-lg overflow-hidden rounded-2xl border border-outline-variant/40 bg-surface-container-lowest shadow-2xl",
                  [
                    img(
                      classes: "block w-full h-auto",
                      src: "assets/images/prime/cover1.png",
                      alt: "Prime medical education platform overview",
                      loading: .lazy,
                    ),
                  ],
                ),
                div(
                  classes: "absolute -bottom-2 right-0 sm:right-2 w-28 sm:w-36",
                  [
                    img(
                      classes: "block w-full h-auto",
                      src: "assets/images/prime/image8.png",
                      alt: "Prime medical education mobile learning screen",
                      loading: .lazy,
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
