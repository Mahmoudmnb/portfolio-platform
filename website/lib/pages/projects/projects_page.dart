import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../core/components/app_footer.dart';
import '../../core/components/app_header.dart';

class ProjectsPage extends StatelessComponent {
  const ProjectsPage();
  @override
  Component build(BuildContext context) {
    return .fragment([
      Document.html(attributes: const {'class': 'dark'}),
      Document.head(
        title: 'Projects | Brothers-Tech',
        meta: {
          'description': 'Explore mobile, web, and desktop products designed and deployed by Brothers-Tech.',
        },
      ),
      Document.body(
        attributes: {'class': "bg-background font-body-md text-on-surface antialiased min-h-screen flex flex-col"},
      ),
      Component.fragment([
        AppHeader(
          tabs: [
            (name: "Home", url: "/", isSelected: false),
            (name: "Services", url: "/services", isSelected: false),
            (name: "Projects", url: "/projects", isSelected: true),
            (name: "About", url: "/about", isSelected: false),
            (name: "Contact", url: "/contact", isSelected: false),
          ],
        ),
        main_(
          classes: "w-full pt-20 bg-background flex-1",
          [
            div(
              classes: "flex flex-col w-full",
              [
                section(
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
                              classes:
                                  "font-label-mono text-label-mono-xs uppercase tracking-widest text-secondary font-medium",
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
                ),
                section(
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
                                      href:
                                          "https://play.google.com/store/apps/details?id=com.brothers.alsaad_mosque_institute",
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
                ),
                section(
                  classes: "w-full max-w-7xl mx-auto px-6 sm:px-8 mb-24",
                  [
                    div(
                      id: "projects-grid",
                      classes: "grid grid-cols-1 md:grid-cols-2 gap-8",
                      [
                        article(
                          classes:
                              "project-item rounded-xl bg-surface-container-low border border-outline-variant/30 hover:border-primary/50 transition-all duration-300 flex flex-col overflow-hidden group shadow-lg",
                          attributes: {
                            "data-categories": "mobile",
                          },
                          [
                            div(
                              classes:
                                  "relative h-64 overflow-hidden border-b border-outline-variant/20 bg-surface-container-high",
                              [
                                img(
                                  classes:
                                      "h-full w-full object-cover transition-transform duration-500 group-hover:scale-[1.02]",
                                  alt: "Prime medical education platform on desktop and mobile devices",
                                  loading: .lazy,
                                  src: "assets/images/prime/prime_all.png",
                                  attributes: {
                                    "decoding": "async",
                                  },
                                ),
                              ],
                            ),
                            div(
                              classes: "p-6 flex flex-col flex-1 justify-between space-y-4",
                              [
                                div(
                                  [
                                    div(
                                      classes: "flex items-center justify-between mb-2",
                                      [
                                        span(
                                          classes:
                                              "font-label-mono text-label-mono-xs text-secondary uppercase font-semibold",
                                          [
                                            .text("Mobile • iOS & Android"),
                                          ],
                                        ),
                                        span(
                                          classes: "font-label-mono text-label-mono-xs text-on-surface-variant",
                                          [
                                            .text("MEDICAL EDUCATION"),
                                          ],
                                        ),
                                      ],
                                    ),
                                    h4(
                                      classes:
                                          "font-headline-sm text-headline-sm text-on-surface font-semibold group-hover:text-primary transition-colors",
                                      [
                                        .text(" Prime - Medical Education Platform "),
                                      ],
                                    ),
                                    p(
                                      classes: "font-body-md text-body-md text-on-surface-variant mt-2 leading-relaxed",
                                      [
                                        .text(
                                          " Mobile learning platform for medical students at Aleppo University. ",
                                        ),
                                      ],
                                    ),
                                    ul(
                                      classes:
                                          "mt-3 space-y-1.5 font-body-sm text-body-sm text-on-surface-variant leading-relaxed",
                                      [
                                        li(
                                          classes: "flex gap-2",
                                          [
                                            span(
                                              classes: "text-secondary",
                                              [
                                                .text("•"),
                                              ],
                                            ),
                                            span(
                                              [
                                                .text(
                                                  "Built question banks, previous exams, videos, PDFs, and learning resources.",
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        li(
                                          classes: "flex gap-2",
                                          [
                                            span(
                                              classes: "text-secondary",
                                              [
                                                .text("•"),
                                              ],
                                            ),
                                            span(
                                              [
                                                .text(
                                                  "Integrated an AI assistant and offline content access.",
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        li(
                                          classes: "flex gap-2",
                                          [
                                            span(
                                              classes: "text-secondary",
                                              [
                                                .text("•"),
                                              ],
                                            ),
                                            span(
                                              [
                                                .text("Implemented content encryption."),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                div(
                                  classes: "pt-2",
                                  [
                                    div(
                                      classes: "flex flex-wrap gap-1.5 mb-4",
                                      [
                                        span(
                                          classes:
                                              "px-2 py-0.5 rounded bg-surface-container font-label-mono text-[11px] text-primary",
                                          [
                                            .text("AI Integration"),
                                          ],
                                        ),
                                        span(
                                          classes:
                                              "px-2 py-0.5 rounded bg-surface-container font-label-mono text-[11px] text-primary",
                                          [
                                            .text("Encryption"),
                                          ],
                                        ),
                                        span(
                                          classes:
                                              "px-2 py-0.5 rounded bg-surface-container font-label-mono text-[11px] text-primary",
                                          [
                                            .text("Videos & PDFs"),
                                          ],
                                        ),
                                        span(
                                          classes:
                                              "px-2 py-0.5 rounded bg-surface-container font-label-mono text-[11px] text-primary",
                                          [
                                            .text("Offline Access"),
                                          ],
                                        ),
                                      ],
                                    ),
                                    div(
                                      classes: "flex flex-wrap gap-3",
                                      [
                                        a(
                                          classes:
                                              "inline-flex items-center gap-2 px-4 py-2 rounded-lg bg-primary-container text-on-primary-container font-body-md text-body-sm font-semibold hover:bg-primary transition-all shadow-[0_0_20px_rgba(77,142,255,0.3)] group/store-android",
                                          href: "https://play.google.com/store/apps/details?id=com.brothers.prime",
                                          target: .blank,
                                          attributes: {
                                            "rel": "noopener noreferrer",
                                            "aria-label": "Download Prime for Android from Google Play",
                                          },
                                          [
                                            span(
                                              classes: "material-symbols-outlined text-[18px]",
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
                                              classes:
                                                  "material-symbols-outlined text-[15px] group-hover/store-android:translate-x-1 transition-transform",
                                              [
                                                .text("open_in_new"),
                                              ],
                                            ),
                                          ],
                                        ),
                                        a(
                                          classes:
                                              "inline-flex items-center gap-2 px-4 py-2 rounded-lg bg-surface-container-high text-on-surface font-body-md text-body-sm font-semibold border border-outline-variant/40 hover:border-secondary/60 hover:text-secondary transition-all group/store-ios",
                                          href: "https://apps.apple.com/us/app/prime/id6758918919",
                                          target: .blank,
                                          attributes: {
                                            "rel": "noopener noreferrer",
                                            "aria-label": "Download Prime for iOS from the App Store",
                                          },
                                          [
                                            svg(
                                              classes: "w-[18px] h-[18px] fill-current",
                                              attributes: {
                                                "aria-hidden": "true",
                                                "viewBox": "0 0 384 512",
                                              },
                                              [
                                                path(
                                                  d: "M318.7 268.7c-.2-36.7 16.4-64.4 50-84.8-18.8-26.9-47.2-41.7-84.7-44.6-35.5-2.8-74.3 20.7-88.5 20.7-15 0-49.4-19.7-76.4-19.7C63.3 141.2 4 184.8 4 273.5c0 26.9 4.9 54.6 14.8 83.1 13.2 36.7 60.8 126.7 110.5 125.2 26-.6 44.3-18.4 78.2-18.4 32.9 0 49.8 18.4 78.8 18.4 50.1-.7 93.3-82.5 105.9-119.3-67.1-31.6-73.5-93.3-73.5-95.6zm-23.2-164.2c27.3-32.4 24.8-61.9 24-72.5-24.1 1.4-52 16.4-67.9 34.9-17.5 19.8-27.8 44.3-25.6 71.9 26.1 2 49.9-11.4 69.5-34.3z",
                                                  [],
                                                ),
                                              ],
                                            ),
                                            span(
                                              [
                                                .text("iOS"),
                                              ],
                                            ),
                                            span(
                                              classes:
                                                  "material-symbols-outlined text-[15px] group-hover/store-ios:translate-x-1 transition-transform",
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
                              ],
                            ),
                          ],
                        ),
                        article(
                          classes:
                              "project-item rounded-xl bg-surface-container-low border border-outline-variant/30 hover:border-primary/50 transition-all duration-300 flex flex-col overflow-hidden group shadow-lg",
                          attributes: {
                            "data-categories": "mobile",
                          },
                          [
                            div(
                              classes:
                                  "relative h-64 overflow-hidden border-b border-outline-variant/20 bg-surface-container-high",
                              [
                                img(
                                  classes:
                                      "h-full w-full object-cover transition-transform duration-500 group-hover:scale-[1.02]",
                                  alt: "Ala Al-Nadha multi-service delivery platform on desktop and mobile devices",
                                  src: "assets/images/al-nadha/al-nadha_all.png",
                                  loading: .lazy,
                                  attributes: {
                                    "decoding": "async",
                                  },
                                ),
                              ],
                            ),
                            div(
                              classes: "p-6 flex flex-col flex-1 justify-between space-y-4",
                              [
                                div(
                                  [
                                    div(
                                      classes: "flex items-center justify-between mb-2",
                                      [
                                        span(
                                          classes:
                                              "font-label-mono text-label-mono-xs text-secondary uppercase font-semibold",
                                          [
                                            .text("Mobile • iOS & Android"),
                                          ],
                                        ),
                                        span(
                                          classes: "font-label-mono text-label-mono-xs text-on-surface-variant",
                                          [
                                            .text("DELIVERY PLATFORM"),
                                          ],
                                        ),
                                      ],
                                    ),
                                    h4(
                                      classes:
                                          "font-headline-sm text-headline-sm text-on-surface font-semibold group-hover:text-primary transition-colors",
                                      [
                                        span(
                                          attributes: {
                                            "dir": "rtl",
                                            "lang": "ar",
                                          },
                                          [
                                            .text("الندهة ع"),
                                          ],
                                        ),
                                        span(
                                          attributes: {
                                            "dir": "ltr",
                                          },
                                          [
                                            .text("| Ala Al-Nadha — Multi-Service Delivery Platform"),
                                          ],
                                        ),
                                      ],
                                    ),
                                    p(
                                      classes: "font-body-md text-body-md text-on-surface-variant mt-2 leading-relaxed",
                                      [
                                        .text(
                                          " Multi-service platform for food delivery, grocery shopping, and cleaning services across Aleppo. ",
                                        ),
                                      ],
                                    ),
                                    ul(
                                      classes:
                                          "mt-3 space-y-1.5 font-body-sm text-body-sm text-on-surface-variant leading-relaxed",
                                      [
                                        li(
                                          classes: "flex gap-2",
                                          [
                                            span(
                                              classes: "text-secondary",
                                              [
                                                .text("•"),
                                              ],
                                            ),
                                            span(
                                              [
                                                .text(
                                                  "Developed restaurant, supermarket, and cleaning-service ordering flows within one application.",
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        li(
                                          classes: "flex gap-2",
                                          [
                                            span(
                                              classes: "text-secondary",
                                              [
                                                .text("•"),
                                              ],
                                            ),
                                            span(
                                              [
                                                .text(
                                                  "Built smart voice search that converts natural Arabic speech into relevant stores, products, and search keywords.",
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        li(
                                          classes: "flex gap-2",
                                          [
                                            span(
                                              classes: "text-secondary",
                                              [
                                                .text("•"),
                                              ],
                                            ),
                                            span(
                                              [
                                                .text(
                                                  "Implemented location-based delivery, order management, offers, and a streamlined experience.",
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                div(
                                  classes: "pt-2",
                                  [
                                    div(
                                      classes: "flex flex-wrap gap-1.5 mb-4",
                                      [
                                        span(
                                          classes:
                                              "px-2 py-0.5 rounded bg-surface-container font-label-mono text-[11px] text-primary",
                                          [
                                            .text("Voice Search"),
                                          ],
                                        ),
                                        span(
                                          classes:
                                              "px-2 py-0.5 rounded bg-surface-container font-label-mono text-[11px] text-primary",
                                          [
                                            .text("Location Services"),
                                          ],
                                        ),
                                        span(
                                          classes:
                                              "px-2 py-0.5 rounded bg-surface-container font-label-mono text-[11px] text-primary",
                                          [
                                            .text("Order Management"),
                                          ],
                                        ),
                                      ],
                                    ),
                                    div(
                                      classes: "flex flex-wrap gap-3",
                                      [
                                        a(
                                          classes:
                                              "inline-flex items-center gap-2 px-4 py-2 rounded-lg bg-primary-container text-on-primary-container font-body-md text-body-sm font-semibold hover:bg-primary transition-all shadow-[0_0_20px_rgba(77,142,255,0.3)] group/alnadha-android",
                                          href: "https://play.google.com/store/apps/details?id=com.alnadha.app",
                                          target: .blank,
                                          attributes: {
                                            "rel": "noopener noreferrer",
                                            "aria-label": "Download Ala Al-Nadha for Android from Google Play",
                                          },
                                          [
                                            span(
                                              classes: "material-symbols-outlined text-[18px]",
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
                                              classes:
                                                  "material-symbols-outlined text-[15px] group-hover/alnadha-android:translate-x-1 transition-transform",
                                              [
                                                .text("open_in_new"),
                                              ],
                                            ),
                                          ],
                                        ),
                                        a(
                                          classes:
                                              "inline-flex items-center gap-2 px-4 py-2 rounded-lg bg-surface-container-high text-on-surface font-body-md text-body-sm font-semibold border border-outline-variant/40 hover:border-secondary/60 hover:text-secondary transition-all group/alnadha-ios",
                                          href: "https://play.google.com/store/apps/details?id=com.alnadha.app",
                                          target: .blank,

                                          attributes: {
                                            "rel": "noopener noreferrer",
                                            "aria-label": "Open the provided Ala Al-Nadha iOS store link",
                                          },
                                          [
                                            svg(
                                              classes: "w-[18px] h-[18px] fill-current",
                                              attributes: {
                                                "aria-hidden": "true",
                                                "viewBox": "0 0 384 512",
                                              },
                                              [
                                                path(
                                                  d: "M318.7 268.7c-.2-36.7 16.4-64.4 50-84.8-18.8-26.9-47.2-41.7-84.7-44.6-35.5-2.8-74.3 20.7-88.5 20.7-15 0-49.4-19.7-76.4-19.7C63.3 141.2 4 184.8 4 273.5c0 26.9 4.9 54.6 14.8 83.1 13.2 36.7 60.8 126.7 110.5 125.2 26-.6 44.3-18.4 78.2-18.4 32.9 0 49.8 18.4 78.8 18.4 50.1-.7 93.3-82.5 105.9-119.3-67.1-31.6-73.5-93.3-73.5-95.6zm-23.2-164.2c27.3-32.4 24.8-61.9 24-72.5-24.1 1.4-52 16.4-67.9 34.9-17.5 19.8-27.8 44.3-25.6 71.9 26.1 2 49.9-11.4 69.5-34.3z",
                                                  [],
                                                ),
                                              ],
                                            ),
                                            span(
                                              [
                                                .text("iOS"),
                                              ],
                                            ),
                                            span(
                                              classes:
                                                  "material-symbols-outlined text-[15px] group-hover/alnadha-ios:translate-x-1 transition-transform",
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
                              ],
                            ),
                          ],
                        ),
                        article(
                          classes:
                              "project-item rounded-xl bg-surface-container-low border border-outline-variant/30 hover:border-primary/50 transition-all duration-300 flex flex-col overflow-hidden group shadow-lg",
                          attributes: {
                            "data-categories": "mobile",
                          },
                          [
                            div(
                              classes:
                                  "relative h-64 overflow-hidden border-b border-outline-variant/20 bg-surface-container-high",
                              [
                                img(
                                  classes:
                                      "h-full w-full object-cover transition-transform duration-500 group-hover:scale-[1.02]",
                                  alt: "Drisavo driving school booking platform on desktop and mobile devices",
                                  src: "assets/images/drisavo/drisavo-all.png",
                                  loading: .lazy,
                                  attributes: {
                                    "decoding": "async",
                                  },
                                ),
                              ],
                            ),
                            div(
                              classes: "p-6 flex flex-col flex-1 justify-between space-y-4",
                              [
                                div(
                                  [
                                    div(
                                      classes: "flex items-center justify-between mb-2",
                                      [
                                        span(
                                          classes:
                                              "font-label-mono text-label-mono-xs text-secondary uppercase font-semibold",
                                          [
                                            .text("Mobile • iOS"),
                                          ],
                                        ),
                                        span(
                                          classes: "font-label-mono text-label-mono-xs text-on-surface-variant",
                                          [
                                            .text("CANADIAN MARKET"),
                                          ],
                                        ),
                                      ],
                                    ),
                                    h4(
                                      classes:
                                          "font-headline-sm text-headline-sm text-on-surface font-semibold group-hover:text-primary transition-colors",
                                      [
                                        .text(" Drisavo - Driving School Booking Platform "),
                                      ],
                                    ),
                                    p(
                                      classes: "font-body-md text-body-md text-on-surface-variant mt-2 leading-relaxed",
                                      [
                                        .text(" Driving lesson booking platform for the Canadian market. "),
                                      ],
                                    ),
                                    ul(
                                      classes:
                                          "mt-3 space-y-1.5 font-body-sm text-body-sm text-on-surface-variant leading-relaxed",
                                      [
                                        li(
                                          classes: "flex gap-2",
                                          [
                                            span(
                                              classes: "text-secondary",
                                              [
                                                .text("•"),
                                              ],
                                            ),
                                            span(
                                              [
                                                .text(
                                                  "Built dedicated student and instructor experiences with real-time lesson booking.",
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        li(
                                          classes: "flex gap-2",
                                          [
                                            span(
                                              classes: "text-secondary",
                                              [
                                                .text("•"),
                                              ],
                                            ),
                                            span(
                                              [
                                                .text(
                                                  "Implemented chat, digital wallet payments, and driving-hour purchases.",
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        li(
                                          classes: "flex gap-2",
                                          [
                                            span(
                                              classes: "text-secondary",
                                              [
                                                .text("•"),
                                              ],
                                            ),
                                            span(
                                              [
                                                .text("Added student progress tracking for parents."),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                div(
                                  classes: "pt-2",
                                  [
                                    div(
                                      classes: "flex flex-wrap gap-1.5 mb-4",
                                      [
                                        span(
                                          classes:
                                              "px-2 py-0.5 rounded bg-surface-container font-label-mono text-[11px] text-primary",
                                          [
                                            .text("Flutter"),
                                          ],
                                        ),
                                        span(
                                          classes:
                                              "px-2 py-0.5 rounded bg-surface-container font-label-mono text-[11px] text-primary",
                                          [
                                            .text("Dart"),
                                          ],
                                        ),
                                        span(
                                          classes:
                                              "px-2 py-0.5 rounded bg-surface-container font-label-mono text-[11px] text-primary",
                                          [
                                            .text("REST APIs"),
                                          ],
                                        ),
                                        span(
                                          classes:
                                              "px-2 py-0.5 rounded bg-surface-container font-label-mono text-[11px] text-primary",
                                          [
                                            .text("Chat"),
                                          ],
                                        ),
                                        span(
                                          classes:
                                              "px-2 py-0.5 rounded bg-surface-container font-label-mono text-[11px] text-primary",
                                          [
                                            .text("Payments"),
                                          ],
                                        ),
                                        span(
                                          classes:
                                              "px-2 py-0.5 rounded bg-surface-container font-label-mono text-[11px] text-primary",
                                          [
                                            .text("Real-time Features"),
                                          ],
                                        ),
                                      ],
                                    ),
                                    a(
                                      classes:
                                          "inline-flex items-center gap-2 px-4 py-2 rounded-lg bg-surface-container-high text-on-surface font-body-md text-body-sm font-semibold border border-outline-variant/40 hover:border-secondary/60 hover:text-secondary transition-all group/drisavo-ios",
                                      href: "https://apps.apple.com/us/app/drisavo/id6759968663",
                                      target: .blank,
                                      attributes: {
                                        "rel": "noopener noreferrer",
                                        "aria-label": "Download Drisavo for iOS from the App Store",
                                      },
                                      [
                                        svg(
                                          classes: "w-[18px] h-[18px] fill-current",
                                          attributes: {
                                            "aria-hidden": "true",
                                            "viewBox": "0 0 384 512",
                                          },
                                          [
                                            path(
                                              d: "M318.7 268.7c-.2-36.7 16.4-64.4 50-84.8-18.8-26.9-47.2-41.7-84.7-44.6-35.5-2.8-74.3 20.7-88.5 20.7-15 0-49.4-19.7-76.4-19.7C63.3 141.2 4 184.8 4 273.5c0 26.9 4.9 54.6 14.8 83.1 13.2 36.7 60.8 126.7 110.5 125.2 26-.6 44.3-18.4 78.2-18.4 32.9 0 49.8 18.4 78.8 18.4 50.1-.7 93.3-82.5 105.9-119.3-67.1-31.6-73.5-93.3-73.5-95.6zm-23.2-164.2c27.3-32.4 24.8-61.9 24-72.5-24.1 1.4-52 16.4-67.9 34.9-17.5 19.8-27.8 44.3-25.6 71.9 26.1 2 49.9-11.4 69.5-34.3z",
                                              [],
                                            ),
                                          ],
                                        ),
                                        span(
                                          [
                                            .text("iOS"),
                                          ],
                                        ),
                                        span(
                                          classes:
                                              "material-symbols-outlined text-[15px] group-hover/drisavo-ios:translate-x-1 transition-transform",
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
                          ],
                        ),
                        article(
                          classes:
                              "project-item rounded-xl bg-surface-container-low border border-outline-variant/30 hover:border-primary/50 transition-all duration-300 flex flex-col overflow-hidden group shadow-lg",
                          attributes: {
                            "data-categories": "mobile",
                          },
                          [
                            div(
                              classes:
                                  "relative h-64 overflow-hidden border-b border-outline-variant/20 bg-surface-container-high",
                              [
                                img(
                                  classes:
                                      "h-full w-full object-cover transition-transform duration-500 group-hover:scale-[1.02]",
                                  alt: "Prime Bac baccalaureate learning platform on desktop and mobile devices",
                                  loading: .lazy,
                                  src: "assets/images/prime-bac/drisavo-bac-all.png",
                                  attributes: {
                                    "decoding": "async",
                                  },
                                ),
                              ],
                            ),
                            div(
                              classes: "p-6 flex flex-col flex-1 justify-between space-y-4",
                              [
                                div(
                                  [
                                    div(
                                      classes: "flex items-center justify-between mb-2",
                                      [
                                        span(
                                          classes:
                                              "font-label-mono text-label-mono-xs text-secondary uppercase font-semibold",
                                          [
                                            .text("Learning Platform"),
                                          ],
                                        ),
                                        span(
                                          classes: "font-label-mono text-label-mono-xs text-on-surface-variant",
                                          [
                                            .text("BACCALAUREATE"),
                                          ],
                                        ),
                                      ],
                                    ),
                                    h4(
                                      classes:
                                          "font-headline-sm text-headline-sm text-on-surface font-semibold group-hover:text-primary transition-colors",
                                      [
                                        .text(" Prime Bac - Baccalaureate Learning Platform "),
                                      ],
                                    ),
                                    p(
                                      classes: "font-body-md text-body-md text-on-surface-variant mt-2 leading-relaxed",
                                      [
                                        .text(
                                          " Educational platform for Baccalaureate students focused on exam preparation and study organization. ",
                                        ),
                                      ],
                                    ),
                                    ul(
                                      classes:
                                          "mt-3 space-y-1.5 font-body-sm text-body-sm text-on-surface-variant leading-relaxed",
                                      [
                                        li(
                                          classes: "flex gap-2",
                                          [
                                            span(
                                              classes: "text-secondary",
                                              [
                                                .text("•"),
                                              ],
                                            ),
                                            span(
                                              [
                                                .text(
                                                  "Developed chapter, section, and full-course tests with interactive learning resources.",
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        li(
                                          classes: "flex gap-2",
                                          [
                                            span(
                                              classes: "text-secondary",
                                              [
                                                .text("•"),
                                              ],
                                            ),
                                            span(
                                              [
                                                .text(
                                                  "Implemented student–instructor communication and study task scheduling.",
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        li(
                                          classes: "flex gap-2",
                                          [
                                            span(
                                              classes: "text-secondary",
                                              [
                                                .text("•"),
                                              ],
                                            ),
                                            span(
                                              [
                                                .text(
                                                  "Extended the Prime platform with productivity and learning-management features.",
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                div(
                                  classes: "pt-2",
                                  [
                                    div(
                                      classes: "flex flex-wrap gap-1.5",
                                      [
                                        span(
                                          classes:
                                              "px-2 py-0.5 rounded bg-surface-container font-label-mono text-[11px] text-primary",
                                          [
                                            .text("Real-time Communication"),
                                          ],
                                        ),
                                        span(
                                          classes:
                                              "px-2 py-0.5 rounded bg-surface-container font-label-mono text-[11px] text-primary",
                                          [
                                            .text("Task Management"),
                                          ],
                                        ),
                                        span(
                                          classes:
                                              "px-2 py-0.5 rounded bg-surface-container font-label-mono text-[11px] text-primary",
                                          [
                                            .text("Offline Access"),
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
                        article(
                          classes:
                              "project-item rounded-xl bg-surface-container-low border border-outline-variant/30 hover:border-primary/50 transition-all duration-300 flex flex-col overflow-hidden group shadow-lg",
                          attributes: {
                            "data-categories": "mobile",
                          },
                          [
                            div(
                              classes:
                                  "relative h-64 overflow-hidden border-b border-outline-variant/20 bg-surface-container-high",
                              [
                                img(
                                  classes:
                                      "h-full w-full object-cover transition-transform duration-500 group-hover:scale-[1.02]",
                                  alt: "Elegance e-commerce shopping app on desktop and mobile devices",
                                  src: "assets/images/elegance/elegance-all.png",
                                  loading: .lazy,
                                  attributes: {
                                    "decoding": "async",
                                  },
                                ),
                              ],
                            ),
                            div(
                              classes: "p-6 flex flex-col flex-1 justify-between space-y-4",
                              [
                                div(
                                  [
                                    div(
                                      classes: "flex items-center justify-between mb-2",
                                      [
                                        span(
                                          classes:
                                              "font-label-mono text-label-mono-xs text-secondary uppercase font-semibold",
                                          [
                                            .text("Mobile • iOS & Android"),
                                          ],
                                        ),
                                        span(
                                          classes: "font-label-mono text-label-mono-xs text-on-surface-variant",
                                          [
                                            .text("E-COMMERCE"),
                                          ],
                                        ),
                                      ],
                                    ),
                                    h4(
                                      classes:
                                          "font-headline-sm text-headline-sm text-on-surface font-semibold group-hover:text-primary transition-colors",
                                      [
                                        .text(" Elegance - E-Commerce Shop App "),
                                      ],
                                    ),
                                    p(
                                      classes: "font-body-md text-body-md text-on-surface-variant mt-2 leading-relaxed",
                                      [
                                        .text(
                                          " A polished cross-platform shopping app that lets customers browse products, shop offline, manage their cart, and complete secure purchases through PayPal. ",
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                div(
                                  classes: "pt-2",
                                  [
                                    div(
                                      classes: "flex flex-wrap gap-1.5",
                                      [
                                        span(
                                          classes:
                                              "px-2 py-0.5 rounded bg-surface-container font-label-mono text-[11px] text-primary",
                                          [
                                            .text("Offline Access"),
                                          ],
                                        ),
                                        span(
                                          classes:
                                              "px-2 py-0.5 rounded bg-surface-container font-label-mono text-[11px] text-primary",
                                          [
                                            .text("PayPal Payment"),
                                          ],
                                        ),
                                        span(
                                          classes:
                                              "px-2 py-0.5 rounded bg-surface-container font-label-mono text-[11px] text-primary",
                                          [
                                            .text("Android/iOS"),
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
                ),
                section(
                  classes: "w-full bg-surface-container-lowest border-y border-outline-variant/20 py-16 mb-20",
                  [
                    div(
                      classes: "max-w-7xl mx-auto px-6 sm:px-8",
                      [
                        div(
                          classes: "mb-10 flex flex-col sm:flex-row sm:items-end justify-between gap-4",
                          [
                            div(
                              [
                                span(
                                  classes:
                                      "font-label-mono text-label-mono-xs text-secondary uppercase tracking-widest font-semibold",
                                  [
                                    .text("Engineered Precision"),
                                  ],
                                ),
                                h3(
                                  classes: "font-headline-md text-headline-md text-on-surface font-semibold mt-1",
                                  [
                                    .text(" Multi-Disciplinary Delivery "),
                                  ],
                                ),
                              ],
                            ),
                            p(
                              classes: "font-body-sm text-body-sm text-on-surface-variant max-w-md",
                              [
                                .text(
                                  " Every platform engineered by Brothers-Tech is built with production-grade telemetry, strict code audits, and uncompromising uptime standards. ",
                                ),
                              ],
                            ),
                          ],
                        ),
                        div(
                          classes: "grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6",
                          [
                            div(
                              classes:
                                  "p-6 rounded-xl bg-surface-container-low border border-outline-variant/30 hover:border-secondary/40 transition-colors space-y-3",
                              [
                                div(
                                  classes:
                                      "w-10 h-10 rounded-lg bg-surface-container-high flex items-center justify-center text-secondary",
                                  [
                                    span(
                                      classes: "material-symbols-outlined text-[24px]",
                                      [
                                        .text("phone_android"),
                                      ],
                                    ),
                                  ],
                                ),
                                h4(
                                  classes: "font-headline-sm text-headline-sm text-on-surface font-semibold",
                                  [
                                    .text(" Mobile Apps "),
                                  ],
                                ),
                                p(
                                  classes: "font-body-sm text-body-sm text-on-surface-variant leading-relaxed",
                                  [
                                    .text(
                                      " Native and cross-platform mobile apps for iOS and Android with 60fps gesture fidelity. ",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            div(
                              classes:
                                  "p-6 rounded-xl bg-surface-container-low border border-outline-variant/30 hover:border-secondary/40 transition-colors space-y-3",
                              [
                                div(
                                  classes:
                                      "w-10 h-10 rounded-lg bg-surface-container-high flex items-center justify-center text-primary",
                                  [
                                    span(
                                      classes: "material-symbols-outlined text-[24px]",
                                      [
                                        .text("web"),
                                      ],
                                    ),
                                  ],
                                ),
                                h4(
                                  classes: "font-headline-sm text-headline-sm text-on-surface font-semibold",
                                  [
                                    .text(" Web Platforms "),
                                  ],
                                ),
                                p(
                                  classes: "font-body-sm text-body-sm text-on-surface-variant leading-relaxed",
                                  [
                                    .text(
                                      " Complex web applications, responsive SaaS portals, and high-performance digital platforms. ",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            div(
                              classes:
                                  "p-6 rounded-xl bg-surface-container-low border border-outline-variant/30 hover:border-secondary/40 transition-colors space-y-3",
                              [
                                div(
                                  classes:
                                      "w-10 h-10 rounded-lg bg-surface-container-high flex items-center justify-center text-secondary",
                                  [
                                    span(
                                      classes: "material-symbols-outlined text-[24px]",
                                      [
                                        .text("desktop_windows"),
                                      ],
                                    ),
                                  ],
                                ),
                                h4(
                                  classes: "font-headline-sm text-headline-sm text-on-surface font-semibold",
                                  [
                                    .text(" Desktop Systems "),
                                  ],
                                ),
                                p(
                                  classes: "font-body-sm text-body-sm text-on-surface-variant leading-relaxed",
                                  [
                                    .text(
                                      " Native macOS and Windows administrative tools, terminals, and offline-capable software. ",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            div(
                              classes:
                                  "p-6 rounded-xl bg-surface-container-low border border-outline-variant/30 hover:border-secondary/40 transition-colors space-y-3",
                              [
                                div(
                                  classes:
                                      "w-10 h-10 rounded-lg bg-surface-container-high flex items-center justify-center text-primary",
                                  [
                                    span(
                                      classes: "material-symbols-outlined text-[24px]",
                                      [
                                        .text("dns"),
                                      ],
                                    ),
                                  ],
                                ),
                                h4(
                                  classes: "font-headline-sm text-headline-sm text-on-surface font-semibold",
                                  [
                                    .text(" Secure Data & Integrations "),
                                  ],
                                ),
                                p(
                                  classes: "font-body-sm text-body-sm text-on-surface-variant leading-relaxed",
                                  [
                                    .text(
                                      " Reliable data management, secure connections with business tools, and systems designed to grow with your product. ",
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
                section(
                  classes: "w-full max-w-7xl mx-auto px-6 sm:px-8 mb-24",
                  [
                    div(
                      classes:
                          "relative rounded-2xl bg-gradient-to-r from-surface-container to-surface-container-low border border-outline-variant/40 p-10 sm:p-14 overflow-hidden text-center flex flex-col items-center justify-center shadow-2xl",
                      [
                        div(
                          classes:
                              "absolute -top-24 left-1/2 -translate-x-1/2 w-96 h-96 bg-primary-container/20 rounded-full blur-[100px] pointer-events-none",
                          [],
                        ),
                        div(
                          classes: "relative z-10 max-w-2xl space-y-6",
                          [
                            h2(
                              classes: "font-headline-lg text-headline-lg text-on-surface font-semibold tracking-tight",
                              [
                                .text(" Have an Idea? Let's Build It Together. "),
                              ],
                            ),
                            p(
                              classes: "font-body-lg text-body-lg text-on-surface-variant leading-relaxed",
                              [
                                .text(
                                  " Whether you're starting something new or scaling an existing product, let's turn your idea into reliable, production-ready software. ",
                                ),
                              ],
                            ),
                            div(
                              classes: "pt-2 flex flex-col sm:flex-row items-center justify-center gap-4",
                              [
                                a(
                                  classes:
                                      "inline-flex items-center justify-center h-12 px-8 rounded-lg bg-primary-container text-on-primary-container font-headline-sm text-body-md font-medium hover:bg-primary transition-all duration-200 shadow-[0_0_24px_rgba(77,142,255,0.4)]",
                                  href: "/contact",
                                  [
                                    .text(" Tell Us About Your Project → "),
                                  ],
                                ),
                              ],
                            ),
                            div(
                              classes:
                                  "flex items-center justify-center gap-2 pt-2 font-label-mono text-label-mono-xs text-secondary font-medium",
                              [
                                span(classes: "w-2 h-2 rounded-full bg-secondary animate-pulse", []),
                                span(
                                  [
                                    .text("Available for new projects"),
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
        ),
        AppFooter(),
      ]),
    ]);
  }
}
