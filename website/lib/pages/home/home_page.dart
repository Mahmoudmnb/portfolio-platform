import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../core/components/app_footer.dart';
import '../../core/components/app_header.dart';

class HomePage extends StatelessComponent {
  const HomePage();
  @override
  Component build(BuildContext context) {
    return .fragment([
      Document.html(attributes: const {'class': 'dark'}),
      Document.head(
        title: 'Brothers-Tech | Software That Moves Businesses Forward',
        meta: {
          'description':
              'Brothers-Tech designs and develops reliable mobile, web, and desktop software for real business needs.',
        },
      ),
      Document.body(
        attributes: {'class': "bg-background font-body-md text-on-surface antialiased min-h-screen flex flex-col"},
      ),
      .fragment([
        AppHeader(
          tabs: [
            (name: "Home", url: "/", isSelected: true),
            (name: "Services", url: "/services", isSelected: false),
            (name: "Projects", url: "/projects", isSelected: false),
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
                ),
                section(
                  classes: "w-full bg-surface-container-lowest border-y border-outline-variant/20 py-8",
                  [
                    div(
                      classes: "max-w-7xl mx-auto px-6 sm:px-8",
                      [
                        div(
                          classes:
                              "grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6 lg:gap-8 divide-y sm:divide-y-0 sm:divide-x divide-outline-variant/20",
                          [
                            div(
                              classes: "flex flex-col space-y-1.5 pt-4 sm:pt-0 sm:px-4 first:px-0",
                              [
                                div(
                                  classes: "flex items-center gap-2",
                                  [
                                    span(
                                      classes: "material-symbols-outlined text-primary text-xl",
                                      [.text("deployed_code")],
                                    ),
                                    span(
                                      classes: "font-headline-sm text-headline-sm text-on-surface font-semibold",
                                      [.text("Real-World Products")],
                                    ),
                                  ],
                                ),
                                p(
                                  classes: "font-body-sm text-body-sm text-on-surface-variant",
                                  [
                                    .text(
                                      " Software built for actual users, stress-tested workflows, and commercial viability. ",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            div(
                              classes: "flex flex-col space-y-1.5 pt-4 sm:pt-0 sm:px-4",
                              [
                                div(
                                  classes: "flex items-center gap-2",
                                  [
                                    span(
                                      classes: "material-symbols-outlined text-secondary text-xl",
                                      [.text("devices")],
                                    ),
                                    span(
                                      classes: "font-headline-sm text-headline-sm text-on-surface font-semibold",
                                      [.text("Multi-Platform")],
                                    ),
                                  ],
                                ),
                                p(
                                  classes:
                                      "font-body-sm text-body-sm text-on-surface-variant font-label-mono text-secondary",
                                  [
                                    .text(" Android • iOS • Web • Desktop "),
                                  ],
                                ),
                              ],
                            ),
                            div(
                              classes: "flex flex-col space-y-1.5 pt-4 sm:pt-0 sm:px-4",
                              [
                                div(
                                  classes: "flex items-center gap-2",
                                  [
                                    span(
                                      classes: "material-symbols-outlined text-primary text-xl",
                                      [.text("account_tree")],
                                    ),
                                    span(
                                      classes: "font-headline-sm text-headline-sm text-on-surface font-semibold",
                                      [.text("End-to-End Dev")],
                                    ),
                                  ],
                                ),
                                p(
                                  classes: "font-body-sm text-body-sm text-on-surface-variant",
                                  [
                                    .text(
                                      " From architectural whiteboard to production deployment and lifecycle support. ",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            div(
                              classes: "flex flex-col space-y-1.5 pt-4 sm:pt-0 sm:px-4",
                              [
                                div(
                                  classes: "flex items-center gap-2",
                                  [
                                    span(
                                      classes: "material-symbols-outlined text-secondary text-xl",
                                      [.text("bolt")],
                                    ),
                                    span(
                                      classes: "font-headline-sm text-headline-sm text-on-surface font-semibold",
                                      [.text("Modern Tech Stack")],
                                    ),
                                  ],
                                ),
                                p(
                                  classes: "font-body-sm text-body-sm text-on-surface-variant",
                                  [
                                    .text(
                                      " Scalable, maintainable, cloud-native architecture without vendor bloat. ",
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
                // services
                section(
                  id: "services",
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
                                span(
                                  classes: "h-1.5 w-1.5 rounded-full bg-secondary",
                                  [],
                                ),
                                span(
                                  [.text("WHAT WE DO")],
                                ),
                              ],
                            ),
                            h2(
                              classes:
                                  "font-headline-lg text-headline-lg lg:text-[44px] lg:leading-[52px] text-on-surface font-semibold tracking-tight",
                              [
                                .text(" Everything You Need to Build Your Product. "),
                              ],
                            ),
                            p(
                              classes: "font-body-lg text-body-lg text-on-surface-variant leading-relaxed",
                              [
                                .text(
                                  " Brothers-Tech takes digital products from initial architecture and concept through robust engineering and global cloud deployment. ",
                                ),
                              ],
                            ),
                          ],
                        ),
                        div(
                          classes: "grid grid-cols-1 md:grid-cols-2 gap-6",
                          [
                            HomeServiceCard(
                              count: 1,
                              title: "Mobile App Development",
                              description:
                                  "High-quality Android and iOS applications designed for rapid performance, native gesture fidelity, and faultless offline resilience.",
                              iconName: "smartphone",
                              chips: ["Android", "iOS", "Cross-platform"],
                            ),
                            HomeServiceCard(
                              count: 2,
                              title: "Web Development",
                              description:
                                  "Modern websites, dynamic web applications, dashboards, and enterprise platforms architected for ultra-low latency and search discovery.",
                              iconName: "web",
                              chips: ["Web Apps", "Dashboards", "Business Platforms"],
                            ),
                            HomeServiceCard(
                              count: 3,
                              title: "Desktop Applications",
                              description:
                                  "Reliable desktop software, administrative terminals, and offline-capable management systems built seamlessly around complex operations.",
                              iconName: "desktop_windows",
                              chips: ["Desktop", "Management Systems", "Business Software"],
                            ),
                            HomeServiceCard(
                              count: 4,
                              title: "UI/UX Design",
                              description:
                                  "Clean and intuitive digital interfaces engineered around real user psychology, rigorous accessibility specs, and brand identity standards.",
                              iconName: "design_services",
                              chips: ["UI", "UX", "Product Design"],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                // selected-work
                section(
                  id: "selected-work",
                  classes: "w-full bg-surface-container-low py-20 lg:py-28 relative",
                  [
                    div(
                      classes: "max-w-7xl mx-auto px-6 sm:px-8",
                      [
                        div(
                          classes: "flex flex-col md:flex-row md:items-end justify-between mb-16 gap-6",
                          [
                            div(
                              classes: "max-w-2xl space-y-4",
                              [
                                div(
                                  classes:
                                      "inline-flex items-center gap-2 font-label-mono text-label-mono uppercase tracking-wider text-secondary",
                                  [
                                    span(classes: "h-1.5 w-1.5 rounded-full bg-secondary", []),
                                    span([
                                      .text("SELECTED WORK"),
                                    ]),
                                  ],
                                ),
                                h2(
                                  classes:
                                      "font-headline-lg text-headline-lg lg:text-[44px] lg:leading-[52px] text-on-surface font-semibold tracking-tight",
                                  [
                                    .text(" Software Built for the Real World. "),
                                  ],
                                ),
                                p(
                                  classes: "font-body-lg text-body-lg text-on-surface-variant",
                                  [
                                    .text(
                                      " Showcase of selected applications and digital platforms engineered by Brothers-Tech. ",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        div(
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
                                      classes:
                                          "font-label-mono text-label-mono text-secondary uppercase tracking-wider",
                                      [
                                        .text(" Featured Project • Education "),
                                      ],
                                    ),
                                    h3(
                                      classes:
                                          "font-headline-lg text-headline-md sm:text-headline-lg text-on-surface font-semibold",
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
                                              classes:
                                                  "material-symbols-outlined text-base group-hover:translate-x-1 transition-transform",
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
                                              classes:
                                                  "material-symbols-outlined text-base group-hover:translate-x-1 transition-transform",
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
                                  classes:
                                      "lg:col-span-6 relative flex items-center justify-center px-2 pt-2 pb-12 sm:p-6 sm:pb-16",
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
                        ),
                        div(
                          classes: "grid grid-cols-1 md:grid-cols-2 gap-8",
                          [
                            div(
                              classes:
                                  "p-8 rounded-2xl bg-surface-container border border-outline-variant/30 hover:border-primary/40 transition-all duration-300 flex flex-col justify-between group",
                              [
                                div(
                                  classes: "space-y-4",
                                  [
                                    div(
                                      classes:
                                          'relative h-72 sm:h-80 rounded-xl bg-surface-container-low border border-outline-variant/30 overflow-hidden group-hover:border-primary/40 transition-colors',
                                      [
                                        div(
                                          classes:
                                              'absolute top-3 left-3 right-3 overflow-hidden rounded-lg border border-outline-variant/40 bg-surface-container-lowest shadow-xl',
                                          [
                                            img(
                                              classes: 'block w-full h-auto',
                                              src: 'assets/images/alsaad/admin-desktop.png',
                                              alt: 'Alsaad Institute administrator desktop application',
                                              loading: .lazy,
                                            ),
                                          ],
                                        ),
                                        div(
                                          classes: 'absolute -bottom-1 left-3 sm:left-4 w-24 sm:w-28',
                                          [
                                            img(
                                              classes: 'block w-full h-auto',
                                              src: 'assets/images/alsaad/user-mobile.png',
                                              alt: 'Alsaad Institute student mobile application',
                                              loading: .lazy,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    div(
                                      classes:
                                          "font-label-mono-xs text-label-mono-xs text-secondary uppercase tracking-wider pt-2",
                                      [
                                        .text(" Quran Institute Management System • Android • Desktop "),
                                      ],
                                    ),
                                    h3(
                                      classes:
                                          "font-headline-md text-headline-md text-on-surface font-semibold group-hover:text-primary transition-colors",
                                      [
                                        .text(" Alsaad Institute "),
                                      ],
                                    ),
                                    p(
                                      classes: "font-body-md text-body-md text-on-surface-variant leading-relaxed",
                                      [
                                        .text(
                                          " A multi-platform institute management system with separate applications for administrators, teachers, and students. ",
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                div(
                                  classes: 'pt-6 flex flex-wrap gap-2',
                                  [
                                    span(
                                      classes:
                                          'px-2.5 py-1 rounded bg-surface-container-high text-on-surface-variant font-label-mono-xs text-label-mono-xs border border-outline-variant/20',
                                      [.text('Admin Portal')],
                                    ),
                                    span(
                                      classes:
                                          'px-2.5 py-1 rounded bg-surface-container-high text-on-surface-variant font-label-mono-xs text-label-mono-xs border border-outline-variant/20',
                                      [.text('Teacher App')],
                                    ),
                                    span(
                                      classes:
                                          'px-2.5 py-1 rounded bg-surface-container-high text-on-surface-variant font-label-mono-xs text-label-mono-xs border border-outline-variant/20',
                                      [.text('Student App')],
                                    ),
                                    span(
                                      classes:
                                          'px-2.5 py-1 rounded bg-surface-container-high text-on-surface-variant font-label-mono-xs text-label-mono-xs border border-outline-variant/20',
                                      [.text('Academic Tracking')],
                                    ),
                                    a(
                                      classes:
                                          'w-fit flex-none mt-2 inline-flex items-center gap-2 px-5 py-2.5 rounded-lg bg-primary-container text-on-primary-container font-body-md text-body-md font-semibold hover:bg-primary transition-all shadow-[0_0_18px_rgba(77,142,255,0.25)] group/store',
                                      href:
                                          'https://play.google.com/store/apps/details?id=com.brothers.alsaad_mosque_institute',
                                      attributes: {
                                        'target': '_blank',
                                        'rel': 'noopener noreferrer',
                                        'aria-label': 'Download Alsaad Institute for Android from Google Play',
                                      },
                                      [
                                        span(
                                          classes: 'material-symbols-outlined text-lg',
                                          [.text('android')],
                                        ),
                                        span([.text('Android')]),
                                        span(
                                          classes:
                                              'material-symbols-outlined text-base group-hover/store:translate-x-1 transition-transform',
                                          [.text('open_in_new')],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            div(
                              classes:
                                  "p-8 rounded-2xl bg-surface-container border border-outline-variant/30 hover:border-secondary/40 transition-all duration-300 flex flex-col justify-between group",
                              [
                                div(
                                  classes: "space-y-4",
                                  [
                                    div(
                                      classes:
                                          "aspect-video rounded-xl bg-surface-container-low border border-outline-variant/30 overflow-hidden group-hover:border-secondary/40 transition-colors",
                                      [
                                        img(
                                          classes: "block w-full h-full object-cover",
                                          src: "assets/images/drisavo/cover.png",
                                          alt: "Drisavo driving school booking platform",
                                          loading: .lazy,
                                        ),
                                      ],
                                    ),
                                    div(
                                      classes:
                                          "font-label-mono-xs text-label-mono-xs text-secondary uppercase tracking-wider pt-2",
                                      [
                                        .text(" Driving School Booking Platform • Canadian Market "),
                                      ],
                                    ),
                                    h3(
                                      classes:
                                          "font-headline-md text-headline-md text-on-surface font-semibold group-hover:text-secondary transition-colors",
                                      [
                                        .text(" Drisavo - Driving School Booking Platform "),
                                      ],
                                    ),
                                    p(
                                      classes: "font-body-md text-body-md text-on-surface-variant leading-relaxed",
                                      [
                                        .text(" Driving lesson booking platform for the Canadian market. "),
                                      ],
                                    ),
                                  ],
                                ),
                                div(
                                  classes: "pt-6 flex flex-wrap gap-2",
                                  [
                                    span(
                                      classes:
                                          "px-2.5 py-1 rounded bg-surface-container-high text-on-surface-variant font-label-mono-xs text-label-mono-xs border border-outline-variant/20",
                                      [
                                        .text("Android/iOS"),
                                      ],
                                    ),
                                    span(
                                      classes:
                                          "px-2.5 py-1 rounded bg-surface-container-high text-on-surface-variant font-label-mono-xs text-label-mono-xs border border-outline-variant/20",
                                      [
                                        .text("Chat"),
                                      ],
                                    ),
                                    span(
                                      classes:
                                          "px-2.5 py-1 rounded bg-surface-container-high text-on-surface-variant font-label-mono-xs text-label-mono-xs border border-outline-variant/20",
                                      [
                                        .text("Payment"),
                                      ],
                                    ),
                                    span(
                                      classes:
                                          "px-2.5 py-1 rounded bg-surface-container-high text-on-surface-variant font-label-mono-xs text-label-mono-xs border border-outline-variant/20",
                                      [
                                        .text("Map Tracking"),
                                      ],
                                    ),
                                    div(
                                      classes: 'basis-full flex flex-wrap items-center gap-3 pt-2',
                                      [
                                        a(
                                          classes:
                                              'w-fit flex-none inline-flex items-center gap-2 px-5 py-2.5 rounded-lg bg-primary-container text-on-primary-container font-body-md text-body-md font-semibold hover:bg-primary transition-all shadow-[0_0_18px_rgba(77,142,255,0.25)] group/android',
                                          href: 'https://play.google.com/store/apps/details?id=com.mkhalid.drisavo',
                                          target: .blank,
                                          attributes: {
                                            'rel': 'noopener noreferrer',
                                            'aria-label': 'Download Drisavo for Android from Google Play',
                                          },
                                          [
                                            span(
                                              classes: 'material-symbols-outlined text-lg',
                                              [.text('android')],
                                            ),
                                            span([.text('Android')]),
                                            span(
                                              classes:
                                                  'material-symbols-outlined text-base group-hover/android:translate-x-1 transition-transform',
                                              [.text('open_in_new')],
                                            ),
                                          ],
                                        ),
                                        a(
                                          classes:
                                              'w-fit flex-none inline-flex items-center gap-2 px-5 py-2.5 rounded-lg bg-surface-container-high text-on-surface font-body-md text-body-md font-semibold border border-outline-variant/40 hover:border-secondary/60 hover:text-secondary transition-all group/store',
                                          href: 'https://apps.apple.com/us/app/drisavo/id6759968663',
                                          target: .blank,
                                          attributes: {
                                            'rel': 'noopener noreferrer',
                                            'aria-label': 'Download Drisavo from the App Store',
                                          },
                                          [
                                            svg(
                                              classes: 'w-5 h-5 fill-current',
                                              viewBox: '0 0 384 512',
                                              attributes: {
                                                'aria-hidden': 'true',
                                              },
                                              [
                                                path(
                                                  d: 'M318.7 268.7c-.2-36.7 16.4-64.4 50-84.8-18.8-26.9-47.2-41.7-84.7-44.6-35.5-2.8-74.3 20.7-88.5 20.7-15 0-49.4-19.7-76.4-19.7C63.3 141.2 4 184.8 4 273.5c0 26.9 4.9 54.6 14.8 83.1 13.2 36.7 60.8 126.7 110.5 125.2 26-.6 44.3-18.4 78.2-18.4 32.9 0 49.8 18.4 78.8 18.4 50.1-.7 93.3-82.5 105.9-119.3-67.1-31.6-73.5-93.3-73.5-95.6zm-23.2-164.2c27.3-32.4 24.8-61.9 24-72.5-24.1 1.4-52 16.4-67.9 34.9-17.5 19.8-27.8 44.3-25.6 71.9 26.1 2 49.9-11.4 69.5-34.3z',
                                                  [],
                                                ),
                                              ],
                                            ),
                                            span([.text('iOS')]),
                                            span(
                                              classes:
                                                  'material-symbols-outlined text-base group-hover/store:translate-x-1 transition-transform',
                                              [.text('open_in_new')],
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
                  ],
                ),
                section(
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
                            div(
                              classes:
                                  "p-7 rounded-2xl bg-surface-container border border-outline-variant/30 hover:border-primary/40 transition-all duration-300 space-y-4",
                              [
                                div(
                                  classes:
                                      "w-12 h-12 rounded-xl bg-primary/10 border border-primary/20 flex items-center justify-center text-primary",
                                  [
                                    span(
                                      classes: "material-symbols-outlined text-2xl",
                                      [
                                        .text("verified_user"),
                                      ],
                                    ),
                                  ],
                                ),
                                h3(
                                  classes: "font-headline-sm text-headline-sm text-on-surface font-semibold",
                                  [
                                    .text(" Built for Real-World Use "),
                                  ],
                                ),
                                p(
                                  classes: "font-body-sm text-body-sm text-on-surface-variant leading-relaxed",
                                  [
                                    .text(
                                      " Software designed around actual user behaviors, unforgiving real conditions, and measurable business requirements. ",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            div(
                              classes:
                                  "p-7 rounded-2xl bg-surface-container border border-outline-variant/30 hover:border-secondary/40 transition-all duration-300 space-y-4",
                              [
                                div(
                                  classes:
                                      "w-12 h-12 rounded-xl bg-secondary/10 border border-secondary/20 flex items-center justify-center text-secondary",
                                  [
                                    span(
                                      classes: "material-symbols-outlined text-2xl",
                                      [
                                        .text("hub"),
                                      ],
                                    ),
                                  ],
                                ),
                                h3(
                                  classes: "font-headline-sm text-headline-sm text-on-surface font-semibold",
                                  [
                                    .text(" One Team, Multi-Platform "),
                                  ],
                                ),
                                p(
                                  classes: "font-body-sm text-body-sm text-on-surface-variant leading-relaxed",
                                  [
                                    .text(
                                      " Mobile, web, and desktop products planned and delivered seamlessly by one coordinated team. ",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            div(
                              classes:
                                  "p-7 rounded-2xl bg-surface-container border border-outline-variant/30 hover:border-primary/40 transition-all duration-300 space-y-4",
                              [
                                div(
                                  classes:
                                      "w-12 h-12 rounded-xl bg-primary/10 border border-primary/20 flex items-center justify-center text-primary",
                                  [
                                    span(
                                      classes: "material-symbols-outlined text-2xl",
                                      [
                                        .text("layers"),
                                      ],
                                    ),
                                  ],
                                ),
                                h3(
                                  classes: "font-headline-sm text-headline-sm text-on-surface font-semibold",
                                  [
                                    .text(" Scalable Architecture "),
                                  ],
                                ),
                                p(
                                  classes: "font-body-sm text-body-sm text-on-surface-variant leading-relaxed",
                                  [
                                    .text(
                                      " Clean code modularity and database schemas engineered to scale from initial prototype to millions of monthly active users. ",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            div(
                              classes:
                                  "p-7 rounded-2xl bg-surface-container border border-outline-variant/30 hover:border-secondary/40 transition-all duration-300 space-y-4",
                              [
                                div(
                                  classes:
                                      "w-12 h-12 rounded-xl bg-secondary/10 border border-secondary/20 flex items-center justify-center text-secondary",
                                  [
                                    span(
                                      classes: "material-symbols-outlined text-2xl",
                                      [
                                        .text("rocket_launch"),
                                      ],
                                    ),
                                  ],
                                ),
                                h3(
                                  classes: "font-headline-sm text-headline-sm text-on-surface font-semibold",
                                  [
                                    .text(" From Idea to Release "),
                                  ],
                                ),
                                p(
                                  classes: "font-body-sm text-body-sm text-on-surface-variant leading-relaxed",
                                  [
                                    .text(
                                      " Complete lifecycle ownership: product discovery, interface architecture, QA testing, deployment, and ongoing post-launch refinement. ",
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
                  classes: "w-full bg-surface-container-low py-20 lg:py-28 relative border-y border-outline-variant/20",
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
                                    .text("HOW WE WORK"),
                                  ],
                                ),
                              ],
                            ),
                            h2(
                              classes:
                                  "font-headline-lg text-headline-lg lg:text-[44px] lg:leading-[52px] text-on-surface font-semibold tracking-tight",
                              [
                                .text(" From Idea to Launch. "),
                              ],
                            ),
                            p(
                              classes: "font-body-lg text-body-lg text-on-surface-variant",
                              [
                                .text(
                                  " A disciplined five-stage development pipeline designed to eliminate rework, ensure transparent execution, and protect delivery milestones. ",
                                ),
                              ],
                            ),
                          ],
                        ),
                        div(
                          classes: "relative grid grid-cols-1 md:grid-cols-5 gap-6",
                          [
                            div(
                              classes:
                                  "hidden md:block absolute top-10 left-12 right-12 h-0.5 bg-gradient-to-r from-primary via-secondary to-primary-container z-0 opacity-40",
                              [],
                            ),
                            div(
                              classes:
                                  "relative z-10 p-6 rounded-2xl bg-surface-container border border-outline-variant/30 flex flex-col space-y-3 group hover:border-primary/40 transition-colors",
                              [
                                div(
                                  classes:
                                      "w-10 h-10 rounded-full bg-surface-container-high border-2 border-primary flex items-center justify-center text-primary font-label-mono font-bold text-sm shadow-[0_0_12px_rgba(173,198,255,0.4)]",
                                  [
                                    .text(" 01 "),
                                  ],
                                ),
                                div(
                                  classes: "font-label-mono text-label-mono text-secondary uppercase font-semibold",
                                  [
                                    .text(" DISCOVER "),
                                  ],
                                ),
                                h4(
                                  classes: "font-headline-sm text-body-md font-semibold text-on-surface",
                                  [
                                    .text(" Define & Align "),
                                  ],
                                ),
                                p(
                                  classes: "font-body-sm text-body-sm text-on-surface-variant leading-relaxed",
                                  [
                                    .text(
                                      " Understand the business, users, technical requirements, edge cases, and core conversion goals. ",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            div(
                              classes:
                                  "relative z-10 p-6 rounded-2xl bg-surface-container border border-outline-variant/30 flex flex-col space-y-3 group hover:border-secondary/40 transition-colors",
                              [
                                div(
                                  classes:
                                      "w-10 h-10 rounded-full bg-surface-container-high border-2 border-secondary flex items-center justify-center text-secondary font-label-mono font-bold text-sm shadow-[0_0_12px_rgba(76,215,246,0.4)]",
                                  [
                                    .text(" 02 "),
                                  ],
                                ),
                                div(
                                  classes: "font-label-mono text-label-mono text-secondary uppercase font-semibold",
                                  [
                                    .text(" DESIGN "),
                                  ],
                                ),
                                h4(
                                  classes: "font-headline-sm text-body-md font-semibold text-on-surface",
                                  [
                                    .text(" Plan & Prototype "),
                                  ],
                                ),
                                p(
                                  classes: "font-body-sm text-body-sm text-on-surface-variant leading-relaxed",
                                  [
                                    .text(
                                      " Wireframe user flows, design interactive UI systems, and validate high-fidelity prototypes. ",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            div(
                              classes:
                                  "relative z-10 p-6 rounded-2xl bg-surface-container border border-outline-variant/30 flex flex-col space-y-3 group hover:border-primary/40 transition-colors",
                              [
                                div(
                                  classes:
                                      "w-10 h-10 rounded-full bg-surface-container-high border-2 border-primary flex items-center justify-center text-primary font-label-mono font-bold text-sm shadow-[0_0_12px_rgba(173,198,255,0.4)]",
                                  [
                                    .text(" 03 "),
                                  ],
                                ),
                                div(
                                  classes: "font-label-mono text-label-mono text-secondary uppercase font-semibold",
                                  [
                                    .text(" DEVELOP "),
                                  ],
                                ),
                                h4(
                                  classes: "font-headline-sm text-body-md font-semibold text-on-surface",
                                  [
                                    .text(" Engineered Code "),
                                  ],
                                ),
                                p(
                                  classes: "font-body-sm text-body-sm text-on-surface-variant leading-relaxed",
                                  [
                                    .text(
                                      " Transform approved specifications into reliable software with clean architectures and CI/CD. ",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            div(
                              classes:
                                  "relative z-10 p-6 rounded-2xl bg-surface-container border border-outline-variant/30 flex flex-col space-y-3 group hover:border-secondary/40 transition-colors",
                              [
                                div(
                                  classes:
                                      "w-10 h-10 rounded-full bg-surface-container-high border-2 border-secondary flex items-center justify-center text-secondary font-label-mono font-bold text-sm shadow-[0_0_12px_rgba(76,215,246,0.4)]",
                                  [
                                    .text(" 04 "),
                                  ],
                                ),
                                div(
                                  classes: "font-label-mono text-label-mono text-secondary uppercase font-semibold",
                                  [
                                    .text(" TEST "),
                                  ],
                                ),
                                h4(
                                  classes: "font-headline-sm text-body-md font-semibold text-on-surface",
                                  [
                                    .text(" Rigorous QA "),
                                  ],
                                ),
                                p(
                                  classes: "font-body-sm text-body-sm text-on-surface-variant leading-relaxed",
                                  [
                                    .text(
                                      " Verify automated test suites, end-to-end integration, performance under load, and system stability. ",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            div(
                              classes:
                                  "relative z-10 p-6 rounded-2xl bg-surface-container border border-outline-variant/30 flex flex-col space-y-3 group hover:border-primary/40 transition-colors",
                              [
                                div(
                                  classes:
                                      "w-10 h-10 rounded-full bg-surface-container-high border-2 border-primary-container flex items-center justify-center text-primary-fixed font-label-mono font-bold text-sm shadow-[0_0_12px_rgba(77,142,255,0.4)]",
                                  [
                                    .text(" 05 "),
                                  ],
                                ),
                                div(
                                  classes: "font-label-mono text-label-mono text-secondary uppercase font-semibold",
                                  [
                                    .text(" LAUNCH "),
                                  ],
                                ),
                                h4(
                                  classes: "font-headline-sm text-body-md font-semibold text-on-surface",
                                  [
                                    .text(" Deploy & Scale "),
                                  ],
                                ),
                                p(
                                  classes: "font-body-sm text-body-sm text-on-surface-variant leading-relaxed",
                                  [
                                    .text(
                                      " Zero-downtime production deployment, store approval submission, telemetry setup, and iteration. ",
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

class HomeServiceCard extends StatelessComponent {
  final int count;
  final String iconName, title, description;
  final List<String> chips;

  HomeServiceCard({
    super.key,
    required this.count,
    required this.iconName,
    required this.title,
    required this.description,
    required this.chips,
  });

  @override
  Component build(BuildContext context) {
    return div(
      classes:
          "p-8 rounded-2xl bg-surface-container border border-outline-variant/30 hover:border-primary/50 transition-all duration-300 flex flex-col justify-between group relative overflow-hidden",
      [
        div(
          classes:
              "absolute -right-10 -bottom-10 w-40 h-40 bg-primary/5 rounded-full blur-2xl group-hover:bg-primary/10 transition-colors pointer-events-none",
          [],
        ),
        div(
          classes: "space-y-4",
          [
            div(
              classes: "flex items-center justify-between",
              [
                span(
                  classes: "font-label-mono text-headline-md text-primary font-semibold",
                  [
                    .text(count.toString().padLeft(2, "0")),
                  ],
                ),
                div(
                  classes:
                      "w-10 h-10 rounded-lg bg-surface-container-high flex items-center justify-center text-primary group-hover:text-secondary transition-colors",
                  [
                    span(
                      classes: "material-symbols-outlined",
                      [
                        .text(iconName),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            h3(
              classes:
                  "font-headline-md text-headline-md text-on-surface font-semibold group-hover:text-primary transition-colors",
              [
                .text(" $title "),
              ],
            ),
            p(
              classes: "font-body-md text-body-md text-on-surface-variant leading-relaxed",
              [
                .text(
                  " $description ",
                ),
              ],
            ),
          ],
        ),

        div(
          classes: "pt-8 flex flex-wrap gap-2",
          chips
              .map(
                (chip) => span(
                  classes:
                      "px-2.5 py-1 rounded bg-surface-container-high text-on-surface-variant font-label-mono-xs text-label-mono-xs border border-outline-variant/20",
                  [
                    .text(chip),
                  ],
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
