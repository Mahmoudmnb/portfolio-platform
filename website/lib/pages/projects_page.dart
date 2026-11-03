import 'package:jaspr/jaspr.dart';

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
        // ignore: prefer_html_components
        Component.element(
          tag: "header",
          classes:
              "fixed top-0 left-0 right-0 w-full z-50 bg-surface/80 backdrop-blur-xl border-b border-[rgba(255,255,255,0.08)] transition-all duration-300",
          children: [
            // ignore: prefer_html_components
            Component.element(
              tag: "div",
              classes: "h-20 max-w-7xl mx-auto px-6 sm:px-8 flex items-center justify-between",
              children: [
                // ignore: prefer_html_components
                Component.element(
                  tag: "a",
                  classes: "flex items-center gap-2 group",
                  attributes: {
                    "data-path": "home",
                    "href": "/",
                  },
                  children: [
                    // ignore: prefer_html_components
                    Component.element(
                      tag: "span",
                      classes:
                          "font-headline-sm text-headline-sm text-on-surface tracking-tight font-semibold group-hover:text-primary transition-colors",
                      children: [
                        Component.text("Brothers-Tech"),
                      ],
                    ),
                    // ignore: prefer_html_components
                    Component.element(
                      tag: "span",
                      classes: "h-2 w-2 rounded-full bg-secondary shadow-[0_0_8px_#4cd7f6]",
                    ),
                  ],
                ),
                // ignore: prefer_html_components
                Component.element(
                  tag: "nav",
                  classes:
                      "hidden md:flex items-center gap-1 bg-surface-container-lowest/60 px-2 py-1.5 rounded-xl border border-[rgba(255,255,255,0.05)]",
                  attributes: {
                    "data-active-classes": "bg-surface-container-high text-primary font-medium rounded-lg",
                  },
                  children: [
                    // ignore: prefer_html_components
                    Component.element(
                      tag: "a",
                      classes:
                          "px-4 py-2 text-on-surface-variant font-body-md text-body-md hover:text-on-surface hover:bg-surface-container-high transition-colors rounded-lg",
                      attributes: {
                        "data-path": "home",
                        "href": "/",
                      },
                      children: [
                        Component.text("Home"),
                      ],
                    ),
                    // ignore: prefer_html_components
                    Component.element(
                      tag: "a",
                      classes:
                          "px-4 py-2 text-on-surface-variant font-body-md text-body-md hover:text-on-surface hover:bg-surface-container-high transition-colors rounded-lg",
                      attributes: {
                        "data-path": "services",
                        "href": "/services",
                      },
                      children: [
                        Component.text("Services"),
                      ],
                    ),
                    // ignore: prefer_html_components
                    Component.element(
                      tag: "a",
                      classes:
                          "px-4 py-2 text-on-surface-variant font-body-md text-body-md hover:text-on-surface hover:bg-surface-container-high transition-colors rounded-lg",
                      attributes: {
                        "aria-current": "page",
                        "data-path": "projects",
                        "href": "/projects",
                      },
                      children: [
                        Component.text("Projects"),
                      ],
                    ),
                    // ignore: prefer_html_components
                    Component.element(
                      tag: "a",
                      classes:
                          "px-4 py-2 text-on-surface-variant font-body-md text-body-md hover:text-on-surface hover:bg-surface-container-high transition-colors rounded-lg",
                      attributes: {
                        "data-path": "about",
                        "href": "/about",
                      },
                      children: [
                        Component.text("About"),
                      ],
                    ),
                    // ignore: prefer_html_components
                    Component.element(
                      tag: "a",
                      classes:
                          "px-4 py-2 text-on-surface-variant font-body-md text-body-md hover:text-on-surface hover:bg-surface-container-high transition-colors rounded-lg",
                      attributes: {
                        "data-path": "contact",
                        "href": "/contact",
                      },
                      children: [
                        Component.text("Contact"),
                      ],
                    ),
                  ],
                ),
                // ignore: prefer_html_components
                Component.element(
                  tag: "div",
                  classes: "flex items-center gap-4",
                  children: [
                    // ignore: prefer_html_components
                    Component.element(
                      tag: "a",
                      classes:
                          "hidden sm:inline-flex items-center justify-center h-10 px-5 rounded-lg bg-primary-container text-on-primary-container font-body-md text-body-md font-medium hover:bg-primary transition-all duration-200 shadow-[inset_0_1px_0_rgba(255,255,255,0.2)] hover:shadow-[0_0_16px_rgba(77,142,255,0.4)]",
                      attributes: {
                        "data-path": "contact",
                        "href": "/contact",
                      },
                      children: [
                        Component.text("Start a Project →"),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        // ignore: prefer_html_components
        Component.element(
          tag: "main",
          classes: "w-full pt-20 bg-background flex-1",
          children: [
            // ignore: prefer_html_components
            Component.element(
              tag: "div",
              classes: "flex flex-col w-full",
              children: [
                // ignore: prefer_html_components
                Component.element(
                  tag: "section",
                  classes: "relative w-full max-w-7xl mx-auto px-6 sm:px-8 pt-10 pb-16 overflow-hidden",
                  children: [
                    // ignore: prefer_html_components
                    Component.element(
                      tag: "div",
                      classes:
                          "absolute -top-24 left-1/4 w-96 h-96 bg-primary/10 rounded-full blur-[128px] pointer-events-none -z-10",
                    ),
                    // ignore: prefer_html_components
                    Component.element(
                      tag: "div",
                      classes:
                          "absolute top-1/2 right-10 w-80 h-80 bg-secondary/10 rounded-full blur-[110px] pointer-events-none -z-10",
                    ),
                    // ignore: prefer_html_components
                    Component.element(
                      tag: "div",
                      classes: "flex flex-col items-start gap-6 max-w-4xl",
                      children: [
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "div",
                          classes:
                              "inline-flex items-center gap-2 px-3 py-1 rounded-full bg-surface-container-high border border-outline-variant/30 backdrop-blur-md",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "span",
                              classes: "w-2 h-2 rounded-full bg-secondary shadow-[0_0_10px_#4cd7f6] animate-pulse",
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "span",
                              classes:
                                  "font-label-mono text-label-mono-xs uppercase tracking-widest text-secondary font-medium",
                              children: [
                                Component.text("Selected Work"),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "span",
                              classes: "text-outline-variant",
                              children: [
                                Component.text("|"),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "span",
                              classes: "font-label-mono text-label-mono-xs text-on-surface-variant",
                              children: [
                                Component.text("Production Case Studies"),
                              ],
                            ),
                          ],
                        ),
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "h1",
                          classes: "font-display-hero text-display-hero text-on-surface tracking-tight",
                          children: [
                            Component.text(" Products We've "),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "span",
                              classes:
                                  "text-transparent bg-clip-text bg-gradient-to-r from-primary via-secondary to-secondary-fixed",
                              children: [
                                Component.text("Brought to Life."),
                              ],
                            ),
                          ],
                        ),
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "p",
                          classes: "font-body-lg text-body-lg text-on-surface-variant max-w-2xl leading-relaxed",
                          children: [
                            Component.text(
                              " From consumer mobile apps to high-throughput web dashboards and mission-critical desktop systems, explore the digital products engineered and deployed by Brothers-Tech. ",
                            ),
                          ],
                        ),
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "div",
                          classes:
                              "flex flex-wrap items-center gap-x-6 gap-y-3 pt-2 font-label-mono text-label-mono text-on-surface-variant",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes: "flex items-center gap-2",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes: "material-symbols-outlined text-secondary text-[18px]",
                                  children: [
                                    Component.text("verified"),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes: "text-on-surface font-medium",
                                  children: [
                                    Component.text("14+ Platforms Shipped"),
                                  ],
                                ),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "span",
                              classes: "text-outline-variant hidden sm:inline",
                              children: [
                                Component.text("•"),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes: "flex items-center gap-2",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes: "material-symbols-outlined text-primary text-[18px]",
                                  children: [
                                    Component.text("phone_iphone"),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  children: [
                                    Component.text("Android & iOS"),
                                  ],
                                ),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "span",
                              classes: "text-outline-variant hidden sm:inline",
                              children: [
                                Component.text("•"),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes: "flex items-center gap-2",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes: "material-symbols-outlined text-primary text-[18px]",
                                  children: [
                                    Component.text("laptop_chromebook"),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  children: [
                                    Component.text("Modern Web"),
                                  ],
                                ),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "span",
                              classes: "text-outline-variant hidden sm:inline",
                              children: [
                                Component.text("•"),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes: "flex items-center gap-2",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes: "material-symbols-outlined text-primary text-[18px]",
                                  children: [
                                    Component.text("desktop_windows"),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  children: [
                                    Component.text("Native Desktop"),
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
                // ignore: prefer_html_components
                Component.element(
                  tag: "section",
                  classes: "project-item w-full max-w-7xl mx-auto px-6 sm:px-8 mb-20",
                  attributes: {
                    "data-categories": "web mobile multi",
                  },
                  children: [
                    // ignore: prefer_html_components
                    Component.element(
                      tag: "div",
                      classes:
                          "relative w-full rounded-2xl bg-gradient-to-br from-surface-container to-surface-container-low border border-outline-variant/40 hover:border-primary/50 transition-all duration-300 overflow-hidden shadow-2xl group",
                      children: [
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "div",
                          classes:
                              "absolute -top-32 -left-32 w-80 h-80 bg-primary/20 rounded-full blur-[96px] pointer-events-none transition-opacity duration-300 group-hover:opacity-100 opacity-60",
                        ),
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "div",
                          classes: "grid grid-cols-1 lg:grid-cols-12 gap-8 p-8 lg:p-12 items-center",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes: "lg:col-span-6 flex flex-col space-y-6 z-10",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "div",
                                  classes: "flex flex-wrap items-center gap-2",
                                  children: [
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "span",
                                      classes:
                                          "px-2.5 py-1 rounded bg-secondary/10 border border-secondary/30 font-label-mono text-label-mono-xs text-secondary uppercase font-semibold",
                                      children: [
                                        Component.text(" Featured Flagship "),
                                      ],
                                    ),
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "span",
                                      classes: "text-outline-variant",
                                      children: [
                                        Component.text("•"),
                                      ],
                                    ),
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "span",
                                      classes:
                                          "font-label-mono text-label-mono-xs text-on-surface-variant tracking-wider uppercase",
                                      children: [
                                        Component.text(" Multi-Platform • Dashboard + iOS/Android Mobile "),
                                      ],
                                    ),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "h2",
                                  classes:
                                      "font-headline-lg text-headline-lg text-on-surface font-semibold tracking-tight group-hover:text-primary transition-colors",
                                  children: [
                                    Component.text(" Quran Institute Management System "),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "p",
                                  classes: "font-body-lg text-body-lg text-on-surface-variant leading-relaxed",
                                  children: [
                                    Component.text(
                                      " A multi-platform Quran institute management system with dedicated admin, teacher, and student applications, customized and deployed in 3 different versions for three institutes, with features adapted to each institute’s specific workflow and requirements. ",
                                    ),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "div",
                                  classes: "flex flex-wrap gap-2 pt-2",
                                  children: [
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "span",
                                      classes:
                                          "px-2.5 py-1 rounded bg-surface-container-high border border-outline-variant/30 font-label-mono text-label-mono-xs text-primary",
                                      children: [
                                        Component.text("Multi-Platform"),
                                      ],
                                    ),
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "span",
                                      classes:
                                          "px-2.5 py-1 rounded bg-surface-container-high border border-outline-variant/30 font-label-mono text-label-mono-xs text-primary",
                                      children: [
                                        Component.text("Admin Desktop"),
                                      ],
                                    ),
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "span",
                                      classes:
                                          "px-2.5 py-1 rounded bg-surface-container-high border border-outline-variant/30 font-label-mono text-label-mono-xs text-primary",
                                      children: [
                                        Component.text("Instructor App"),
                                      ],
                                    ),
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "span",
                                      classes:
                                          "px-2.5 py-1 rounded bg-surface-container-high border border-outline-variant/30 font-label-mono text-label-mono-xs text-primary",
                                      children: [
                                        Component.text("Student App"),
                                      ],
                                    ),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "div",
                                  classes: "flex flex-wrap items-center gap-4 pt-4",
                                  children: [
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "a",
                                      classes:
                                          "inline-flex items-center gap-2 h-11 px-6 rounded-lg bg-primary-container text-on-primary-container font-headline-sm text-body-md font-medium hover:bg-primary transition-all duration-200 shadow-[0_0_20px_rgba(77,142,255,0.4)]",
                                      attributes: {
                                        "href":
                                            "https://play.google.com/store/apps/details?id=com.brothers.alsaad_mosque_institute",
                                        "rel": "noopener noreferrer",
                                        "target": "_blank",
                                      },
                                      children: [
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "span",
                                          classes: "material-symbols-outlined text-[20px]",
                                          children: [
                                            Component.text("android"),
                                          ],
                                        ),
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "span",
                                          children: [
                                            Component.text("Android"),
                                          ],
                                        ),
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "span",
                                          classes: "material-symbols-outlined text-[18px]",
                                          children: [
                                            Component.text("north_east"),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes: "lg:col-span-6 relative flex items-center justify-center",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "div",
                                  classes:
                                      "absolute inset-0 bg-gradient-to-tr from-secondary-container/20 to-primary-container/20 rounded-2xl blur-3xl opacity-50",
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "div",
                                  classes:
                                      "relative w-full overflow-hidden rounded-xl border border-outline-variant/50 bg-surface-container-lowest shadow-2xl",
                                  children: [
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "img",
                                      classes: "block h-auto w-full",
                                      attributes: {
                                        "alt": "Quran Institute Management System dashboard and mobile applications",
                                        "decoding": "async",
                                        "src": "assets/images/alsaad/Quran%20System.png",
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
                // ignore: prefer_html_components
                Component.element(
                  tag: "section",
                  classes: "w-full max-w-7xl mx-auto px-6 sm:px-8 mb-24",
                  children: [
                    // ignore: prefer_html_components
                    Component.element(
                      tag: "div",
                      id: "projects-grid",
                      classes: "grid grid-cols-1 md:grid-cols-2 gap-8",
                      children: [
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "article",
                          classes:
                              "project-item rounded-xl bg-surface-container-low border border-outline-variant/30 hover:border-primary/50 transition-all duration-300 flex flex-col overflow-hidden group shadow-lg",
                          attributes: {
                            "data-categories": "mobile",
                          },
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes:
                                  "relative h-64 overflow-hidden border-b border-outline-variant/20 bg-surface-container-high",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "img",
                                  classes:
                                      "h-full w-full object-cover transition-transform duration-500 group-hover:scale-[1.02]",
                                  attributes: {
                                    "alt": "Prime medical education platform on desktop and mobile devices",
                                    "decoding": "async",
                                    "loading": "lazy",
                                    "src": "assets/images/prime/prime_all.png",
                                  },
                                ),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes: "p-6 flex flex-col flex-1 justify-between space-y-4",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "div",
                                  children: [
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "div",
                                      classes: "flex items-center justify-between mb-2",
                                      children: [
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "span",
                                          classes:
                                              "font-label-mono text-label-mono-xs text-secondary uppercase font-semibold",
                                          children: [
                                            Component.text("Mobile • iOS & Android"),
                                          ],
                                        ),
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "span",
                                          classes: "font-label-mono text-label-mono-xs text-on-surface-variant",
                                          children: [
                                            Component.text("MEDICAL EDUCATION"),
                                          ],
                                        ),
                                      ],
                                    ),
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "h4",
                                      classes:
                                          "font-headline-sm text-headline-sm text-on-surface font-semibold group-hover:text-primary transition-colors",
                                      children: [
                                        Component.text(" Prime - Medical Education Platform "),
                                      ],
                                    ),
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "p",
                                      classes: "font-body-md text-body-md text-on-surface-variant mt-2 leading-relaxed",
                                      children: [
                                        Component.text(
                                          " Mobile learning platform for medical students at Aleppo University. ",
                                        ),
                                      ],
                                    ),
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "ul",
                                      classes:
                                          "mt-3 space-y-1.5 font-body-sm text-body-sm text-on-surface-variant leading-relaxed",
                                      children: [
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "li",
                                          classes: "flex gap-2",
                                          children: [
                                            // ignore: prefer_html_components
                                            Component.element(
                                              tag: "span",
                                              classes: "text-secondary",
                                              children: [
                                                Component.text("•"),
                                              ],
                                            ),
                                            // ignore: prefer_html_components
                                            Component.element(
                                              tag: "span",
                                              children: [
                                                Component.text(
                                                  "Built question banks, previous exams, videos, PDFs, and learning resources.",
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "li",
                                          classes: "flex gap-2",
                                          children: [
                                            // ignore: prefer_html_components
                                            Component.element(
                                              tag: "span",
                                              classes: "text-secondary",
                                              children: [
                                                Component.text("•"),
                                              ],
                                            ),
                                            // ignore: prefer_html_components
                                            Component.element(
                                              tag: "span",
                                              children: [
                                                Component.text(
                                                  "Integrated an AI assistant and offline content access.",
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "li",
                                          classes: "flex gap-2",
                                          children: [
                                            // ignore: prefer_html_components
                                            Component.element(
                                              tag: "span",
                                              classes: "text-secondary",
                                              children: [
                                                Component.text("•"),
                                              ],
                                            ),
                                            // ignore: prefer_html_components
                                            Component.element(
                                              tag: "span",
                                              children: [
                                                Component.text("Implemented content encryption."),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "div",
                                  classes: "pt-2",
                                  children: [
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "div",
                                      classes: "flex flex-wrap gap-1.5 mb-4",
                                      children: [
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "span",
                                          classes:
                                              "px-2 py-0.5 rounded bg-surface-container font-label-mono text-[11px] text-primary",
                                          children: [
                                            Component.text("AI Integration"),
                                          ],
                                        ),
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "span",
                                          classes:
                                              "px-2 py-0.5 rounded bg-surface-container font-label-mono text-[11px] text-primary",
                                          children: [
                                            Component.text("Encryption"),
                                          ],
                                        ),
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "span",
                                          classes:
                                              "px-2 py-0.5 rounded bg-surface-container font-label-mono text-[11px] text-primary",
                                          children: [
                                            Component.text("Videos & PDFs"),
                                          ],
                                        ),
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "span",
                                          classes:
                                              "px-2 py-0.5 rounded bg-surface-container font-label-mono text-[11px] text-primary",
                                          children: [
                                            Component.text("Offline Access"),
                                          ],
                                        ),
                                      ],
                                    ),
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "div",
                                      classes: "flex flex-wrap gap-3",
                                      children: [
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "a",
                                          classes:
                                              "inline-flex items-center gap-2 px-4 py-2 rounded-lg bg-primary-container text-on-primary-container font-body-md text-body-sm font-semibold hover:bg-primary transition-all shadow-[0_0_20px_rgba(77,142,255,0.3)] group/store-android",
                                          attributes: {
                                            "href": "https://play.google.com/store/apps/details?id=com.brothers.prime",
                                            "rel": "noopener noreferrer",
                                            "target": "_blank",
                                            "aria-label": "Download Prime for Android from Google Play",
                                          },
                                          children: [
                                            // ignore: prefer_html_components
                                            Component.element(
                                              tag: "span",
                                              classes: "material-symbols-outlined text-[18px]",
                                              children: [
                                                Component.text("android"),
                                              ],
                                            ),
                                            // ignore: prefer_html_components
                                            Component.element(
                                              tag: "span",
                                              children: [
                                                Component.text("Android"),
                                              ],
                                            ),
                                            // ignore: prefer_html_components
                                            Component.element(
                                              tag: "span",
                                              classes:
                                                  "material-symbols-outlined text-[15px] group-hover/store-android:translate-x-1 transition-transform",
                                              children: [
                                                Component.text("open_in_new"),
                                              ],
                                            ),
                                          ],
                                        ),
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "a",
                                          classes:
                                              "inline-flex items-center gap-2 px-4 py-2 rounded-lg bg-surface-container-high text-on-surface font-body-md text-body-sm font-semibold border border-outline-variant/40 hover:border-secondary/60 hover:text-secondary transition-all group/store-ios",
                                          attributes: {
                                            "href": "https://apps.apple.com/us/app/prime/id6758918919",
                                            "rel": "noopener noreferrer",
                                            "target": "_blank",
                                            "aria-label": "Download Prime for iOS from the App Store",
                                          },
                                          children: [
                                            // ignore: prefer_html_components
                                            Component.element(
                                              tag: "svg",
                                              classes: "w-[18px] h-[18px] fill-current",
                                              attributes: {
                                                "aria-hidden": "true",
                                                "viewBox": "0 0 384 512",
                                              },
                                              children: [
                                                // ignore: prefer_html_components
                                                Component.element(
                                                  tag: "path",
                                                  attributes: {
                                                    "d":
                                                        "M318.7 268.7c-.2-36.7 16.4-64.4 50-84.8-18.8-26.9-47.2-41.7-84.7-44.6-35.5-2.8-74.3 20.7-88.5 20.7-15 0-49.4-19.7-76.4-19.7C63.3 141.2 4 184.8 4 273.5c0 26.9 4.9 54.6 14.8 83.1 13.2 36.7 60.8 126.7 110.5 125.2 26-.6 44.3-18.4 78.2-18.4 32.9 0 49.8 18.4 78.8 18.4 50.1-.7 93.3-82.5 105.9-119.3-67.1-31.6-73.5-93.3-73.5-95.6zm-23.2-164.2c27.3-32.4 24.8-61.9 24-72.5-24.1 1.4-52 16.4-67.9 34.9-17.5 19.8-27.8 44.3-25.6 71.9 26.1 2 49.9-11.4 69.5-34.3z",
                                                  },
                                                ),
                                              ],
                                            ),
                                            // ignore: prefer_html_components
                                            Component.element(
                                              tag: "span",
                                              children: [
                                                Component.text("iOS"),
                                              ],
                                            ),
                                            // ignore: prefer_html_components
                                            Component.element(
                                              tag: "span",
                                              classes:
                                                  "material-symbols-outlined text-[15px] group-hover/store-ios:translate-x-1 transition-transform",
                                              children: [
                                                Component.text("open_in_new"),
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
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "article",
                          classes:
                              "project-item rounded-xl bg-surface-container-low border border-outline-variant/30 hover:border-primary/50 transition-all duration-300 flex flex-col overflow-hidden group shadow-lg",
                          attributes: {
                            "data-categories": "mobile",
                          },
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes:
                                  "relative h-64 overflow-hidden border-b border-outline-variant/20 bg-surface-container-high",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "img",
                                  classes:
                                      "h-full w-full object-cover transition-transform duration-500 group-hover:scale-[1.02]",
                                  attributes: {
                                    "alt": "Ala Al-Nadha multi-service delivery platform on desktop and mobile devices",
                                    "decoding": "async",
                                    "loading": "lazy",
                                    "src": "assets/images/al-nadha/al-nadha_all.png",
                                  },
                                ),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes: "p-6 flex flex-col flex-1 justify-between space-y-4",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "div",
                                  children: [
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "div",
                                      classes: "flex items-center justify-between mb-2",
                                      children: [
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "span",
                                          classes:
                                              "font-label-mono text-label-mono-xs text-secondary uppercase font-semibold",
                                          children: [
                                            Component.text("Mobile • iOS & Android"),
                                          ],
                                        ),
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "span",
                                          classes: "font-label-mono text-label-mono-xs text-on-surface-variant",
                                          children: [
                                            Component.text("DELIVERY PLATFORM"),
                                          ],
                                        ),
                                      ],
                                    ),
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "h4",
                                      classes:
                                          "font-headline-sm text-headline-sm text-on-surface font-semibold group-hover:text-primary transition-colors",
                                      children: [
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "span",
                                          attributes: {
                                            "dir": "rtl",
                                            "lang": "ar",
                                          },
                                          children: [
                                            Component.text("الندهة ع"),
                                          ],
                                        ),
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "span",
                                          attributes: {
                                            "dir": "ltr",
                                          },
                                          children: [
                                            Component.text("| Ala Al-Nadha — Multi-Service Delivery Platform"),
                                          ],
                                        ),
                                      ],
                                    ),
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "p",
                                      classes: "font-body-md text-body-md text-on-surface-variant mt-2 leading-relaxed",
                                      children: [
                                        Component.text(
                                          " Multi-service platform for food delivery, grocery shopping, and cleaning services across Aleppo. ",
                                        ),
                                      ],
                                    ),
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "ul",
                                      classes:
                                          "mt-3 space-y-1.5 font-body-sm text-body-sm text-on-surface-variant leading-relaxed",
                                      children: [
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "li",
                                          classes: "flex gap-2",
                                          children: [
                                            // ignore: prefer_html_components
                                            Component.element(
                                              tag: "span",
                                              classes: "text-secondary",
                                              children: [
                                                Component.text("•"),
                                              ],
                                            ),
                                            // ignore: prefer_html_components
                                            Component.element(
                                              tag: "span",
                                              children: [
                                                Component.text(
                                                  "Developed restaurant, supermarket, and cleaning-service ordering flows within one application.",
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "li",
                                          classes: "flex gap-2",
                                          children: [
                                            // ignore: prefer_html_components
                                            Component.element(
                                              tag: "span",
                                              classes: "text-secondary",
                                              children: [
                                                Component.text("•"),
                                              ],
                                            ),
                                            // ignore: prefer_html_components
                                            Component.element(
                                              tag: "span",
                                              children: [
                                                Component.text(
                                                  "Built smart voice search that converts natural Arabic speech into relevant stores, products, and search keywords.",
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "li",
                                          classes: "flex gap-2",
                                          children: [
                                            // ignore: prefer_html_components
                                            Component.element(
                                              tag: "span",
                                              classes: "text-secondary",
                                              children: [
                                                Component.text("•"),
                                              ],
                                            ),
                                            // ignore: prefer_html_components
                                            Component.element(
                                              tag: "span",
                                              children: [
                                                Component.text(
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
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "div",
                                  classes: "pt-2",
                                  children: [
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "div",
                                      classes: "flex flex-wrap gap-1.5 mb-4",
                                      children: [
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "span",
                                          classes:
                                              "px-2 py-0.5 rounded bg-surface-container font-label-mono text-[11px] text-primary",
                                          children: [
                                            Component.text("Voice Search"),
                                          ],
                                        ),
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "span",
                                          classes:
                                              "px-2 py-0.5 rounded bg-surface-container font-label-mono text-[11px] text-primary",
                                          children: [
                                            Component.text("Location Services"),
                                          ],
                                        ),
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "span",
                                          classes:
                                              "px-2 py-0.5 rounded bg-surface-container font-label-mono text-[11px] text-primary",
                                          children: [
                                            Component.text("Order Management"),
                                          ],
                                        ),
                                      ],
                                    ),
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "div",
                                      classes: "flex flex-wrap gap-3",
                                      children: [
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "a",
                                          classes:
                                              "inline-flex items-center gap-2 px-4 py-2 rounded-lg bg-primary-container text-on-primary-container font-body-md text-body-sm font-semibold hover:bg-primary transition-all shadow-[0_0_20px_rgba(77,142,255,0.3)] group/alnadha-android",
                                          attributes: {
                                            "href": "https://play.google.com/store/apps/details?id=com.alnadha.app",
                                            "rel": "noopener noreferrer",
                                            "target": "_blank",
                                            "aria-label": "Download Ala Al-Nadha for Android from Google Play",
                                          },
                                          children: [
                                            // ignore: prefer_html_components
                                            Component.element(
                                              tag: "span",
                                              classes: "material-symbols-outlined text-[18px]",
                                              children: [
                                                Component.text("android"),
                                              ],
                                            ),
                                            // ignore: prefer_html_components
                                            Component.element(
                                              tag: "span",
                                              children: [
                                                Component.text("Android"),
                                              ],
                                            ),
                                            // ignore: prefer_html_components
                                            Component.element(
                                              tag: "span",
                                              classes:
                                                  "material-symbols-outlined text-[15px] group-hover/alnadha-android:translate-x-1 transition-transform",
                                              children: [
                                                Component.text("open_in_new"),
                                              ],
                                            ),
                                          ],
                                        ),
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "a",
                                          classes:
                                              "inline-flex items-center gap-2 px-4 py-2 rounded-lg bg-surface-container-high text-on-surface font-body-md text-body-sm font-semibold border border-outline-variant/40 hover:border-secondary/60 hover:text-secondary transition-all group/alnadha-ios",
                                          attributes: {
                                            "href": "https://play.google.com/store/apps/details?id=com.alnadha.app",
                                            "rel": "noopener noreferrer",
                                            "target": "_blank",
                                            "aria-label": "Open the provided Ala Al-Nadha iOS store link",
                                          },
                                          children: [
                                            // ignore: prefer_html_components
                                            Component.element(
                                              tag: "svg",
                                              classes: "w-[18px] h-[18px] fill-current",
                                              attributes: {
                                                "aria-hidden": "true",
                                                "viewBox": "0 0 384 512",
                                              },
                                              children: [
                                                // ignore: prefer_html_components
                                                Component.element(
                                                  tag: "path",
                                                  attributes: {
                                                    "d":
                                                        "M318.7 268.7c-.2-36.7 16.4-64.4 50-84.8-18.8-26.9-47.2-41.7-84.7-44.6-35.5-2.8-74.3 20.7-88.5 20.7-15 0-49.4-19.7-76.4-19.7C63.3 141.2 4 184.8 4 273.5c0 26.9 4.9 54.6 14.8 83.1 13.2 36.7 60.8 126.7 110.5 125.2 26-.6 44.3-18.4 78.2-18.4 32.9 0 49.8 18.4 78.8 18.4 50.1-.7 93.3-82.5 105.9-119.3-67.1-31.6-73.5-93.3-73.5-95.6zm-23.2-164.2c27.3-32.4 24.8-61.9 24-72.5-24.1 1.4-52 16.4-67.9 34.9-17.5 19.8-27.8 44.3-25.6 71.9 26.1 2 49.9-11.4 69.5-34.3z",
                                                  },
                                                ),
                                              ],
                                            ),
                                            // ignore: prefer_html_components
                                            Component.element(
                                              tag: "span",
                                              children: [
                                                Component.text("iOS"),
                                              ],
                                            ),
                                            // ignore: prefer_html_components
                                            Component.element(
                                              tag: "span",
                                              classes:
                                                  "material-symbols-outlined text-[15px] group-hover/alnadha-ios:translate-x-1 transition-transform",
                                              children: [
                                                Component.text("open_in_new"),
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
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "article",
                          classes:
                              "project-item rounded-xl bg-surface-container-low border border-outline-variant/30 hover:border-primary/50 transition-all duration-300 flex flex-col overflow-hidden group shadow-lg",
                          attributes: {
                            "data-categories": "mobile",
                          },
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes:
                                  "relative h-64 overflow-hidden border-b border-outline-variant/20 bg-surface-container-high",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "img",
                                  classes:
                                      "h-full w-full object-cover transition-transform duration-500 group-hover:scale-[1.02]",
                                  attributes: {
                                    "alt": "Drisavo driving school booking platform on desktop and mobile devices",
                                    "decoding": "async",
                                    "loading": "lazy",
                                    "src": "assets/images/drisavo/drisavo-all.png",
                                  },
                                ),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes: "p-6 flex flex-col flex-1 justify-between space-y-4",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "div",
                                  children: [
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "div",
                                      classes: "flex items-center justify-between mb-2",
                                      children: [
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "span",
                                          classes:
                                              "font-label-mono text-label-mono-xs text-secondary uppercase font-semibold",
                                          children: [
                                            Component.text("Mobile • iOS"),
                                          ],
                                        ),
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "span",
                                          classes: "font-label-mono text-label-mono-xs text-on-surface-variant",
                                          children: [
                                            Component.text("CANADIAN MARKET"),
                                          ],
                                        ),
                                      ],
                                    ),
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "h4",
                                      classes:
                                          "font-headline-sm text-headline-sm text-on-surface font-semibold group-hover:text-primary transition-colors",
                                      children: [
                                        Component.text(" Drisavo - Driving School Booking Platform "),
                                      ],
                                    ),
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "p",
                                      classes: "font-body-md text-body-md text-on-surface-variant mt-2 leading-relaxed",
                                      children: [
                                        Component.text(" Driving lesson booking platform for the Canadian market. "),
                                      ],
                                    ),
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "ul",
                                      classes:
                                          "mt-3 space-y-1.5 font-body-sm text-body-sm text-on-surface-variant leading-relaxed",
                                      children: [
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "li",
                                          classes: "flex gap-2",
                                          children: [
                                            // ignore: prefer_html_components
                                            Component.element(
                                              tag: "span",
                                              classes: "text-secondary",
                                              children: [
                                                Component.text("•"),
                                              ],
                                            ),
                                            // ignore: prefer_html_components
                                            Component.element(
                                              tag: "span",
                                              children: [
                                                Component.text(
                                                  "Built dedicated student and instructor experiences with real-time lesson booking.",
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "li",
                                          classes: "flex gap-2",
                                          children: [
                                            // ignore: prefer_html_components
                                            Component.element(
                                              tag: "span",
                                              classes: "text-secondary",
                                              children: [
                                                Component.text("•"),
                                              ],
                                            ),
                                            // ignore: prefer_html_components
                                            Component.element(
                                              tag: "span",
                                              children: [
                                                Component.text(
                                                  "Implemented chat, digital wallet payments, and driving-hour purchases.",
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "li",
                                          classes: "flex gap-2",
                                          children: [
                                            // ignore: prefer_html_components
                                            Component.element(
                                              tag: "span",
                                              classes: "text-secondary",
                                              children: [
                                                Component.text("•"),
                                              ],
                                            ),
                                            // ignore: prefer_html_components
                                            Component.element(
                                              tag: "span",
                                              children: [
                                                Component.text("Added student progress tracking for parents."),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "div",
                                  classes: "pt-2",
                                  children: [
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "div",
                                      classes: "flex flex-wrap gap-1.5 mb-4",
                                      children: [
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "span",
                                          classes:
                                              "px-2 py-0.5 rounded bg-surface-container font-label-mono text-[11px] text-primary",
                                          children: [
                                            Component.text("Flutter"),
                                          ],
                                        ),
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "span",
                                          classes:
                                              "px-2 py-0.5 rounded bg-surface-container font-label-mono text-[11px] text-primary",
                                          children: [
                                            Component.text("Dart"),
                                          ],
                                        ),
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "span",
                                          classes:
                                              "px-2 py-0.5 rounded bg-surface-container font-label-mono text-[11px] text-primary",
                                          children: [
                                            Component.text("REST APIs"),
                                          ],
                                        ),
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "span",
                                          classes:
                                              "px-2 py-0.5 rounded bg-surface-container font-label-mono text-[11px] text-primary",
                                          children: [
                                            Component.text("Chat"),
                                          ],
                                        ),
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "span",
                                          classes:
                                              "px-2 py-0.5 rounded bg-surface-container font-label-mono text-[11px] text-primary",
                                          children: [
                                            Component.text("Payments"),
                                          ],
                                        ),
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "span",
                                          classes:
                                              "px-2 py-0.5 rounded bg-surface-container font-label-mono text-[11px] text-primary",
                                          children: [
                                            Component.text("Real-time Features"),
                                          ],
                                        ),
                                      ],
                                    ),
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "a",
                                      classes:
                                          "inline-flex items-center gap-2 px-4 py-2 rounded-lg bg-surface-container-high text-on-surface font-body-md text-body-sm font-semibold border border-outline-variant/40 hover:border-secondary/60 hover:text-secondary transition-all group/drisavo-ios",
                                      attributes: {
                                        "href": "https://apps.apple.com/us/app/drisavo/id6759968663",
                                        "rel": "noopener noreferrer",
                                        "target": "_blank",
                                        "aria-label": "Download Drisavo for iOS from the App Store",
                                      },
                                      children: [
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "svg",
                                          classes: "w-[18px] h-[18px] fill-current",
                                          attributes: {
                                            "aria-hidden": "true",
                                            "viewBox": "0 0 384 512",
                                          },
                                          children: [
                                            // ignore: prefer_html_components
                                            Component.element(
                                              tag: "path",
                                              attributes: {
                                                "d":
                                                    "M318.7 268.7c-.2-36.7 16.4-64.4 50-84.8-18.8-26.9-47.2-41.7-84.7-44.6-35.5-2.8-74.3 20.7-88.5 20.7-15 0-49.4-19.7-76.4-19.7C63.3 141.2 4 184.8 4 273.5c0 26.9 4.9 54.6 14.8 83.1 13.2 36.7 60.8 126.7 110.5 125.2 26-.6 44.3-18.4 78.2-18.4 32.9 0 49.8 18.4 78.8 18.4 50.1-.7 93.3-82.5 105.9-119.3-67.1-31.6-73.5-93.3-73.5-95.6zm-23.2-164.2c27.3-32.4 24.8-61.9 24-72.5-24.1 1.4-52 16.4-67.9 34.9-17.5 19.8-27.8 44.3-25.6 71.9 26.1 2 49.9-11.4 69.5-34.3z",
                                              },
                                            ),
                                          ],
                                        ),
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "span",
                                          children: [
                                            Component.text("iOS"),
                                          ],
                                        ),
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "span",
                                          classes:
                                              "material-symbols-outlined text-[15px] group-hover/drisavo-ios:translate-x-1 transition-transform",
                                          children: [
                                            Component.text("open_in_new"),
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
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "article",
                          classes:
                              "project-item rounded-xl bg-surface-container-low border border-outline-variant/30 hover:border-primary/50 transition-all duration-300 flex flex-col overflow-hidden group shadow-lg",
                          attributes: {
                            "data-categories": "mobile",
                          },
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes:
                                  "relative h-64 overflow-hidden border-b border-outline-variant/20 bg-surface-container-high",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "img",
                                  classes:
                                      "h-full w-full object-cover transition-transform duration-500 group-hover:scale-[1.02]",
                                  attributes: {
                                    "alt": "Prime Bac baccalaureate learning platform on desktop and mobile devices",
                                    "decoding": "async",
                                    "loading": "lazy",
                                    "src": "assets/images/prime-bac/drisavo-bac-all.png",
                                  },
                                ),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes: "p-6 flex flex-col flex-1 justify-between space-y-4",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "div",
                                  children: [
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "div",
                                      classes: "flex items-center justify-between mb-2",
                                      children: [
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "span",
                                          classes:
                                              "font-label-mono text-label-mono-xs text-secondary uppercase font-semibold",
                                          children: [
                                            Component.text("Learning Platform"),
                                          ],
                                        ),
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "span",
                                          classes: "font-label-mono text-label-mono-xs text-on-surface-variant",
                                          children: [
                                            Component.text("BACCALAUREATE"),
                                          ],
                                        ),
                                      ],
                                    ),
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "h4",
                                      classes:
                                          "font-headline-sm text-headline-sm text-on-surface font-semibold group-hover:text-primary transition-colors",
                                      children: [
                                        Component.text(" Prime Bac - Baccalaureate Learning Platform "),
                                      ],
                                    ),
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "p",
                                      classes: "font-body-md text-body-md text-on-surface-variant mt-2 leading-relaxed",
                                      children: [
                                        Component.text(
                                          " Educational platform for Baccalaureate students focused on exam preparation and study organization. ",
                                        ),
                                      ],
                                    ),
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "ul",
                                      classes:
                                          "mt-3 space-y-1.5 font-body-sm text-body-sm text-on-surface-variant leading-relaxed",
                                      children: [
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "li",
                                          classes: "flex gap-2",
                                          children: [
                                            // ignore: prefer_html_components
                                            Component.element(
                                              tag: "span",
                                              classes: "text-secondary",
                                              children: [
                                                Component.text("•"),
                                              ],
                                            ),
                                            // ignore: prefer_html_components
                                            Component.element(
                                              tag: "span",
                                              children: [
                                                Component.text(
                                                  "Developed chapter, section, and full-course tests with interactive learning resources.",
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "li",
                                          classes: "flex gap-2",
                                          children: [
                                            // ignore: prefer_html_components
                                            Component.element(
                                              tag: "span",
                                              classes: "text-secondary",
                                              children: [
                                                Component.text("•"),
                                              ],
                                            ),
                                            // ignore: prefer_html_components
                                            Component.element(
                                              tag: "span",
                                              children: [
                                                Component.text(
                                                  "Implemented student–instructor communication and study task scheduling.",
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "li",
                                          classes: "flex gap-2",
                                          children: [
                                            // ignore: prefer_html_components
                                            Component.element(
                                              tag: "span",
                                              classes: "text-secondary",
                                              children: [
                                                Component.text("•"),
                                              ],
                                            ),
                                            // ignore: prefer_html_components
                                            Component.element(
                                              tag: "span",
                                              children: [
                                                Component.text(
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
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "div",
                                  classes: "pt-2",
                                  children: [
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "div",
                                      classes: "flex flex-wrap gap-1.5",
                                      children: [
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "span",
                                          classes:
                                              "px-2 py-0.5 rounded bg-surface-container font-label-mono text-[11px] text-primary",
                                          children: [
                                            Component.text("Real-time Communication"),
                                          ],
                                        ),
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "span",
                                          classes:
                                              "px-2 py-0.5 rounded bg-surface-container font-label-mono text-[11px] text-primary",
                                          children: [
                                            Component.text("Task Management"),
                                          ],
                                        ),
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "span",
                                          classes:
                                              "px-2 py-0.5 rounded bg-surface-container font-label-mono text-[11px] text-primary",
                                          children: [
                                            Component.text("Offline Access"),
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
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "article",
                          classes:
                              "project-item rounded-xl bg-surface-container-low border border-outline-variant/30 hover:border-primary/50 transition-all duration-300 flex flex-col overflow-hidden group shadow-lg",
                          attributes: {
                            "data-categories": "mobile",
                          },
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes:
                                  "relative h-64 overflow-hidden border-b border-outline-variant/20 bg-surface-container-high",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "img",
                                  classes:
                                      "h-full w-full object-cover transition-transform duration-500 group-hover:scale-[1.02]",
                                  attributes: {
                                    "alt": "Elegance e-commerce shopping app on desktop and mobile devices",
                                    "decoding": "async",
                                    "loading": "lazy",
                                    "src": "assets/images/elegance/elegance-all.png",
                                  },
                                ),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes: "p-6 flex flex-col flex-1 justify-between space-y-4",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "div",
                                  children: [
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "div",
                                      classes: "flex items-center justify-between mb-2",
                                      children: [
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "span",
                                          classes:
                                              "font-label-mono text-label-mono-xs text-secondary uppercase font-semibold",
                                          children: [
                                            Component.text("Mobile • iOS & Android"),
                                          ],
                                        ),
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "span",
                                          classes: "font-label-mono text-label-mono-xs text-on-surface-variant",
                                          children: [
                                            Component.text("E-COMMERCE"),
                                          ],
                                        ),
                                      ],
                                    ),
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "h4",
                                      classes:
                                          "font-headline-sm text-headline-sm text-on-surface font-semibold group-hover:text-primary transition-colors",
                                      children: [
                                        Component.text(" Elegance - E-Commerce Shop App "),
                                      ],
                                    ),
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "p",
                                      classes: "font-body-md text-body-md text-on-surface-variant mt-2 leading-relaxed",
                                      children: [
                                        Component.text(
                                          " A polished cross-platform shopping app that lets customers browse products, shop offline, manage their cart, and complete secure purchases through PayPal. ",
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "div",
                                  classes: "pt-2",
                                  children: [
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "div",
                                      classes: "flex flex-wrap gap-1.5",
                                      children: [
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "span",
                                          classes:
                                              "px-2 py-0.5 rounded bg-surface-container font-label-mono text-[11px] text-primary",
                                          children: [
                                            Component.text("Offline Access"),
                                          ],
                                        ),
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "span",
                                          classes:
                                              "px-2 py-0.5 rounded bg-surface-container font-label-mono text-[11px] text-primary",
                                          children: [
                                            Component.text("PayPal Payment"),
                                          ],
                                        ),
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "span",
                                          classes:
                                              "px-2 py-0.5 rounded bg-surface-container font-label-mono text-[11px] text-primary",
                                          children: [
                                            Component.text("Android/iOS"),
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
                // ignore: prefer_html_components
                Component.element(
                  tag: "section",
                  classes: "w-full bg-surface-container-lowest border-y border-outline-variant/20 py-16 mb-20",
                  children: [
                    // ignore: prefer_html_components
                    Component.element(
                      tag: "div",
                      classes: "max-w-7xl mx-auto px-6 sm:px-8",
                      children: [
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "div",
                          classes: "mb-10 flex flex-col sm:flex-row sm:items-end justify-between gap-4",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes:
                                      "font-label-mono text-label-mono-xs text-secondary uppercase tracking-widest font-semibold",
                                  children: [
                                    Component.text("Engineered Precision"),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "h3",
                                  classes: "font-headline-md text-headline-md text-on-surface font-semibold mt-1",
                                  children: [
                                    Component.text(" Multi-Disciplinary Delivery "),
                                  ],
                                ),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "p",
                              classes: "font-body-sm text-body-sm text-on-surface-variant max-w-md",
                              children: [
                                Component.text(
                                  " Every platform engineered by Brothers-Tech is built with production-grade telemetry, strict code audits, and uncompromising uptime standards. ",
                                ),
                              ],
                            ),
                          ],
                        ),
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "div",
                          classes: "grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes:
                                  "p-6 rounded-xl bg-surface-container-low border border-outline-variant/30 hover:border-secondary/40 transition-colors space-y-3",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "div",
                                  classes:
                                      "w-10 h-10 rounded-lg bg-surface-container-high flex items-center justify-center text-secondary",
                                  children: [
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "span",
                                      classes: "material-symbols-outlined text-[24px]",
                                      children: [
                                        Component.text("phone_android"),
                                      ],
                                    ),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "h4",
                                  classes: "font-headline-sm text-headline-sm text-on-surface font-semibold",
                                  children: [
                                    Component.text(" Mobile Apps "),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "p",
                                  classes: "font-body-sm text-body-sm text-on-surface-variant leading-relaxed",
                                  children: [
                                    Component.text(
                                      " Native and cross-platform mobile apps for iOS and Android with 60fps gesture fidelity. ",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes:
                                  "p-6 rounded-xl bg-surface-container-low border border-outline-variant/30 hover:border-secondary/40 transition-colors space-y-3",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "div",
                                  classes:
                                      "w-10 h-10 rounded-lg bg-surface-container-high flex items-center justify-center text-primary",
                                  children: [
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "span",
                                      classes: "material-symbols-outlined text-[24px]",
                                      children: [
                                        Component.text("web"),
                                      ],
                                    ),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "h4",
                                  classes: "font-headline-sm text-headline-sm text-on-surface font-semibold",
                                  children: [
                                    Component.text(" Web Platforms "),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "p",
                                  classes: "font-body-sm text-body-sm text-on-surface-variant leading-relaxed",
                                  children: [
                                    Component.text(
                                      " Complex web applications, responsive SaaS portals, and high-performance digital platforms. ",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes:
                                  "p-6 rounded-xl bg-surface-container-low border border-outline-variant/30 hover:border-secondary/40 transition-colors space-y-3",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "div",
                                  classes:
                                      "w-10 h-10 rounded-lg bg-surface-container-high flex items-center justify-center text-secondary",
                                  children: [
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "span",
                                      classes: "material-symbols-outlined text-[24px]",
                                      children: [
                                        Component.text("desktop_windows"),
                                      ],
                                    ),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "h4",
                                  classes: "font-headline-sm text-headline-sm text-on-surface font-semibold",
                                  children: [
                                    Component.text(" Desktop Systems "),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "p",
                                  classes: "font-body-sm text-body-sm text-on-surface-variant leading-relaxed",
                                  children: [
                                    Component.text(
                                      " Native macOS and Windows administrative tools, terminals, and offline-capable software. ",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes:
                                  "p-6 rounded-xl bg-surface-container-low border border-outline-variant/30 hover:border-secondary/40 transition-colors space-y-3",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "div",
                                  classes:
                                      "w-10 h-10 rounded-lg bg-surface-container-high flex items-center justify-center text-primary",
                                  children: [
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "span",
                                      classes: "material-symbols-outlined text-[24px]",
                                      children: [
                                        Component.text("dns"),
                                      ],
                                    ),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "h4",
                                  classes: "font-headline-sm text-headline-sm text-on-surface font-semibold",
                                  children: [
                                    Component.text(" Secure Data & Integrations "),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "p",
                                  classes: "font-body-sm text-body-sm text-on-surface-variant leading-relaxed",
                                  children: [
                                    Component.text(
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
                // ignore: prefer_html_components
                Component.element(
                  tag: "section",
                  classes: "w-full max-w-7xl mx-auto px-6 sm:px-8 mb-24",
                  children: [
                    // ignore: prefer_html_components
                    Component.element(
                      tag: "div",
                      classes:
                          "relative rounded-2xl bg-gradient-to-r from-surface-container to-surface-container-low border border-outline-variant/40 p-10 sm:p-14 overflow-hidden text-center flex flex-col items-center justify-center shadow-2xl",
                      children: [
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "div",
                          classes:
                              "absolute -top-24 left-1/2 -translate-x-1/2 w-96 h-96 bg-primary-container/20 rounded-full blur-[100px] pointer-events-none",
                        ),
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "div",
                          classes: "relative z-10 max-w-2xl space-y-6",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "h2",
                              classes: "font-headline-lg text-headline-lg text-on-surface font-semibold tracking-tight",
                              children: [
                                Component.text(" Have an Idea? Let's Build It Together. "),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "p",
                              classes: "font-body-lg text-body-lg text-on-surface-variant leading-relaxed",
                              children: [
                                Component.text(
                                  " Whether you're starting something new or scaling an existing product, let's turn your idea into reliable, production-ready software. ",
                                ),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes: "pt-2 flex flex-col sm:flex-row items-center justify-center gap-4",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "a",
                                  classes:
                                      "inline-flex items-center justify-center h-12 px-8 rounded-lg bg-primary-container text-on-primary-container font-headline-sm text-body-md font-medium hover:bg-primary transition-all duration-200 shadow-[0_0_24px_rgba(77,142,255,0.4)]",
                                  attributes: {
                                    "href": "/contact",
                                  },
                                  children: [
                                    Component.text(" Tell Us About Your Project → "),
                                  ],
                                ),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes:
                                  "flex items-center justify-center gap-2 pt-2 font-label-mono text-label-mono-xs text-secondary font-medium",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes: "w-2 h-2 rounded-full bg-secondary animate-pulse",
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  children: [
                                    Component.text("Available for new projects"),
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
        // ignore: prefer_html_components
        Component.element(
          tag: "footer",
          classes: "w-full bg-surface-container-lowest border-t border-[rgba(255,255,255,0.08)] py-16",
          children: [
            // ignore: prefer_html_components
            Component.element(
              tag: "div",
              classes: "max-w-7xl mx-auto px-6 sm:px-8",
              children: [
                // ignore: prefer_html_components
                Component.element(
                  tag: "div",
                  classes: "grid grid-cols-1 md:grid-cols-4 gap-10 mb-12",
                  children: [
                    // ignore: prefer_html_components
                    Component.element(
                      tag: "div",
                      classes: "space-y-4",
                      children: [
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "div",
                          classes: "flex items-center gap-2",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "span",
                              classes: "font-headline-sm text-headline-sm text-on-surface font-semibold",
                              children: [
                                Component.text("Brothers-Tech"),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "span",
                              classes: "h-2 w-2 rounded-full bg-secondary shadow-[0_0_8px_#4cd7f6]",
                            ),
                          ],
                        ),
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "p",
                          classes: "font-body-sm text-body-sm text-on-surface-variant leading-relaxed",
                          children: [
                            Component.text(
                              " Architecting elite software systems, AI infrastructure, and mission-critical cloud platforms for modern enterprises. ",
                            ),
                          ],
                        ),
                      ],
                    ),
                    // ignore: prefer_html_components
                    Component.element(
                      tag: "div",
                      children: [
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "h4",
                          classes: "font-label-mono text-label-mono text-on-surface uppercase tracking-wider mb-4",
                          children: [
                            Component.text(" Navigation "),
                          ],
                        ),
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "ul",
                          classes: "space-y-2.5 font-body-sm text-body-sm text-on-surface-variant",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "li",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "a",
                                  classes: "hover:text-primary transition-colors",
                                  attributes: {
                                    "data-path": "home",
                                    "href": "/",
                                  },
                                  children: [
                                    Component.text("Home"),
                                  ],
                                ),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "li",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "a",
                                  classes: "hover:text-primary transition-colors",
                                  attributes: {
                                    "data-path": "services",
                                    "href": "/services",
                                  },
                                  children: [
                                    Component.text("Services"),
                                  ],
                                ),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "li",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "a",
                                  classes: "hover:text-primary transition-colors",
                                  attributes: {
                                    "data-path": "projects",
                                    "href": "/projects",
                                  },
                                  children: [
                                    Component.text("Projects"),
                                  ],
                                ),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "li",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "a",
                                  classes: "hover:text-primary transition-colors",
                                  attributes: {
                                    "data-path": "about",
                                    "href": "/about",
                                  },
                                  children: [
                                    Component.text("About"),
                                  ],
                                ),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "li",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "a",
                                  classes: "hover:text-primary transition-colors",
                                  attributes: {
                                    "data-path": "contact",
                                    "href": "/contact",
                                  },
                                  children: [
                                    Component.text("Contact"),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    // ignore: prefer_html_components
                    Component.element(
                      tag: "div",
                      children: [
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "h4",
                          classes: "font-label-mono text-label-mono text-on-surface uppercase tracking-wider mb-4",
                          children: [
                            Component.text(" Practices "),
                          ],
                        ),
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "ul",
                          classes: "space-y-2.5 font-body-sm text-body-sm text-on-surface-variant",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "li",
                              children: [
                                Component.text("Full-Stack Platforms"),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "li",
                              children: [
                                Component.text("AI & Machine Learning"),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    // ignore: prefer_html_components
                    Component.element(
                      tag: "div",
                      children: [
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "h4",
                          classes: "font-label-mono text-label-mono text-on-surface uppercase tracking-wider mb-4",
                          children: [
                            Component.text(" Studio "),
                          ],
                        ),
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "p",
                          classes: "font-body-sm text-body-sm text-on-surface-variant mb-4",
                          children: [
                            Component.text(" Engineering disciplined technical solutions with surgical execution. "),
                          ],
                        ),
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "div",
                          classes: "flex items-center gap-3 text-secondary font-label-mono text-label-mono",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "span",
                              children: [
                                Component.text("EST. 2024"),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "span",
                              classes: "inline-block w-1.5 h-1.5 rounded-full bg-secondary",
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "span",
                              children: [
                                Component.text("GLOBAL CORE"),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                // ignore: prefer_html_components
                Component.element(
                  tag: "div",
                  classes:
                      "pt-8 border-t border-[rgba(255,255,255,0.06)] flex flex-col sm:flex-row items-center justify-between gap-4 font-label-mono text-label-mono-xs text-on-surface-variant",
                  children: [
                    // ignore: prefer_html_components
                    Component.element(
                      tag: "p",
                      children: [
                        Component.text("© 2025 Brothers-Tech Studio. All rights reserved."),
                      ],
                    ),
                    // ignore: prefer_html_components
                    Component.element(
                      tag: "div",
                      classes: "flex items-center gap-6",
                      children: [
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "a",
                          classes: "hover:text-on-surface transition-colors",
                          attributes: {
                            "href": "#",
                          },
                          children: [
                            Component.text("Security Policy"),
                          ],
                        ),
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "a",
                          classes: "hover:text-on-surface transition-colors",
                          attributes: {
                            "href": "#",
                          },
                          children: [
                            Component.text("Terms of Service"),
                          ],
                        ),
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "a",
                          classes: "hover:text-on-surface transition-colors",
                          attributes: {
                            "href": "#",
                          },
                          children: [
                            Component.text("Privacy Architecture"),
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
      ]),
    ]);
  }
}
