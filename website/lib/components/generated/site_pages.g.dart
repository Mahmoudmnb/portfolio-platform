// Generated as native Jaspr components by tool/import_legacy_pages.dart.
// No raw HTML is rendered by this file.
// ignore_for_file: prefer_html_components

import 'package:jaspr/jaspr.dart';

const homeBodyClasses = "bg-background font-body-md text-on-surface antialiased min-h-screen flex flex-col";

Component buildHomePage() {
  return Component.fragment([
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
                  classes: "px-4 py-2 transition-colors bg-surface-container-high text-primary font-medium rounded-lg",
                  attributes: {
                    "aria-current": "page",
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
              classes: "relative w-full overflow-hidden bg-surface py-16 sm:py-24 lg:py-28",
              children: [
                // ignore: prefer_html_components
                Component.element(
                  tag: "div",
                  classes:
                      "absolute -top-24 left-1/2 -translate-x-1/2 w-[800px] h-[500px] bg-gradient-to-b from-primary/10 via-secondary/5 to-transparent blur-3xl pointer-events-none -z-10",
                ),
                // ignore: prefer_html_components
                Component.element(
                  tag: "div",
                  classes:
                      "absolute top-1/3 -right-24 w-96 h-96 bg-primary-container/10 rounded-full blur-3xl pointer-events-none -z-10",
                ),
                // ignore: prefer_html_components
                Component.element(
                  tag: "div",
                  classes: "max-w-7xl mx-auto px-6 sm:px-8",
                  children: [
                    // ignore: prefer_html_components
                    Component.element(
                      tag: "div",
                      classes: "flex items-center",
                      children: [
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "div",
                          classes: "max-w-4xl flex flex-col items-start space-y-6",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes:
                                  "inline-flex items-center gap-2.5 px-3.5 py-1.5 rounded-full bg-surface-container-high border border-outline-variant/30 text-secondary",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes: "relative flex h-2 w-2",
                                  children: [
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "span",
                                      classes:
                                          "animate-ping absolute inline-flex h-full w-full rounded-full bg-secondary opacity-75",
                                    ),
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "span",
                                      classes: "relative inline-flex rounded-full h-2 w-2 bg-secondary",
                                    ),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes: "font-label-mono text-label-mono uppercase tracking-wider font-semibold",
                                  children: [
                                    Component.text("MULTI-PLATFORM SOFTWARE STUDIO"),
                                  ],
                                ),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "h1",
                              classes:
                                  "font-display-hero text-headline-lg lg:text-display-hero text-on-surface font-semibold tracking-tight leading-[1.1]",
                              children: [
                                Component.text(" We Build Software That "),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes:
                                      "bg-gradient-to-r from-primary via-secondary to-secondary-container bg-clip-text text-transparent",
                                  children: [
                                    Component.text("Moves Businesses Forward."),
                                  ],
                                ),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "p",
                              classes: "font-body-lg text-body-lg text-on-surface-variant max-w-xl leading-relaxed",
                              children: [
                                Component.text(
                                  " From mobile apps to web platforms and desktop systems, Brothers-Tech designs and develops reliable digital products built around real business needs. ",
                                ),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes: "flex flex-wrap items-center gap-4 pt-2 w-full sm:w-auto",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "a",
                                  classes:
                                      "inline-flex items-center justify-center h-12 px-7 rounded-lg bg-primary-container text-on-primary-container font-body-md text-body-md font-semibold hover:bg-primary transition-all duration-200 shadow-[inset_0_1px_0_rgba(255,255,255,0.25),0_0_24px_rgba(77,142,255,0.35)] group",
                                  attributes: {
                                    "data-path": "contact",
                                    "href": "/contact",
                                  },
                                  children: [
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "span",
                                      children: [
                                        Component.text("Start Your Project"),
                                      ],
                                    ),
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "span",
                                      classes:
                                          "material-symbols-outlined ml-2 text-base transition-transform group-hover:translate-x-1",
                                      children: [
                                        Component.text("arrow_forward"),
                                      ],
                                    ),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "a",
                                  classes:
                                      "inline-flex items-center justify-center h-12 px-7 rounded-lg bg-surface-container-high/60 hover:bg-surface-container-high text-on-surface font-body-md text-body-md font-medium border border-outline-variant/40 hover:border-outline/50 transition-all duration-200",
                                  attributes: {
                                    "href": "#selected-work",
                                  },
                                  children: [
                                    Component.text(" Explore Our Work "),
                                  ],
                                ),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes:
                                  "pt-6 flex flex-wrap items-center gap-3 sm:gap-4 border-t border-outline-variant/20 w-full text-on-surface-variant text-body-sm font-label-mono",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "div",
                                  classes: "flex items-center gap-2",
                                  children: [
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "span",
                                      classes: "material-symbols-outlined text-secondary text-base",
                                      children: [
                                        Component.text("check_circle"),
                                      ],
                                    ),
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "span",
                                      classes: "text-on-surface font-medium",
                                      children: [
                                        Component.text("Real-World Products"),
                                      ],
                                    ),
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
                                  tag: "div",
                                  classes: "flex items-center gap-2",
                                  children: [
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "span",
                                      classes: "material-symbols-outlined text-primary text-base",
                                      children: [
                                        Component.text("devices"),
                                      ],
                                    ),
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "span",
                                      classes: "text-on-surface font-medium",
                                      children: [
                                        Component.text("Multi-Platform Dev"),
                                      ],
                                    ),
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
                                  tag: "div",
                                  classes: "flex items-center gap-2",
                                  children: [
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "span",
                                      classes: "material-symbols-outlined text-secondary text-base",
                                      children: [
                                        Component.text("verified"),
                                      ],
                                    ),
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "span",
                                      classes: "text-on-surface font-medium",
                                      children: [
                                        Component.text("End-to-End Delivery"),
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
              classes: "w-full bg-surface-container-lowest border-y border-outline-variant/20 py-8",
              children: [
                // ignore: prefer_html_components
                Component.element(
                  tag: "div",
                  classes: "max-w-7xl mx-auto px-6 sm:px-8",
                  children: [
                    // ignore: prefer_html_components
                    Component.element(
                      tag: "div",
                      classes:
                          "grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6 lg:gap-8 divide-y sm:divide-y-0 sm:divide-x divide-outline-variant/20",
                      children: [
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "div",
                          classes: "flex flex-col space-y-1.5 pt-4 sm:pt-0 sm:px-4 first:px-0",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes: "flex items-center gap-2",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes: "material-symbols-outlined text-primary text-xl",
                                  children: [
                                    Component.text("deployed_code"),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes: "font-headline-sm text-headline-sm text-on-surface font-semibold",
                                  children: [
                                    Component.text("Real-World Products"),
                                  ],
                                ),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "p",
                              classes: "font-body-sm text-body-sm text-on-surface-variant",
                              children: [
                                Component.text(
                                  " Software built for actual users, stress-tested workflows, and commercial viability. ",
                                ),
                              ],
                            ),
                          ],
                        ),
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "div",
                          classes: "flex flex-col space-y-1.5 pt-4 sm:pt-0 sm:px-4",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes: "flex items-center gap-2",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes: "material-symbols-outlined text-secondary text-xl",
                                  children: [
                                    Component.text("devices"),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes: "font-headline-sm text-headline-sm text-on-surface font-semibold",
                                  children: [
                                    Component.text("Multi-Platform"),
                                  ],
                                ),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "p",
                              classes:
                                  "font-body-sm text-body-sm text-on-surface-variant font-label-mono text-secondary",
                              children: [
                                Component.text(" Android • iOS • Web • Desktop "),
                              ],
                            ),
                          ],
                        ),
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "div",
                          classes: "flex flex-col space-y-1.5 pt-4 sm:pt-0 sm:px-4",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes: "flex items-center gap-2",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes: "material-symbols-outlined text-primary text-xl",
                                  children: [
                                    Component.text("account_tree"),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes: "font-headline-sm text-headline-sm text-on-surface font-semibold",
                                  children: [
                                    Component.text("End-to-End Dev"),
                                  ],
                                ),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "p",
                              classes: "font-body-sm text-body-sm text-on-surface-variant",
                              children: [
                                Component.text(
                                  " From architectural whiteboard to production deployment and lifecycle support. ",
                                ),
                              ],
                            ),
                          ],
                        ),
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "div",
                          classes: "flex flex-col space-y-1.5 pt-4 sm:pt-0 sm:px-4",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes: "flex items-center gap-2",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes: "material-symbols-outlined text-secondary text-xl",
                                  children: [
                                    Component.text("bolt"),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes: "font-headline-sm text-headline-sm text-on-surface font-semibold",
                                  children: [
                                    Component.text("Modern Tech Stack"),
                                  ],
                                ),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "p",
                              classes: "font-body-sm text-body-sm text-on-surface-variant",
                              children: [
                                Component.text(
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
            // ignore: prefer_html_components
            Component.element(
              tag: "section",
              id: "services",
              classes: "w-full bg-surface py-20 lg:py-28 relative",
              children: [
                // ignore: prefer_html_components
                Component.element(
                  tag: "div",
                  classes: "max-w-7xl mx-auto px-6 sm:px-8",
                  children: [
                    // ignore: prefer_html_components
                    Component.element(
                      tag: "div",
                      classes: "max-w-3xl mb-16 space-y-4",
                      children: [
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "div",
                          classes:
                              "inline-flex items-center gap-2 font-label-mono text-label-mono uppercase tracking-wider text-secondary",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "span",
                              classes: "h-1.5 w-1.5 rounded-full bg-secondary",
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "span",
                              children: [
                                Component.text("WHAT WE DO"),
                              ],
                            ),
                          ],
                        ),
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "h2",
                          classes:
                              "font-headline-lg text-headline-lg lg:text-[44px] lg:leading-[52px] text-on-surface font-semibold tracking-tight",
                          children: [
                            Component.text(" Everything You Need to Build Your Product. "),
                          ],
                        ),
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "p",
                          classes: "font-body-lg text-body-lg text-on-surface-variant leading-relaxed",
                          children: [
                            Component.text(
                              " Brothers-Tech takes digital products from initial architecture and concept through robust engineering and global cloud deployment. ",
                            ),
                          ],
                        ),
                      ],
                    ),
                    // ignore: prefer_html_components
                    Component.element(
                      tag: "div",
                      classes: "grid grid-cols-1 md:grid-cols-2 gap-6",
                      children: [
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "div",
                          classes:
                              "p-8 rounded-2xl bg-surface-container border border-outline-variant/30 hover:border-primary/50 transition-all duration-300 flex flex-col justify-between group relative overflow-hidden",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes:
                                  "absolute -right-10 -bottom-10 w-40 h-40 bg-primary/5 rounded-full blur-2xl group-hover:bg-primary/10 transition-colors pointer-events-none",
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes: "space-y-4",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "div",
                                  classes: "flex items-center justify-between",
                                  children: [
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "span",
                                      classes: "font-label-mono text-headline-md text-primary font-semibold",
                                      children: [
                                        Component.text("01"),
                                      ],
                                    ),
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "div",
                                      classes:
                                          "w-10 h-10 rounded-lg bg-surface-container-high flex items-center justify-center text-primary group-hover:text-secondary transition-colors",
                                      children: [
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "span",
                                          classes: "material-symbols-outlined",
                                          children: [
                                            Component.text("smartphone"),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "h3",
                                  classes:
                                      "font-headline-md text-headline-md text-on-surface font-semibold group-hover:text-primary transition-colors",
                                  children: [
                                    Component.text(" Mobile App Development "),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "p",
                                  classes: "font-body-md text-body-md text-on-surface-variant leading-relaxed",
                                  children: [
                                    Component.text(
                                      " High-quality Android and iOS applications designed for rapid performance, native gesture fidelity, and faultless offline resilience. ",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes: "pt-8 flex flex-wrap gap-2",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes:
                                      "px-2.5 py-1 rounded bg-surface-container-high text-on-surface-variant font-label-mono-xs text-label-mono-xs border border-outline-variant/20",
                                  children: [
                                    Component.text("Android"),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes:
                                      "px-2.5 py-1 rounded bg-surface-container-high text-on-surface-variant font-label-mono-xs text-label-mono-xs border border-outline-variant/20",
                                  children: [
                                    Component.text("iOS"),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes:
                                      "px-2.5 py-1 rounded bg-surface-container-high text-on-surface-variant font-label-mono-xs text-label-mono-xs border border-outline-variant/20",
                                  children: [
                                    Component.text("Cross-platform"),
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
                              "p-8 rounded-2xl bg-surface-container border border-outline-variant/30 hover:border-secondary/50 transition-all duration-300 flex flex-col justify-between group relative overflow-hidden",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes:
                                  "absolute -right-10 -bottom-10 w-40 h-40 bg-secondary/5 rounded-full blur-2xl group-hover:bg-secondary/10 transition-colors pointer-events-none",
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes: "space-y-4",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "div",
                                  classes: "flex items-center justify-between",
                                  children: [
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "span",
                                      classes: "font-label-mono text-headline-md text-secondary font-semibold",
                                      children: [
                                        Component.text("02"),
                                      ],
                                    ),
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "div",
                                      classes:
                                          "w-10 h-10 rounded-lg bg-surface-container-high flex items-center justify-center text-secondary transition-colors",
                                      children: [
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "span",
                                          classes: "material-symbols-outlined",
                                          children: [
                                            Component.text("web"),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "h3",
                                  classes:
                                      "font-headline-md text-headline-md text-on-surface font-semibold group-hover:text-secondary transition-colors",
                                  children: [
                                    Component.text(" Web Development "),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "p",
                                  classes: "font-body-md text-body-md text-on-surface-variant leading-relaxed",
                                  children: [
                                    Component.text(
                                      " Modern websites, dynamic web applications, dashboards, and enterprise platforms architected for ultra-low latency and search discovery. ",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes: "pt-8 flex flex-wrap gap-2",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes:
                                      "px-2.5 py-1 rounded bg-surface-container-high text-on-surface-variant font-label-mono-xs text-label-mono-xs border border-outline-variant/20",
                                  children: [
                                    Component.text("Web Apps"),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes:
                                      "px-2.5 py-1 rounded bg-surface-container-high text-on-surface-variant font-label-mono-xs text-label-mono-xs border border-outline-variant/20",
                                  children: [
                                    Component.text("Dashboards"),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes:
                                      "px-2.5 py-1 rounded bg-surface-container-high text-on-surface-variant font-label-mono-xs text-label-mono-xs border border-outline-variant/20",
                                  children: [
                                    Component.text("Business Platforms"),
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
                              "p-8 rounded-2xl bg-surface-container border border-outline-variant/30 hover:border-primary/50 transition-all duration-300 flex flex-col justify-between group relative overflow-hidden",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes:
                                  "absolute -right-10 -bottom-10 w-40 h-40 bg-primary/5 rounded-full blur-2xl group-hover:bg-primary/10 transition-colors pointer-events-none",
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes: "space-y-4",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "div",
                                  classes: "flex items-center justify-between",
                                  children: [
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "span",
                                      classes: "font-label-mono text-headline-md text-primary font-semibold",
                                      children: [
                                        Component.text("03"),
                                      ],
                                    ),
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "div",
                                      classes:
                                          "w-10 h-10 rounded-lg bg-surface-container-high flex items-center justify-center text-primary group-hover:text-secondary transition-colors",
                                      children: [
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "span",
                                          classes: "material-symbols-outlined",
                                          children: [
                                            Component.text("desktop_windows"),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "h3",
                                  classes:
                                      "font-headline-md text-headline-md text-on-surface font-semibold group-hover:text-primary transition-colors",
                                  children: [
                                    Component.text(" Desktop Applications "),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "p",
                                  classes: "font-body-md text-body-md text-on-surface-variant leading-relaxed",
                                  children: [
                                    Component.text(
                                      " Reliable desktop software, administrative terminals, and offline-capable management systems built seamlessly around complex operations. ",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes: "pt-8 flex flex-wrap gap-2",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes:
                                      "px-2.5 py-1 rounded bg-surface-container-high text-on-surface-variant font-label-mono-xs text-label-mono-xs border border-outline-variant/20",
                                  children: [
                                    Component.text("Desktop"),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes:
                                      "px-2.5 py-1 rounded bg-surface-container-high text-on-surface-variant font-label-mono-xs text-label-mono-xs border border-outline-variant/20",
                                  children: [
                                    Component.text("Management Systems"),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes:
                                      "px-2.5 py-1 rounded bg-surface-container-high text-on-surface-variant font-label-mono-xs text-label-mono-xs border border-outline-variant/20",
                                  children: [
                                    Component.text("Business Software"),
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
                              "p-8 rounded-2xl bg-surface-container border border-outline-variant/30 hover:border-primary/50 transition-all duration-300 flex flex-col justify-between group relative overflow-hidden",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes:
                                  "absolute -right-10 -bottom-10 w-40 h-40 bg-primary/5 rounded-full blur-2xl group-hover:bg-primary/10 transition-colors pointer-events-none",
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes: "space-y-4",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "div",
                                  classes: "flex items-center justify-between",
                                  children: [
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "span",
                                      classes: "font-label-mono text-headline-md text-primary font-semibold",
                                      children: [
                                        Component.text("04"),
                                      ],
                                    ),
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "div",
                                      classes:
                                          "w-10 h-10 rounded-lg bg-surface-container-high flex items-center justify-center text-primary group-hover:text-secondary transition-colors",
                                      children: [
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "span",
                                          classes: "material-symbols-outlined",
                                          children: [
                                            Component.text("design_services"),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "h3",
                                  classes:
                                      "font-headline-md text-headline-md text-on-surface font-semibold group-hover:text-primary transition-colors",
                                  children: [
                                    Component.text(" UI/UX Design "),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "p",
                                  classes: "font-body-md text-body-md text-on-surface-variant leading-relaxed",
                                  children: [
                                    Component.text(
                                      " Clean and intuitive digital interfaces engineered around real user psychology, rigorous accessibility specs, and brand identity standards. ",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes: "pt-8 flex flex-wrap gap-2",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes:
                                      "px-2.5 py-1 rounded bg-surface-container-high text-on-surface-variant font-label-mono-xs text-label-mono-xs border border-outline-variant/20",
                                  children: [
                                    Component.text("UX"),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes:
                                      "px-2.5 py-1 rounded bg-surface-container-high text-on-surface-variant font-label-mono-xs text-label-mono-xs border border-outline-variant/20",
                                  children: [
                                    Component.text("UI"),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes:
                                      "px-2.5 py-1 rounded bg-surface-container-high text-on-surface-variant font-label-mono-xs text-label-mono-xs border border-outline-variant/20",
                                  children: [
                                    Component.text("Product Design"),
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
              id: "selected-work",
              classes: "w-full bg-surface-container-low py-20 lg:py-28 relative",
              children: [
                // ignore: prefer_html_components
                Component.element(
                  tag: "div",
                  classes: "max-w-7xl mx-auto px-6 sm:px-8",
                  children: [
                    // ignore: prefer_html_components
                    Component.element(
                      tag: "div",
                      classes: "flex flex-col md:flex-row md:items-end justify-between mb-16 gap-6",
                      children: [
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "div",
                          classes: "max-w-2xl space-y-4",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes:
                                  "inline-flex items-center gap-2 font-label-mono text-label-mono uppercase tracking-wider text-secondary",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes: "h-1.5 w-1.5 rounded-full bg-secondary",
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  children: [
                                    Component.text("SELECTED WORK"),
                                  ],
                                ),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "h2",
                              classes:
                                  "font-headline-lg text-headline-lg lg:text-[44px] lg:leading-[52px] text-on-surface font-semibold tracking-tight",
                              children: [
                                Component.text(" Software Built for the Real World. "),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "p",
                              classes: "font-body-lg text-body-lg text-on-surface-variant",
                              children: [
                                Component.text(
                                  " Showcase of selected applications and digital platforms engineered by Brothers-Tech. ",
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
                          "p-8 sm:p-10 lg:p-12 rounded-3xl bg-surface-container border border-outline-variant/40 hover:border-primary/50 transition-all duration-300 mb-8 shadow-2xl",
                      children: [
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "div",
                          classes: "grid grid-cols-1 lg:grid-cols-12 gap-10 items-center",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes: "lg:col-span-6 space-y-6",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "div",
                                  classes: "font-label-mono text-label-mono text-secondary uppercase tracking-wider",
                                  children: [
                                    Component.text(" Featured Project • Medical Education "),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "h3",
                                  classes:
                                      "font-headline-lg text-headline-md sm:text-headline-lg text-on-surface font-semibold",
                                  children: [
                                    Component.text(" Prime - Medical Education Platform "),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "p",
                                  classes: "font-body-lg text-body-lg text-on-surface-variant leading-relaxed",
                                  children: [
                                    Component.text(
                                      " Mobile learning platform for medical students at Aleppo University. ",
                                    ),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "ul",
                                  classes: "space-y-2 text-on-surface-variant font-body-md text-body-md",
                                  children: [
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "li",
                                      classes: "flex items-start gap-2",
                                      children: [
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "span",
                                          classes: "text-secondary mt-0.5",
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
                                      classes: "flex items-start gap-2",
                                      children: [
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "span",
                                          classes: "text-secondary mt-0.5",
                                          children: [
                                            Component.text("•"),
                                          ],
                                        ),
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "span",
                                          children: [
                                            Component.text("Integrated an AI assistant and offline content access."),
                                          ],
                                        ),
                                      ],
                                    ),
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "li",
                                      classes: "flex items-start gap-2",
                                      children: [
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "span",
                                          classes: "text-secondary mt-0.5",
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
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "div",
                                  classes: "flex flex-wrap gap-2 pt-2",
                                  children: [
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "span",
                                      classes:
                                          "px-3 py-1 rounded-md bg-surface-container-high text-secondary font-label-mono text-label-mono border border-secondary/20",
                                      children: [
                                        Component.text("Android/iOS"),
                                      ],
                                    ),
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "span",
                                      classes:
                                          "px-3 py-1 rounded-md bg-surface-container-high text-secondary font-label-mono text-label-mono border border-secondary/20",
                                      children: [
                                        Component.text("Encryption"),
                                      ],
                                    ),
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "span",
                                      classes:
                                          "px-3 py-1 rounded-md bg-surface-container-high text-secondary font-label-mono text-label-mono border border-secondary/20",
                                      children: [
                                        Component.text("AI Assistant"),
                                      ],
                                    ),
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "span",
                                      classes:
                                          "px-3 py-1 rounded-md bg-surface-container-high text-secondary font-label-mono text-label-mono border border-secondary/20",
                                      children: [
                                        Component.text("Offline Data"),
                                      ],
                                    ),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "div",
                                  classes: "pt-4 flex flex-wrap gap-3",
                                  children: [
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "a",
                                      classes:
                                          "inline-flex items-center gap-2 px-6 py-3 rounded-lg bg-primary-container text-on-primary-container font-body-md text-body-md font-semibold hover:bg-primary transition-all shadow-[0_0_20px_rgba(77,142,255,0.3)] group",
                                      attributes: {
                                        "href": "https://play.google.com/store/apps/details?id=com.brothers.prime",
                                        "target": "_blank",
                                        "rel": "noopener noreferrer",
                                        "aria-label": "Download Prime for Android from Google Play",
                                      },
                                      children: [
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "span",
                                          classes: "material-symbols-outlined text-lg",
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
                                              "material-symbols-outlined text-base group-hover:translate-x-1 transition-transform",
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
                                          "inline-flex items-center gap-2 px-6 py-3 rounded-lg bg-surface-container-high text-on-surface font-body-md text-body-md font-semibold border border-outline-variant/40 hover:border-secondary/60 hover:text-secondary transition-all group",
                                      attributes: {
                                        "href": "https://apps.apple.com/us/app/prime/id6758918919",
                                        "target": "_blank",
                                        "rel": "noopener noreferrer",
                                        "aria-label": "Download Prime for iOS from the App Store",
                                      },
                                      children: [
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "svg",
                                          classes: "w-5 h-5 fill-current",
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
                                              "material-symbols-outlined text-base group-hover:translate-x-1 transition-transform",
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
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes:
                                  "lg:col-span-6 relative flex items-center justify-center px-2 pt-2 pb-12 sm:p-6 sm:pb-16",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "div",
                                  classes:
                                      "w-full max-w-lg overflow-hidden rounded-2xl border border-outline-variant/40 bg-surface-container-lowest shadow-2xl",
                                  children: [
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "img",
                                      classes: "block w-full h-auto",
                                      attributes: {
                                        "src": "assets/images/prime/cover1.png",
                                        "alt": "Prime medical education platform overview",
                                        "loading": "lazy",
                                      },
                                    ),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "div",
                                  classes: "absolute -bottom-2 right-0 sm:right-2 w-28 sm:w-36",
                                  children: [
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "img",
                                      classes: "block w-full h-auto",
                                      attributes: {
                                        "src": "assets/images/prime/image8.png",
                                        "alt": "Prime medical education mobile learning screen",
                                        "loading": "lazy",
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
                    // ignore: prefer_html_components
                    Component.element(
                      tag: "div",
                      classes: "grid grid-cols-1 md:grid-cols-2 gap-8",
                      children: [
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "div",
                          classes:
                              "p-8 rounded-2xl bg-surface-container border border-outline-variant/30 hover:border-primary/40 transition-all duration-300 flex flex-col justify-between group",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes: "space-y-4",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "div",
                                  classes:
                                      "relative h-72 sm:h-80 rounded-xl bg-surface-container-low border border-outline-variant/30 overflow-hidden group-hover:border-primary/40 transition-colors",
                                  children: [
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "div",
                                      classes:
                                          "absolute top-3 left-3 right-3 overflow-hidden rounded-lg border border-outline-variant/40 bg-surface-container-lowest shadow-xl",
                                      children: [
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "img",
                                          classes: "block w-full h-auto",
                                          attributes: {
                                            "src": "assets/images/alsaad/admin-desktop.png",
                                            "alt": "Alsaad Institute administrator desktop application",
                                            "loading": "lazy",
                                          },
                                        ),
                                      ],
                                    ),
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "div",
                                      classes: "absolute -bottom-1 left-3 sm:left-4 w-24 sm:w-28",
                                      children: [
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "img",
                                          classes: "block w-full h-auto",
                                          attributes: {
                                            "src": "assets/images/alsaad/user-mobile.png",
                                            "alt": "Alsaad Institute student mobile application",
                                            "loading": "lazy",
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "div",
                                  classes:
                                      "font-label-mono-xs text-label-mono-xs text-secondary uppercase tracking-wider pt-2",
                                  children: [
                                    Component.text(" Quran Institute Management System • Android • Desktop "),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "h3",
                                  classes:
                                      "font-headline-md text-headline-md text-on-surface font-semibold group-hover:text-primary transition-colors",
                                  children: [
                                    Component.text(" Alsaad Institute "),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "p",
                                  classes: "font-body-md text-body-md text-on-surface-variant leading-relaxed",
                                  children: [
                                    Component.text(
                                      " A multi-platform institute management system with separate applications for administrators, teachers, and students. ",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes: "pt-6 flex flex-wrap gap-2",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes:
                                      "px-2.5 py-1 rounded bg-surface-container-high text-on-surface-variant font-label-mono-xs text-label-mono-xs border border-outline-variant/20",
                                  children: [
                                    Component.text("Admin Portal"),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes:
                                      "px-2.5 py-1 rounded bg-surface-container-high text-on-surface-variant font-label-mono-xs text-label-mono-xs border border-outline-variant/20",
                                  children: [
                                    Component.text("Teacher App"),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes:
                                      "px-2.5 py-1 rounded bg-surface-container-high text-on-surface-variant font-label-mono-xs text-label-mono-xs border border-outline-variant/20",
                                  children: [
                                    Component.text("Student App"),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes:
                                      "px-2.5 py-1 rounded bg-surface-container-high text-on-surface-variant font-label-mono-xs text-label-mono-xs border border-outline-variant/20",
                                  children: [
                                    Component.text("Academic Tracking"),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "a",
                                  classes:
                                      "w-fit flex-none mt-2 inline-flex items-center gap-2 px-5 py-2.5 rounded-lg bg-primary-container text-on-primary-container font-body-md text-body-md font-semibold hover:bg-primary transition-all shadow-[0_0_18px_rgba(77,142,255,0.25)] group/store",
                                  attributes: {
                                    "href":
                                        "https://play.google.com/store/apps/details?id=com.brothers.alsaad_mosque_institute",
                                    "target": "_blank",
                                    "rel": "noopener noreferrer",
                                    "aria-label": "Download Alsaad Institute for Android from Google Play",
                                  },
                                  children: [
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "span",
                                      classes: "material-symbols-outlined text-lg",
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
                                          "material-symbols-outlined text-base group-hover/store:translate-x-1 transition-transform",
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
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "div",
                          classes:
                              "p-8 rounded-2xl bg-surface-container border border-outline-variant/30 hover:border-secondary/40 transition-all duration-300 flex flex-col justify-between group",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes: "space-y-4",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "div",
                                  classes:
                                      "aspect-video rounded-xl bg-surface-container-low border border-outline-variant/30 overflow-hidden group-hover:border-secondary/40 transition-colors",
                                  children: [
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "img",
                                      classes: "block w-full h-full object-cover",
                                      attributes: {
                                        "src": "assets/images/drisavo/cover.png",
                                        "alt": "Drisavo driving school booking platform",
                                        "loading": "lazy",
                                      },
                                    ),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "div",
                                  classes:
                                      "font-label-mono-xs text-label-mono-xs text-secondary uppercase tracking-wider pt-2",
                                  children: [
                                    Component.text(" Driving School Booking Platform • Canadian Market "),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "h3",
                                  classes:
                                      "font-headline-md text-headline-md text-on-surface font-semibold group-hover:text-secondary transition-colors",
                                  children: [
                                    Component.text(" Drisavo - Driving School Booking Platform "),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "p",
                                  classes: "font-body-md text-body-md text-on-surface-variant leading-relaxed",
                                  children: [
                                    Component.text(" Driving lesson booking platform for the Canadian market. "),
                                  ],
                                ),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes: "pt-6 flex flex-wrap gap-2",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes:
                                      "px-2.5 py-1 rounded bg-surface-container-high text-on-surface-variant font-label-mono-xs text-label-mono-xs border border-outline-variant/20",
                                  children: [
                                    Component.text("Android/iOS"),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes:
                                      "px-2.5 py-1 rounded bg-surface-container-high text-on-surface-variant font-label-mono-xs text-label-mono-xs border border-outline-variant/20",
                                  children: [
                                    Component.text("Chat"),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes:
                                      "px-2.5 py-1 rounded bg-surface-container-high text-on-surface-variant font-label-mono-xs text-label-mono-xs border border-outline-variant/20",
                                  children: [
                                    Component.text("Payment"),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes:
                                      "px-2.5 py-1 rounded bg-surface-container-high text-on-surface-variant font-label-mono-xs text-label-mono-xs border border-outline-variant/20",
                                  children: [
                                    Component.text("Map Tracking"),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "div",
                                  classes: "basis-full flex flex-wrap items-center gap-3 pt-2",
                                  children: [
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "a",
                                      classes:
                                          "w-fit flex-none inline-flex items-center gap-2 px-5 py-2.5 rounded-lg bg-primary-container text-on-primary-container font-body-md text-body-md font-semibold hover:bg-primary transition-all shadow-[0_0_18px_rgba(77,142,255,0.25)] group/android",
                                      attributes: {
                                        "href": "https://play.google.com/store/apps/details?id=com.mkhalid.drisavo",
                                        "target": "_blank",
                                        "rel": "noopener noreferrer",
                                        "aria-label": "Download Drisavo for Android from Google Play",
                                      },
                                      children: [
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "span",
                                          classes: "material-symbols-outlined text-lg",
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
                                              "material-symbols-outlined text-base group-hover/android:translate-x-1 transition-transform",
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
                                          "w-fit flex-none inline-flex items-center gap-2 px-5 py-2.5 rounded-lg bg-surface-container-high text-on-surface font-body-md text-body-md font-semibold border border-outline-variant/40 hover:border-secondary/60 hover:text-secondary transition-all group/store",
                                      attributes: {
                                        "href": "https://apps.apple.com/us/app/drisavo/id6759968663",
                                        "target": "_blank",
                                        "rel": "noopener noreferrer",
                                        "aria-label": "Download Drisavo from the App Store",
                                      },
                                      children: [
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "svg",
                                          classes: "w-5 h-5 fill-current",
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
                                              "material-symbols-outlined text-base group-hover/store:translate-x-1 transition-transform",
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
                  ],
                ),
              ],
            ),
            // ignore: prefer_html_components
            Component.element(
              tag: "section",
              classes: "w-full bg-surface py-20 lg:py-28 relative",
              children: [
                // ignore: prefer_html_components
                Component.element(
                  tag: "div",
                  classes: "max-w-7xl mx-auto px-6 sm:px-8",
                  children: [
                    // ignore: prefer_html_components
                    Component.element(
                      tag: "div",
                      classes: "max-w-3xl mb-16 space-y-4",
                      children: [
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "div",
                          classes:
                              "inline-flex items-center gap-2 font-label-mono text-label-mono uppercase tracking-wider text-secondary",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "span",
                              classes: "h-1.5 w-1.5 rounded-full bg-secondary",
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "span",
                              children: [
                                Component.text("WHY BROTHERS-TECH"),
                              ],
                            ),
                          ],
                        ),
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "h2",
                          classes:
                              "font-headline-lg text-headline-lg lg:text-[44px] lg:leading-[52px] text-on-surface font-semibold tracking-tight",
                          children: [
                            Component.text(" More Than Code. We Build Products. "),
                          ],
                        ),
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "p",
                          classes: "font-body-lg text-body-lg text-on-surface-variant leading-relaxed",
                          children: [
                            Component.text(
                              " We combine engineering rigour with genuine product strategy so your digital systems run flawlessly under pressure and drive bottom-line velocity. ",
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
                              "p-7 rounded-2xl bg-surface-container border border-outline-variant/30 hover:border-primary/40 transition-all duration-300 space-y-4",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes:
                                  "w-12 h-12 rounded-xl bg-primary/10 border border-primary/20 flex items-center justify-center text-primary",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes: "material-symbols-outlined text-2xl",
                                  children: [
                                    Component.text("verified_user"),
                                  ],
                                ),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "h3",
                              classes: "font-headline-sm text-headline-sm text-on-surface font-semibold",
                              children: [
                                Component.text(" Built for Real-World Use "),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "p",
                              classes: "font-body-sm text-body-sm text-on-surface-variant leading-relaxed",
                              children: [
                                Component.text(
                                  " Software designed around actual user behaviors, unforgiving real conditions, and measurable business requirements. ",
                                ),
                              ],
                            ),
                          ],
                        ),
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "div",
                          classes:
                              "p-7 rounded-2xl bg-surface-container border border-outline-variant/30 hover:border-secondary/40 transition-all duration-300 space-y-4",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes:
                                  "w-12 h-12 rounded-xl bg-secondary/10 border border-secondary/20 flex items-center justify-center text-secondary",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes: "material-symbols-outlined text-2xl",
                                  children: [
                                    Component.text("hub"),
                                  ],
                                ),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "h3",
                              classes: "font-headline-sm text-headline-sm text-on-surface font-semibold",
                              children: [
                                Component.text(" One Team, Multi-Platform "),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "p",
                              classes: "font-body-sm text-body-sm text-on-surface-variant leading-relaxed",
                              children: [
                                Component.text(
                                  " Mobile, web, and desktop products planned and delivered seamlessly by one coordinated team. ",
                                ),
                              ],
                            ),
                          ],
                        ),
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "div",
                          classes:
                              "p-7 rounded-2xl bg-surface-container border border-outline-variant/30 hover:border-primary/40 transition-all duration-300 space-y-4",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes:
                                  "w-12 h-12 rounded-xl bg-primary/10 border border-primary/20 flex items-center justify-center text-primary",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes: "material-symbols-outlined text-2xl",
                                  children: [
                                    Component.text("layers"),
                                  ],
                                ),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "h3",
                              classes: "font-headline-sm text-headline-sm text-on-surface font-semibold",
                              children: [
                                Component.text(" Scalable Architecture "),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "p",
                              classes: "font-body-sm text-body-sm text-on-surface-variant leading-relaxed",
                              children: [
                                Component.text(
                                  " Clean code modularity and database schemas engineered to scale from initial prototype to millions of monthly active users. ",
                                ),
                              ],
                            ),
                          ],
                        ),
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "div",
                          classes:
                              "p-7 rounded-2xl bg-surface-container border border-outline-variant/30 hover:border-secondary/40 transition-all duration-300 space-y-4",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes:
                                  "w-12 h-12 rounded-xl bg-secondary/10 border border-secondary/20 flex items-center justify-center text-secondary",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes: "material-symbols-outlined text-2xl",
                                  children: [
                                    Component.text("rocket_launch"),
                                  ],
                                ),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "h3",
                              classes: "font-headline-sm text-headline-sm text-on-surface font-semibold",
                              children: [
                                Component.text(" From Idea to Release "),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "p",
                              classes: "font-body-sm text-body-sm text-on-surface-variant leading-relaxed",
                              children: [
                                Component.text(
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
            // ignore: prefer_html_components
            Component.element(
              tag: "section",
              classes: "w-full bg-surface-container-low py-20 lg:py-28 relative border-y border-outline-variant/20",
              children: [
                // ignore: prefer_html_components
                Component.element(
                  tag: "div",
                  classes: "max-w-7xl mx-auto px-6 sm:px-8",
                  children: [
                    // ignore: prefer_html_components
                    Component.element(
                      tag: "div",
                      classes: "max-w-3xl mb-16 space-y-4",
                      children: [
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "div",
                          classes:
                              "inline-flex items-center gap-2 font-label-mono text-label-mono uppercase tracking-wider text-secondary",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "span",
                              classes: "h-1.5 w-1.5 rounded-full bg-secondary",
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "span",
                              children: [
                                Component.text("HOW WE WORK"),
                              ],
                            ),
                          ],
                        ),
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "h2",
                          classes:
                              "font-headline-lg text-headline-lg lg:text-[44px] lg:leading-[52px] text-on-surface font-semibold tracking-tight",
                          children: [
                            Component.text(" From Idea to Launch. "),
                          ],
                        ),
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "p",
                          classes: "font-body-lg text-body-lg text-on-surface-variant",
                          children: [
                            Component.text(
                              " A disciplined five-stage development pipeline designed to eliminate rework, ensure transparent execution, and protect delivery milestones. ",
                            ),
                          ],
                        ),
                      ],
                    ),
                    // ignore: prefer_html_components
                    Component.element(
                      tag: "div",
                      classes: "relative grid grid-cols-1 md:grid-cols-5 gap-6",
                      children: [
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "div",
                          classes:
                              "hidden md:block absolute top-10 left-12 right-12 h-0.5 bg-gradient-to-r from-primary via-secondary to-primary-container z-0 opacity-40",
                        ),
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "div",
                          classes:
                              "relative z-10 p-6 rounded-2xl bg-surface-container border border-outline-variant/30 flex flex-col space-y-3 group hover:border-primary/40 transition-colors",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes:
                                  "w-10 h-10 rounded-full bg-surface-container-high border-2 border-primary flex items-center justify-center text-primary font-label-mono font-bold text-sm shadow-[0_0_12px_rgba(173,198,255,0.4)]",
                              children: [
                                Component.text(" 01 "),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes: "font-label-mono text-label-mono text-secondary uppercase font-semibold",
                              children: [
                                Component.text(" DISCOVER "),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "h4",
                              classes: "font-headline-sm text-body-md font-semibold text-on-surface",
                              children: [
                                Component.text(" Define & Align "),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "p",
                              classes: "font-body-sm text-body-sm text-on-surface-variant leading-relaxed",
                              children: [
                                Component.text(
                                  " Understand the business, users, technical requirements, edge cases, and core conversion goals. ",
                                ),
                              ],
                            ),
                          ],
                        ),
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "div",
                          classes:
                              "relative z-10 p-6 rounded-2xl bg-surface-container border border-outline-variant/30 flex flex-col space-y-3 group hover:border-secondary/40 transition-colors",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes:
                                  "w-10 h-10 rounded-full bg-surface-container-high border-2 border-secondary flex items-center justify-center text-secondary font-label-mono font-bold text-sm shadow-[0_0_12px_rgba(76,215,246,0.4)]",
                              children: [
                                Component.text(" 02 "),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes: "font-label-mono text-label-mono text-secondary uppercase font-semibold",
                              children: [
                                Component.text(" DESIGN "),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "h4",
                              classes: "font-headline-sm text-body-md font-semibold text-on-surface",
                              children: [
                                Component.text(" Plan & Prototype "),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "p",
                              classes: "font-body-sm text-body-sm text-on-surface-variant leading-relaxed",
                              children: [
                                Component.text(
                                  " Wireframe user flows, design interactive UI systems, and validate high-fidelity prototypes. ",
                                ),
                              ],
                            ),
                          ],
                        ),
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "div",
                          classes:
                              "relative z-10 p-6 rounded-2xl bg-surface-container border border-outline-variant/30 flex flex-col space-y-3 group hover:border-primary/40 transition-colors",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes:
                                  "w-10 h-10 rounded-full bg-surface-container-high border-2 border-primary flex items-center justify-center text-primary font-label-mono font-bold text-sm shadow-[0_0_12px_rgba(173,198,255,0.4)]",
                              children: [
                                Component.text(" 03 "),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes: "font-label-mono text-label-mono text-secondary uppercase font-semibold",
                              children: [
                                Component.text(" DEVELOP "),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "h4",
                              classes: "font-headline-sm text-body-md font-semibold text-on-surface",
                              children: [
                                Component.text(" Engineered Code "),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "p",
                              classes: "font-body-sm text-body-sm text-on-surface-variant leading-relaxed",
                              children: [
                                Component.text(
                                  " Transform approved specifications into reliable software with clean architectures and CI/CD. ",
                                ),
                              ],
                            ),
                          ],
                        ),
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "div",
                          classes:
                              "relative z-10 p-6 rounded-2xl bg-surface-container border border-outline-variant/30 flex flex-col space-y-3 group hover:border-secondary/40 transition-colors",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes:
                                  "w-10 h-10 rounded-full bg-surface-container-high border-2 border-secondary flex items-center justify-center text-secondary font-label-mono font-bold text-sm shadow-[0_0_12px_rgba(76,215,246,0.4)]",
                              children: [
                                Component.text(" 04 "),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes: "font-label-mono text-label-mono text-secondary uppercase font-semibold",
                              children: [
                                Component.text(" TEST "),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "h4",
                              classes: "font-headline-sm text-body-md font-semibold text-on-surface",
                              children: [
                                Component.text(" Rigorous QA "),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "p",
                              classes: "font-body-sm text-body-sm text-on-surface-variant leading-relaxed",
                              children: [
                                Component.text(
                                  " Verify automated test suites, end-to-end integration, performance under load, and system stability. ",
                                ),
                              ],
                            ),
                          ],
                        ),
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "div",
                          classes:
                              "relative z-10 p-6 rounded-2xl bg-surface-container border border-outline-variant/30 flex flex-col space-y-3 group hover:border-primary/40 transition-colors",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes:
                                  "w-10 h-10 rounded-full bg-surface-container-high border-2 border-primary-container flex items-center justify-center text-primary-fixed font-label-mono font-bold text-sm shadow-[0_0_12px_rgba(77,142,255,0.4)]",
                              children: [
                                Component.text(" 05 "),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes: "font-label-mono text-label-mono text-secondary uppercase font-semibold",
                              children: [
                                Component.text(" LAUNCH "),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "h4",
                              classes: "font-headline-sm text-body-md font-semibold text-on-surface",
                              children: [
                                Component.text(" Deploy & Scale "),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "p",
                              classes: "font-body-sm text-body-sm text-on-surface-variant leading-relaxed",
                              children: [
                                Component.text(
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
            // ignore: prefer_html_components
            Component.element(
              tag: "section",
              classes: "w-full bg-surface py-20 lg:py-28 relative overflow-hidden",
              children: [
                // ignore: prefer_html_components
                Component.element(
                  tag: "div",
                  classes: "max-w-7xl mx-auto px-6 sm:px-8",
                  children: [
                    // ignore: prefer_html_components
                    Component.element(
                      tag: "div",
                      classes:
                          "relative rounded-3xl bg-surface-container-high/90 border border-outline-variant/50 p-10 sm:p-14 lg:p-16 overflow-hidden shadow-2xl",
                      children: [
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "div",
                          classes:
                              "absolute -top-32 -right-32 w-96 h-96 bg-primary/20 rounded-full blur-3xl pointer-events-none",
                        ),
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "div",
                          classes:
                              "absolute -bottom-32 -left-32 w-96 h-96 bg-secondary/15 rounded-full blur-3xl pointer-events-none",
                        ),
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "div",
                          classes: "relative z-10 max-w-3xl space-y-6",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes:
                                  "inline-flex items-center gap-2 px-3 py-1 rounded-full bg-surface-container-lowest border border-outline-variant/30 text-secondary",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes: "w-2 h-2 rounded-full bg-secondary",
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes: "font-label-mono text-label-mono uppercase tracking-wider font-semibold",
                                  children: [
                                    Component.text("GET IN TOUCH"),
                                  ],
                                ),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "h2",
                              classes:
                                  "font-headline-lg text-headline-lg lg:text-[44px] lg:leading-[52px] text-on-surface font-semibold tracking-tight",
                              children: [
                                Component.text(" Have an Idea? Let’s Build It Together. "),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "p",
                              classes: "font-body-lg text-body-lg text-on-surface-variant leading-relaxed",
                              children: [
                                Component.text(
                                  " Whether you’re starting something new or improving an existing product, let’s turn your idea into reliable, production-ready software. ",
                                ),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes: "pt-4 flex flex-wrap items-center gap-4",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "a",
                                  classes:
                                      "inline-flex items-center justify-center h-12 px-8 rounded-lg bg-primary-container text-on-primary-container font-body-md text-body-md font-semibold hover:bg-primary transition-all duration-200 shadow-[inset_0_1px_0_rgba(255,255,255,0.25),0_0_24px_rgba(77,142,255,0.4)] group",
                                  attributes: {
                                    "data-path": "contact",
                                    "href": "/contact",
                                  },
                                  children: [
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "span",
                                      children: [
                                        Component.text("Tell Us About Your Project"),
                                      ],
                                    ),
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "span",
                                      classes:
                                          "material-symbols-outlined ml-2 text-base group-hover:translate-x-1 transition-transform",
                                      children: [
                                        Component.text("arrow_forward"),
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
  ]);
}

const servicesBodyClasses = "bg-surface font-body-md text-on-surface antialiased";

Component buildServicesPage() {
  return Component.fragment([
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
                  classes: "px-4 py-2 transition-colors bg-surface-container-high text-primary font-medium rounded-lg",
                  attributes: {
                    "aria-current": "page",
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
      classes: "w-full pt-20 bg-surface min-h-[calc(100vh-20rem)]",
      children: [
        // ignore: prefer_html_components
        Component.element(
          tag: "div",
          classes: "flex flex-col w-full",
          children: [
            // ignore: prefer_html_components
            Component.element(
              tag: "section",
              classes: "relative w-full overflow-hidden px-6 lg:px-12 py-16 lg:py-24",
              children: [
                // ignore: prefer_html_components
                Component.element(
                  tag: "div",
                  classes:
                      "absolute -top-32 left-1/2 -translate-x-1/2 w-[720px] h-[360px] bg-gradient-to-b from-primary/15 via-secondary/5 to-transparent blur-3xl pointer-events-none -z-10",
                ),
                // ignore: prefer_html_components
                Component.element(
                  tag: "div",
                  classes: "max-w-6xl mx-auto flex flex-col items-center text-center",
                  children: [
                    // ignore: prefer_html_components
                    Component.element(
                      tag: "div",
                      classes:
                          "inline-flex items-center gap-space-sm px-3.5 py-1 rounded-full bg-surface-container-high shadow-sm mb-space-lg",
                      children: [
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "span",
                          classes: "relative flex h-2 w-2",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "span",
                              classes:
                                  "animate-ping absolute inline-flex h-full w-full rounded-full bg-secondary opacity-75",
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "span",
                              classes: "relative inline-flex rounded-full h-2 w-2 bg-secondary",
                            ),
                          ],
                        ),
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "span",
                          classes:
                              "font-label-mono text-label-mono uppercase tracking-widest text-secondary font-medium",
                          children: [
                            Component.text("Our Services"),
                          ],
                        ),
                      ],
                    ),
                    // ignore: prefer_html_components
                    Component.element(
                      tag: "h1",
                      classes:
                          "font-display-hero text-display-hero tracking-tight text-on-surface max-w-4xl mb-space-md",
                      children: [
                        Component.text(" From Idea to "),
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "span",
                          classes:
                              "text-transparent bg-clip-text bg-gradient-to-r from-primary via-secondary to-secondary-fixed",
                          children: [
                            Component.text("Working Software."),
                          ],
                        ),
                      ],
                    ),
                    // ignore: prefer_html_components
                    Component.element(
                      tag: "p",
                      classes:
                          "font-body-lg text-body-lg text-on-surface-variant max-w-2xl leading-relaxed mb-space-xl",
                      children: [
                        Component.text(
                          " Brothers-Tech designs and develops mobile, web, desktop, and connected software solutions built around real business needs. ",
                        ),
                      ],
                    ),
                    // ignore: prefer_html_components
                    Component.element(
                      tag: "div",
                      classes: "w-full max-w-4xl p-1 rounded-xl bg-surface-container-low shadow-md",
                      children: [
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "div",
                          classes:
                              "px-6 py-3 rounded-lg bg-surface-container flex flex-wrap items-center justify-between gap-y-3 gap-x-6 text-on-surface-variant font-label-mono text-label-mono",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes: "flex items-center gap-space-xs",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes: "w-1.5 h-1.5 rounded-full bg-secondary",
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes: "text-on-surface",
                                  children: [
                                    Component.text("5 Core Practices"),
                                  ],
                                ),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "span",
                              classes: "hidden sm:inline text-outline-variant font-mono",
                              children: [
                                Component.text("•"),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes: "flex items-center gap-space-xs",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes: "w-1.5 h-1.5 rounded-full bg-secondary",
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes: "text-on-surface",
                                  children: [
                                    Component.text("Multi-Platform Architecture"),
                                  ],
                                ),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "span",
                              classes: "hidden sm:inline text-outline-variant font-mono",
                              children: [
                                Component.text("•"),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes: "flex items-center gap-space-xs",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes: "w-1.5 h-1.5 rounded-full bg-secondary",
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes: "text-on-surface",
                                  children: [
                                    Component.text("Production Grade Systems"),
                                  ],
                                ),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "span",
                              classes: "hidden sm:inline text-outline-variant font-mono",
                              children: [
                                Component.text("•"),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes: "flex items-center gap-space-xs",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes: "w-1.5 h-1.5 rounded-full bg-secondary",
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes: "text-on-surface",
                                  children: [
                                    Component.text("Zero Vendor Lock-in"),
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
              classes: "w-full px-6 lg:px-12 py-12 flex flex-col gap-24 lg:gap-32 max-w-7xl mx-auto",
              children: [
                // ignore: prefer_html_components
                Component.element(
                  tag: "div",
                  classes: "grid grid-cols-1 lg:grid-cols-12 gap-12 lg:gap-16 items-center",
                  children: [
                    // ignore: prefer_html_components
                    Component.element(
                      tag: "div",
                      classes: "lg:col-span-6 flex flex-col items-start",
                      children: [
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "div",
                          classes:
                              "inline-flex items-center px-3 py-1 rounded-md bg-surface-container-high text-secondary font-label-mono-xs text-label-mono-xs uppercase tracking-wider mb-space-md",
                          children: [
                            Component.text(" 01 • Mobile Applications "),
                          ],
                        ),
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "h2",
                          classes:
                              "font-headline-lg text-headline-lg text-on-surface tracking-tight leading-tight mb-space-md",
                          children: [
                            Component.text(" Mobile Applications "),
                          ],
                        ),
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "p",
                          classes: "font-body-lg text-body-lg text-on-surface-variant leading-relaxed mb-space-lg",
                          children: [
                            Component.text(
                              " Reliable Android and iOS applications designed around your users and business goals. We handle the full journey from planning and design to store release and ongoing improvements. ",
                            ),
                          ],
                        ),
                      ],
                    ),
                    // ignore: prefer_html_components
                    Component.element(
                      tag: "div",
                      classes: "lg:col-span-6 relative w-full flex items-center justify-center",
                      children: [
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "img",
                          classes: "block w-full max-w-lg h-auto rounded-2xl shadow-2xl",
                          attributes: {
                            "src": "assets/images/all_products.png",
                            "alt": "Brothers-Tech mobile application portfolio",
                            "loading": "lazy",
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                // ignore: prefer_html_components
                Component.element(
                  tag: "div",
                  classes: "grid grid-cols-1 lg:grid-cols-12 gap-12 lg:gap-16 items-center",
                  children: [
                    // ignore: prefer_html_components
                    Component.element(
                      tag: "div",
                      classes: "order-2 lg:order-1 lg:col-span-6 relative w-full flex items-center justify-center",
                      children: [
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "img",
                          classes: "block w-full max-w-lg h-auto rounded-2xl shadow-2xl",
                          attributes: {
                            "src": "assets/images/drisavo/drisavo-website.png",
                            "alt": "Drisavo web booking platform",
                            "loading": "lazy",
                          },
                        ),
                      ],
                    ),
                    // ignore: prefer_html_components
                    Component.element(
                      tag: "div",
                      classes: "order-1 lg:order-2 lg:col-span-6 flex flex-col items-start",
                      children: [
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "div",
                          classes:
                              "inline-flex items-center px-3 py-1 rounded-md bg-surface-container-high text-secondary font-label-mono-xs text-label-mono-xs uppercase tracking-wider mb-space-md",
                          children: [
                            Component.text(" 02 • Web Platforms "),
                          ],
                        ),
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "h2",
                          classes:
                              "font-headline-lg text-headline-lg text-on-surface tracking-tight leading-tight mb-space-md",
                          children: [
                            Component.text(" Web Platforms, Applications & High-Density Dashboards "),
                          ],
                        ),
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "p",
                          classes: "font-body-lg text-body-lg text-on-surface-variant leading-relaxed mb-space-lg",
                          children: [
                            Component.text(
                              " Professional websites, customer portals, booking systems, dashboards, and business tools designed to be fast, accessible, easy to use, and ready to grow with your business. ",
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
                  classes: "grid grid-cols-1 lg:grid-cols-12 gap-12 lg:gap-16 items-center",
                  children: [
                    // ignore: prefer_html_components
                    Component.element(
                      tag: "div",
                      classes: "lg:col-span-6 flex flex-col items-start",
                      children: [
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "div",
                          classes:
                              "inline-flex items-center px-3 py-1 rounded-md bg-surface-container-high text-secondary font-label-mono-xs text-label-mono-xs uppercase tracking-wider mb-space-md",
                          children: [
                            Component.text(" 03 • Desktop Applications "),
                          ],
                        ),
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "h2",
                          classes:
                              "font-headline-lg text-headline-lg text-on-surface tracking-tight leading-tight mb-space-md",
                          children: [
                            Component.text(" Desktop Software & Operations Workstations "),
                          ],
                        ),
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "p",
                          classes: "font-body-lg text-body-lg text-on-surface-variant leading-relaxed mb-space-lg",
                          children: [
                            Component.text(
                              " Reliable desktop software designed to simplify daily operations, organize complex workflows, manage important data, and help teams work efficiently—even when an internet connection is unavailable. ",
                            ),
                          ],
                        ),
                      ],
                    ),
                    // ignore: prefer_html_components
                    Component.element(
                      tag: "div",
                      classes: "lg:col-span-6 relative w-full flex items-center justify-center",
                      children: [
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "img",
                          classes: "block w-full max-w-lg h-auto rounded-2xl shadow-2xl",
                          attributes: {
                            "src": "assets/images/desktop-apps.png",
                            "alt": "Brothers-Tech desktop software portfolio",
                            "loading": "lazy",
                          },
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
              classes: "w-full px-6 lg:px-12 py-20 max-w-7xl mx-auto",
              children: [
                // ignore: prefer_html_components
                Component.element(
                  tag: "div",
                  classes: "flex flex-col md:flex-row md:items-end justify-between mb-16 gap-6",
                  children: [
                    // ignore: prefer_html_components
                    Component.element(
                      tag: "div",
                      children: [
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "div",
                          classes:
                              "inline-flex items-center px-3 py-1 rounded-md bg-surface-container-high text-secondary font-label-mono-xs text-label-mono-xs uppercase tracking-wider mb-space-sm",
                          children: [
                            Component.text(" Engineering Delivery Framework "),
                          ],
                        ),
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "h2",
                          classes: "font-headline-lg text-headline-lg text-on-surface tracking-tight",
                          children: [
                            Component.text(" How We Build. "),
                          ],
                        ),
                      ],
                    ),
                    // ignore: prefer_html_components
                    Component.element(
                      tag: "p",
                      classes: "font-body-lg text-body-lg text-on-surface-variant max-w-md",
                      children: [
                        Component.text(
                          " A disciplined, transparent delivery framework from initial whiteboard to continuous production support. ",
                        ),
                      ],
                    ),
                  ],
                ),
                // ignore: prefer_html_components
                Component.element(
                  tag: "div",
                  classes: "grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6",
                  children: [
                    // ignore: prefer_html_components
                    Component.element(
                      tag: "div",
                      classes:
                          "p-6 rounded-2xl bg-surface-container shadow-md hover:bg-surface-container-high transition-colors flex flex-col justify-between h-full",
                      children: [
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "div",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes: "flex items-center justify-between mb-4",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes: "font-label-mono text-label-mono text-secondary font-bold",
                                  children: [
                                    Component.text("01 // DISCOVERY"),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes: "material-symbols-outlined text-on-surface-variant text-[20px]",
                                  children: [
                                    Component.text("architecture"),
                                  ],
                                ),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "h3",
                              classes: "font-headline-sm text-headline-sm text-on-surface font-semibold mb-2",
                              children: [
                                Component.text(" Plan "),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "p",
                              classes: "font-body-md text-body-md text-on-surface-variant leading-relaxed",
                              children: [
                                Component.text(
                                  " Requirements discovery, technical architecture blueprint, database schema planning, API specs, and a milestone-driven roadmap. ",
                                ),
                              ],
                            ),
                          ],
                        ),
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "div",
                          classes: "pt-6 font-label-mono-xs text-label-mono-xs text-secondary flex items-center gap-1",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "span",
                              children: [
                                Component.text("Deliverable: Technical RFC & Spec"),
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
                          "p-6 rounded-2xl bg-surface-container shadow-md hover:bg-surface-container-high transition-colors flex flex-col justify-between h-full",
                      children: [
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "div",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes: "flex items-center justify-between mb-4",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes: "font-label-mono text-label-mono text-secondary font-bold",
                                  children: [
                                    Component.text("02 // PROTOTYPING"),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes: "material-symbols-outlined text-on-surface-variant text-[20px]",
                                  children: [
                                    Component.text("palette"),
                                  ],
                                ),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "h3",
                              classes: "font-headline-sm text-headline-sm text-on-surface font-semibold mb-2",
                              children: [
                                Component.text(" Design "),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "p",
                              classes: "font-body-md text-body-md text-on-surface-variant leading-relaxed",
                              children: [
                                Component.text(
                                  " User journey mapping, wireframing, high-fidelity UI design, tokenized design systems, and interactive clickable prototypes in Figma. ",
                                ),
                              ],
                            ),
                          ],
                        ),
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "div",
                          classes: "pt-6 font-label-mono-xs text-label-mono-xs text-secondary flex items-center gap-1",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "span",
                              children: [
                                Component.text("Deliverable: Design Tokens & Prototypes"),
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
                          "p-6 rounded-2xl bg-surface-container shadow-md hover:bg-surface-container-high transition-colors flex flex-col justify-between h-full",
                      children: [
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "div",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes: "flex items-center justify-between mb-4",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes: "font-label-mono text-label-mono text-secondary font-bold",
                                  children: [
                                    Component.text("03 // EXECUTION"),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes: "material-symbols-outlined text-on-surface-variant text-[20px]",
                                  children: [
                                    Component.text("terminal"),
                                  ],
                                ),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "h3",
                              classes: "font-headline-sm text-headline-sm text-on-surface font-semibold mb-2",
                              children: [
                                Component.text(" Develop "),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "p",
                              classes: "font-body-md text-body-md text-on-surface-variant leading-relaxed",
                              children: [
                                Component.text(
                                  " Full-stack engineering, strict static typing, clean modular architectural patterns, local unit tests, and continuous pull-request reviews. ",
                                ),
                              ],
                            ),
                          ],
                        ),
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "div",
                          classes: "pt-6 font-label-mono-xs text-label-mono-xs text-secondary flex items-center gap-1",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "span",
                              children: [
                                Component.text("Deliverable: Staging Deployment Builds"),
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
                          "p-6 rounded-2xl bg-surface-container shadow-md hover:bg-surface-container-high transition-colors flex flex-col justify-between h-full",
                      children: [
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "div",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes: "flex items-center justify-between mb-4",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes: "font-label-mono text-label-mono text-secondary font-bold",
                                  children: [
                                    Component.text("04 // VERIFICATION"),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes: "material-symbols-outlined text-on-surface-variant text-[20px]",
                                  children: [
                                    Component.text("checklist"),
                                  ],
                                ),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "h3",
                              classes: "font-headline-sm text-headline-sm text-on-surface font-semibold mb-2",
                              children: [
                                Component.text(" Test "),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "p",
                              classes: "font-body-md text-body-md text-on-surface-variant leading-relaxed",
                              children: [
                                Component.text(
                                  " Automated regression suites, cross-browser/device testing, penetration audits, load testing, and edge case resilience verification. ",
                                ),
                              ],
                            ),
                          ],
                        ),
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "div",
                          classes: "pt-6 font-label-mono-xs text-label-mono-xs text-secondary flex items-center gap-1",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "span",
                              children: [
                                Component.text("Deliverable: QA & Security Audit Report"),
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
                          "p-6 rounded-2xl bg-surface-container shadow-md hover:bg-surface-container-high transition-colors flex flex-col justify-between h-full",
                      children: [
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "div",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes: "flex items-center justify-between mb-4",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes: "font-label-mono text-label-mono text-secondary font-bold",
                                  children: [
                                    Component.text("05 // ROLLOUT"),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes: "material-symbols-outlined text-on-surface-variant text-[20px]",
                                  children: [
                                    Component.text("rocket_launch"),
                                  ],
                                ),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "h3",
                              classes: "font-headline-sm text-headline-sm text-on-surface font-semibold mb-2",
                              children: [
                                Component.text(" Deploy "),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "p",
                              classes: "font-body-md text-body-md text-on-surface-variant leading-relaxed",
                              children: [
                                Component.text(
                                  " Automated CI/CD orchestration, zero-downtime containerized infrastructure, DNS provisioning, and App Store / Google Play submissions. ",
                                ),
                              ],
                            ),
                          ],
                        ),
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "div",
                          classes: "pt-6 font-label-mono-xs text-label-mono-xs text-secondary flex items-center gap-1",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "span",
                              children: [
                                Component.text("Deliverable: Production Release Verified"),
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
                          "p-6 rounded-2xl bg-surface-container shadow-md hover:bg-surface-container-high transition-colors flex flex-col justify-between h-full",
                      children: [
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "div",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes: "flex items-center justify-between mb-4",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes: "font-label-mono text-label-mono text-secondary font-bold",
                                  children: [
                                    Component.text("06 // MAINTENANCE"),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes: "material-symbols-outlined text-on-surface-variant text-[20px]",
                                  children: [
                                    Component.text("health_and_safety"),
                                  ],
                                ),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "h3",
                              classes: "font-headline-sm text-headline-sm text-on-surface font-semibold mb-2",
                              children: [
                                Component.text(" Support "),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "p",
                              classes: "font-body-md text-body-md text-on-surface-variant leading-relaxed",
                              children: [
                                Component.text(
                                  " Continuous real-time telemetry monitoring, error tracking, infrastructure maintenance, security patching, and ongoing feature iteration. ",
                                ),
                              ],
                            ),
                          ],
                        ),
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "div",
                          classes: "pt-6 font-label-mono-xs text-label-mono-xs text-secondary flex items-center gap-1",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "span",
                              children: [
                                Component.text("Deliverable: 24/7 SLA & Telemetry Logs"),
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
              classes: "w-full px-6 lg:px-12 py-20 bg-surface-container-lowest",
              children: [
                // ignore: prefer_html_components
                Component.element(
                  tag: "div",
                  classes: "max-w-7xl mx-auto flex flex-col items-center",
                  children: [
                    // ignore: prefer_html_components
                    Component.element(
                      tag: "div",
                      classes: "text-center max-w-3xl mb-16",
                      children: [
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "div",
                          classes:
                              "inline-flex items-center px-3.5 py-1 rounded-full bg-surface-container text-secondary font-label-mono-xs text-label-mono-xs uppercase tracking-widest font-semibold mb-space-sm",
                          children: [
                            Component.text(" Product Taxonomy "),
                          ],
                        ),
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "h2",
                          classes:
                              "font-headline-lg text-headline-lg text-on-surface tracking-tight leading-tight mb-space-sm",
                          children: [
                            Component.text(" Software Solutions Tailored to Your Industry. "),
                          ],
                        ),
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "p",
                          classes: "font-body-lg text-body-lg text-on-surface-variant leading-relaxed",
                          children: [
                            Component.text(
                              " From complex enterprise workflow tools to customer-facing platforms, we engineer purpose-built systems. ",
                            ),
                          ],
                        ),
                      ],
                    ),
                    // ignore: prefer_html_components
                    Component.element(
                      tag: "div",
                      classes: "grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6 w-full",
                      children: [
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "div",
                          classes:
                              "p-6 rounded-2xl bg-surface-container flex flex-col justify-between shadow-sm hover:bg-surface-container-high transition-colors",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "div",
                                  classes:
                                      "w-10 h-10 rounded-lg bg-surface-container-highest flex items-center justify-center mb-4",
                                  children: [
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "span",
                                      classes: "material-symbols-outlined text-secondary text-[22px]",
                                      children: [
                                        Component.text("corporate_fare"),
                                      ],
                                    ),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "h3",
                                  classes: "font-headline-sm text-headline-sm text-on-surface font-semibold mb-2",
                                  children: [
                                    Component.text(" Business Applications "),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "p",
                                  classes: "font-body-md text-body-md text-on-surface-variant",
                                  children: [
                                    Component.text(
                                      " Internal operations tools, automated resource planning, and custom ERP systems engineered for high-concurrency business data. ",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes:
                                  "mt-4 pt-3 flex items-center gap-2 text-on-surface-variant font-label-mono-xs text-label-mono-xs",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes: "w-1.5 h-1.5 rounded-full bg-secondary",
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  children: [
                                    Component.text("Enterprise Ops • ERP"),
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
                              "p-6 rounded-2xl bg-surface-container flex flex-col justify-between shadow-sm hover:bg-surface-container-high transition-colors",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "div",
                                  classes:
                                      "w-10 h-10 rounded-lg bg-surface-container-highest flex items-center justify-center mb-4",
                                  children: [
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "span",
                                      classes: "material-symbols-outlined text-secondary text-[22px]",
                                      children: [
                                        Component.text("school"),
                                      ],
                                    ),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "h3",
                                  classes: "font-headline-sm text-headline-sm text-on-surface font-semibold mb-2",
                                  children: [
                                    Component.text(" Educational Platforms "),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "p",
                                  classes: "font-body-md text-body-md text-on-surface-variant",
                                  children: [
                                    Component.text(
                                      " Interactive Learning Management Systems (LMS), real-time virtual classroom software, student portals, and grading pipelines. ",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes:
                                  "mt-4 pt-3 flex items-center gap-2 text-on-surface-variant font-label-mono-xs text-label-mono-xs",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes: "w-1.5 h-1.5 rounded-full bg-secondary",
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  children: [
                                    Component.text("LMS • Interactive Portals"),
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
                              "p-6 rounded-2xl bg-surface-container flex flex-col justify-between shadow-sm hover:bg-surface-container-high transition-colors",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "div",
                                  classes:
                                      "w-10 h-10 rounded-lg bg-surface-container-highest flex items-center justify-center mb-4",
                                  children: [
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "span",
                                      classes: "material-symbols-outlined text-secondary text-[22px]",
                                      children: [
                                        Component.text("inventory_2"),
                                      ],
                                    ),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "h3",
                                  classes: "font-headline-sm text-headline-sm text-on-surface font-semibold mb-2",
                                  children: [
                                    Component.text(" Management Systems "),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "p",
                                  classes: "font-body-md text-body-md text-on-surface-variant",
                                  children: [
                                    Component.text(
                                      " High-accuracy inventory tracking, fleet dispatch management, supply-chain dashboards, and real-time asset control centers. ",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes:
                                  "mt-4 pt-3 flex items-center gap-2 text-on-surface-variant font-label-mono-xs text-label-mono-xs",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes: "w-1.5 h-1.5 rounded-full bg-secondary",
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  children: [
                                    Component.text("Fleet • Logistics • Supply"),
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
                              "p-6 rounded-2xl bg-surface-container flex flex-col justify-between shadow-sm hover:bg-surface-container-high transition-colors",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "div",
                                  classes:
                                      "w-10 h-10 rounded-lg bg-surface-container-highest flex items-center justify-center mb-4",
                                  children: [
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "span",
                                      classes: "material-symbols-outlined text-secondary text-[22px]",
                                      children: [
                                        Component.text("shopping_cart"),
                                      ],
                                    ),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "h3",
                                  classes: "font-headline-sm text-headline-sm text-on-surface font-semibold mb-2",
                                  children: [
                                    Component.text(" E-commerce Solutions "),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "p",
                                  classes: "font-body-md text-body-md text-on-surface-variant",
                                  children: [
                                    Component.text(
                                      " High-conversion checkout flows, custom multi-vendor marketplaces, dynamic catalog indexing, and low-latency inventory syncing. ",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes:
                                  "mt-4 pt-3 flex items-center gap-2 text-on-surface-variant font-label-mono-xs text-label-mono-xs",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes: "w-1.5 h-1.5 rounded-full bg-secondary",
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  children: [
                                    Component.text("Marketplaces • Checkout"),
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
                              "p-6 rounded-2xl bg-surface-container flex flex-col justify-between shadow-sm hover:bg-surface-container-high transition-colors",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "div",
                                  classes:
                                      "w-10 h-10 rounded-lg bg-surface-container-highest flex items-center justify-center mb-4",
                                  children: [
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "span",
                                      classes: "material-symbols-outlined text-secondary text-[22px]",
                                      children: [
                                        Component.text("monitoring"),
                                      ],
                                    ),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "h3",
                                  classes: "font-headline-sm text-headline-sm text-on-surface font-semibold mb-2",
                                  children: [
                                    Component.text(" Dashboards & Analytics "),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "p",
                                  classes: "font-body-md text-body-md text-on-surface-variant",
                                  children: [
                                    Component.text(
                                      " High-density telemetry dashboards, real-time streaming data visualizers, executive KPI portals, and custom report builders. ",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes:
                                  "mt-4 pt-3 flex items-center gap-2 text-on-surface-variant font-label-mono-xs text-label-mono-xs",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes: "w-1.5 h-1.5 rounded-full bg-secondary",
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  children: [
                                    Component.text("Telemetry • Real-Time KPIs"),
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
                              "p-6 rounded-2xl bg-surface-container flex flex-col justify-between shadow-sm hover:bg-surface-container-high transition-colors",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "div",
                                  classes:
                                      "w-10 h-10 rounded-lg bg-surface-container-highest flex items-center justify-center mb-4",
                                  children: [
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "span",
                                      classes: "material-symbols-outlined text-secondary text-[22px]",
                                      children: [
                                        Component.text("admin_panel_settings"),
                                      ],
                                    ),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "h3",
                                  classes: "font-headline-sm text-headline-sm text-on-surface font-semibold mb-2",
                                  children: [
                                    Component.text(" Admin Panels "),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "p",
                                  classes: "font-body-md text-body-md text-on-surface-variant",
                                  children: [
                                    Component.text(
                                      " Granular role-based access control portals, immutable audit logging, team administration consoles, and support tooling. ",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes:
                                  "mt-4 pt-3 flex items-center gap-2 text-on-surface-variant font-label-mono-xs text-label-mono-xs",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes: "w-1.5 h-1.5 rounded-full bg-secondary",
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  children: [
                                    Component.text("RBAC • Audit Logs • Tools"),
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
                              "p-6 rounded-2xl bg-surface-container flex flex-col justify-between shadow-sm hover:bg-surface-container-high transition-colors md:col-span-2 xl:col-span-2",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "div",
                                  classes: "w-10 h-10 rounded-lg bg-secondary/10 flex items-center justify-center mb-4",
                                  children: [
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "span",
                                      classes: "material-symbols-outlined text-secondary text-[22px]",
                                      children: [
                                        Component.text("extension"),
                                      ],
                                    ),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "h3",
                                  classes: "font-headline-sm text-headline-sm text-on-surface font-semibold mb-2",
                                  children: [
                                    Component.text(" Custom Software & Bespoke Engines "),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "p",
                                  classes: "font-body-md text-body-md text-on-surface-variant max-w-xl",
                                  children: [
                                    Component.text(
                                      " Specialized proprietary algorithms, offline native automation workstations, local hardware-interfacing software, and mission-critical enterprise utilities built strictly to your specifications. ",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes:
                                  "mt-4 pt-3 flex items-center gap-2 text-secondary font-label-mono-xs text-label-mono-xs",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes: "w-1.5 h-1.5 rounded-full bg-secondary",
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  children: [
                                    Component.text("Hardware Interfacing • Bespoke Engineering • Custom Protocols"),
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
              classes: "w-full px-6 lg:px-12 py-20 lg:py-28 relative",
              children: [
                // ignore: prefer_html_components
                Component.element(
                  tag: "div",
                  classes:
                      "max-w-5xl mx-auto rounded-3xl bg-surface-container p-8 lg:p-16 relative overflow-hidden shadow-2xl flex flex-col items-center text-center",
                  children: [
                    // ignore: prefer_html_components
                    Component.element(
                      tag: "div",
                      classes:
                          "absolute -top-24 left-1/2 -translate-x-1/2 w-96 h-96 bg-primary/20 rounded-full blur-3xl pointer-events-none",
                    ),
                    // ignore: prefer_html_components
                    Component.element(
                      tag: "div",
                      classes:
                          "inline-flex items-center gap-space-xs px-3 py-1 rounded-full bg-surface-container-high text-secondary font-label-mono-xs text-label-mono-xs uppercase tracking-widest font-semibold mb-space-md",
                      children: [
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "span",
                          children: [
                            Component.text("GET IN TOUCH"),
                          ],
                        ),
                      ],
                    ),
                    // ignore: prefer_html_components
                    Component.element(
                      tag: "h2",
                      classes: "font-headline-lg text-headline-lg text-on-surface tracking-tight max-w-2xl mb-space-md",
                      children: [
                        Component.text(" Have an Idea? Let's Build It Together. "),
                      ],
                    ),
                    // ignore: prefer_html_components
                    Component.element(
                      tag: "p",
                      classes: "font-body-lg text-body-lg text-on-surface-variant max-w-xl mb-space-xl",
                      children: [
                        Component.text(
                          " Whether you're starting something new or improving an existing product, let's turn your idea into reliable, production-ready software. ",
                        ),
                      ],
                    ),
                    // ignore: prefer_html_components
                    Component.element(
                      tag: "a",
                      classes:
                          "inline-flex items-center justify-center h-12 px-6 rounded-xl bg-primary text-on-primary font-headline-sm text-body-md hover:bg-primary-container hover:text-on-primary-container transition-all shadow-[0_0_24px_rgba(77,142,255,0.3)] hover:shadow-[0_0_32px_rgba(77,142,255,0.5)] mb-space-lg",
                      attributes: {
                        "data-path": "contact",
                        "href": "/contact",
                      },
                      children: [
                        Component.text(" Tell Us About Your Project → "),
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
      classes: "w-full bg-surface-container-lowest text-on-surface-variant",
      children: [
        // ignore: prefer_html_components
        Component.element(
          tag: "div",
          classes: "max-w-7xl mx-auto px-6 lg:px-12 pt-space-xl pb-space-lg",
          children: [
            // ignore: prefer_html_components
            Component.element(
              tag: "div",
              classes: "grid grid-cols-1 md:grid-cols-2 lg:grid-cols-5 gap-space-xl mb-space-xl",
              children: [
                // ignore: prefer_html_components
                Component.element(
                  tag: "div",
                  classes: "lg:col-span-2 flex flex-col gap-space-md",
                  children: [
                    // ignore: prefer_html_components
                    Component.element(
                      tag: "div",
                      classes: "flex items-center gap-space-sm",
                      children: [
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "span",
                          classes: "w-2 h-2 rounded-full bg-secondary shadow-[0_0_12px_#4cd7f6]",
                        ),
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "span",
                          classes: "font-headline-sm text-headline-sm text-on-surface font-semibold",
                          children: [
                            Component.text("Brothers-Tech"),
                          ],
                        ),
                      ],
                    ),
                    // ignore: prefer_html_components
                    Component.element(
                      tag: "p",
                      classes: "font-body-md text-body-md text-on-surface-variant max-w-sm leading-relaxed",
                      children: [
                        Component.text(
                          " Architecting elite software systems, AI infrastructure, and mission-critical cloud platforms for modern enterprises. ",
                        ),
                      ],
                    ),
                    // ignore: prefer_html_components
                    Component.element(
                      tag: "div",
                      classes: "flex items-center gap-space-sm pt-space-xs",
                      children: [
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "span",
                          classes:
                              "inline-flex items-center px-2 py-0.5 rounded-lg bg-surface-container font-label-mono-xs text-label-mono-xs text-secondary",
                          children: [
                            Component.text("STATUS // ALL SYSTEMS ONLINE"),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                // ignore: prefer_html_components
                Component.element(
                  tag: "div",
                  classes: "flex flex-col gap-space-sm",
                  children: [
                    // ignore: prefer_html_components
                    Component.element(
                      tag: "span",
                      classes: "font-label-mono text-label-mono text-on-surface tracking-wider uppercase font-semibold",
                      children: [
                        Component.text("Navigation"),
                      ],
                    ),
                    // ignore: prefer_html_components
                    Component.element(
                      tag: "ul",
                      classes: "flex flex-col gap-space-xs font-body-md text-body-md",
                      children: [
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "li",
                          classes: "pt-space-xs",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "a",
                              classes: "hover:text-on-surface transition-colors",
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
                              classes: "hover:text-on-surface transition-colors",
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
                              classes: "hover:text-on-surface transition-colors",
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
                              classes: "hover:text-on-surface transition-colors",
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
                              classes: "hover:text-on-surface transition-colors",
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
                  classes: "flex flex-col gap-space-sm",
                  children: [
                    // ignore: prefer_html_components
                    Component.element(
                      tag: "span",
                      classes: "font-label-mono text-label-mono text-on-surface tracking-wider uppercase font-semibold",
                      children: [
                        Component.text("Practices"),
                      ],
                    ),
                    // ignore: prefer_html_components
                    Component.element(
                      tag: "ul",
                      classes: "flex flex-col gap-space-xs font-body-md text-body-md",
                      children: [
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "li",
                          classes: "pt-space-xs",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "a",
                              classes: "hover:text-on-surface transition-colors",
                              attributes: {
                                "data-path": "services",
                                "href": "/services",
                              },
                              children: [
                                Component.text("Distributed Systems"),
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
                              classes: "hover:text-on-surface transition-colors",
                              attributes: {
                                "data-path": "services",
                                "href": "/services",
                              },
                              children: [
                                Component.text("AI & ML Infrastructure"),
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
                  classes: "flex flex-col gap-space-sm",
                  children: [
                    // ignore: prefer_html_components
                    Component.element(
                      tag: "span",
                      classes: "font-label-mono text-label-mono text-on-surface tracking-wider uppercase font-semibold",
                      children: [
                        Component.text("Studio"),
                      ],
                    ),
                    // ignore: prefer_html_components
                    Component.element(
                      tag: "ul",
                      classes: "flex flex-col gap-space-xs font-body-md text-body-md",
                      children: [
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "li",
                          classes: "pt-space-xs",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "a",
                              classes: "hover:text-on-surface transition-colors",
                              attributes: {
                                "data-path": "about",
                                "href": "/about",
                              },
                              children: [
                                Component.text("Engineering Team"),
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
                              classes: "hover:text-on-surface transition-colors",
                              attributes: {
                                "data-path": "about",
                                "href": "/about",
                              },
                              children: [
                                Component.text("Methodology"),
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
                              classes: "hover:text-on-surface transition-colors",
                              attributes: {
                                "data-path": "projects",
                                "href": "/projects",
                              },
                              children: [
                                Component.text("Case Studies"),
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
                              classes: "hover:text-on-surface transition-colors",
                              attributes: {
                                "data-path": "contact",
                                "href": "/contact",
                              },
                              children: [
                                Component.text("Inquiries"),
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
              tag: "div",
              classes:
                  "pt-space-lg flex flex-col md:flex-row items-center justify-between gap-space-md text-on-surface-variant",
              children: [
                // ignore: prefer_html_components
                Component.element(
                  tag: "p",
                  classes: "font-body-sm text-body-sm",
                  children: [
                    Component.text(" © 2025 Brothers-Tech Studio. All rights reserved. "),
                  ],
                ),
                // ignore: prefer_html_components
                Component.element(
                  tag: "div",
                  classes: "flex items-center gap-space-lg font-body-sm text-body-sm",
                  children: [
                    // ignore: prefer_html_components
                    Component.element(
                      tag: "a",
                      classes: "hover:text-on-surface transition-colors",
                      attributes: {
                        "data-path": "security-policy",
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
                        "data-path": "terms-of-service",
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
                        "data-path": "privacy-architecture",
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
  ]);
}

const projectsBodyClasses = "bg-background font-body-md text-on-surface antialiased min-h-screen flex flex-col";

Component buildProjectsPage() {
  return Component.fragment([
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
                                            Component.text("Integrated an AI assistant and offline content access."),
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
  ]);
}

const aboutBodyClasses = "bg-background font-body-md text-on-surface antialiased min-h-screen flex flex-col";

Component buildAboutPage() {
  return Component.fragment([
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
              tag: "div",
              classes: "relative w-full overflow-hidden",
              children: [
                // ignore: prefer_html_components
                Component.element(
                  tag: "div",
                  classes:
                      "pointer-events-none absolute -top-40 left-1/2 -translate-x-1/2 w-[720px] h-[360px] bg-primary/10 rounded-full blur-[140px] opacity-70",
                ),
                // ignore: prefer_html_components
                Component.element(
                  tag: "div",
                  classes:
                      "pointer-events-none absolute top-[30%] -right-40 w-[480px] h-[300px] bg-secondary/10 rounded-full blur-[120px] opacity-60",
                ),
                // ignore: prefer_html_components
                Component.element(
                  tag: "div",
                  classes:
                      "pointer-events-none absolute top-[70%] -left-32 w-[500px] h-[300px] bg-primary-container/10 rounded-full blur-[130px] opacity-50",
                ),
                // ignore: prefer_html_components
                Component.element(
                  tag: "section",
                  classes: "relative w-full max-w-7xl mx-auto px-6 sm:px-8 pt-16 sm:pt-24 pb-20 sm:pb-28",
                  children: [
                    // ignore: prefer_html_components
                    Component.element(
                      tag: "div",
                      classes: "max-w-4xl flex flex-col items-start space-y-6 sm:space-y-8",
                      children: [
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "div",
                          classes:
                              "inline-flex items-center gap-2.5 px-3 py-1 rounded-full bg-surface-container-low shadow-sm",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "span",
                              classes:
                                  "inline-block w-2 h-2 rounded-full bg-secondary shadow-[0_0_8px_#4cd7f6] animate-pulse",
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "span",
                              classes: "font-label-mono text-label-mono text-secondary tracking-widest uppercase",
                              children: [
                                Component.text("ABOUT BROTHERS-TECH"),
                              ],
                            ),
                          ],
                        ),
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "h1",
                          classes: "font-display-hero text-display-hero text-on-surface tracking-tight",
                          children: [
                            Component.text(" Small Team. "),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "span",
                              classes:
                                  "block bg-gradient-to-r from-primary via-secondary to-primary bg-clip-text text-transparent",
                              children: [
                                Component.text(" Serious Software. "),
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
                              " Brothers-Tech is a software development team focused on building practical, reliable digital products across mobile, web and desktop. ",
                            ),
                          ],
                        ),
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "div",
                          classes:
                              "pt-4 flex flex-wrap items-center gap-3 sm:gap-4 font-label-mono text-label-mono text-tertiary",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "span",
                              classes: "flex items-center gap-2",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes: "material-symbols-outlined text-secondary text-[16px]",
                                  children: [
                                    Component.text("verified"),
                                  ],
                                ),
                                Component.text(" Practitioner-Led "),
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
                              classes: "flex items-center gap-2",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes: "material-symbols-outlined text-secondary text-[16px]",
                                  children: [
                                    Component.text("forum"),
                                  ],
                                ),
                                Component.text(" Direct Communication "),
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
                              classes: "flex items-center gap-2",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes: "material-symbols-outlined text-secondary text-[16px]",
                                  children: [
                                    Component.text("devices"),
                                  ],
                                ),
                                Component.text(" Multi-Platform Craft "),
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
                  classes: "relative w-full max-w-7xl mx-auto px-6 sm:px-8 py-16 sm:py-24",
                  children: [
                    // ignore: prefer_html_components
                    Component.element(
                      tag: "div",
                      classes: "max-w-3xl mb-14 sm:mb-16",
                      children: [
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "div",
                          classes:
                              "flex items-center gap-2 font-label-mono text-label-mono text-secondary uppercase tracking-widest mb-3",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "span",
                              children: [
                                Component.text("01"),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "span",
                              classes: "w-8 h-[1px] bg-secondary/40",
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "span",
                              children: [
                                Component.text("Core Principles"),
                              ],
                            ),
                          ],
                        ),
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "h2",
                          classes: "font-headline-lg text-headline-lg text-on-surface tracking-tight",
                          children: [
                            Component.text(" What defines Brothers-Tech. "),
                          ],
                        ),
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "p",
                          classes: "font-body-lg text-body-lg text-on-surface-variant mt-3",
                          children: [
                            Component.text(
                              " Engineering guidelines that dictate how we write every file, architect every database, and ship every release. ",
                            ),
                          ],
                        ),
                      ],
                    ),
                    // ignore: prefer_html_components
                    Component.element(
                      tag: "div",
                      classes: "grid grid-cols-1 md:grid-cols-2 gap-6 lg:gap-8",
                      children: [
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "div",
                          classes:
                              "p-8 sm:p-10 rounded-xl bg-surface-container-low shadow-sm flex flex-col justify-between hover:bg-surface-container transition-colors duration-300",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "div",
                                  classes:
                                      "w-12 h-12 rounded-lg bg-surface-container-highest flex items-center justify-center mb-6",
                                  children: [
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "span",
                                      classes: "material-symbols-outlined text-secondary text-[24px]",
                                      children: [
                                        Component.text("view_in_ar"),
                                      ],
                                    ),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "h3",
                                  classes: "font-headline-md text-headline-md text-on-surface mb-3",
                                  children: [
                                    Component.text(" Product First "),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "p",
                                  classes: "font-body-md text-body-md text-on-surface-variant leading-relaxed",
                                  children: [
                                    Component.text(
                                      " We don't just write code to ticket specs; we think about user adoption, business viability, and real-world utility before touching a keyboard. A technically flawless feature is worthless if it creates user confusion. ",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes: "mt-8 pt-4 font-label-mono text-label-mono-xs text-tertiary",
                              children: [
                                Component.text(" FOCUS // OUTCOME OVER CEREMONY "),
                              ],
                            ),
                          ],
                        ),
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "div",
                          classes:
                              "p-8 sm:p-10 rounded-xl bg-surface-container-low shadow-sm flex flex-col justify-between hover:bg-surface-container transition-colors duration-300",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "div",
                                  classes:
                                      "w-12 h-12 rounded-lg bg-surface-container-highest flex items-center justify-center mb-6",
                                  children: [
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "span",
                                      classes: "material-symbols-outlined text-primary text-[24px]",
                                      children: [
                                        Component.text("signal_cellular_connected_no_internet_4_bar"),
                                      ],
                                    ),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "h3",
                                  classes: "font-headline-md text-headline-md text-on-surface mb-3",
                                  children: [
                                    Component.text(" Built for Real Use "),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "p",
                                  classes: "font-body-md text-body-md text-on-surface-variant leading-relaxed",
                                  children: [
                                    Component.text(
                                      " Software needs to work under edge conditions, slow connections, and messy human workflows—not just in clean local demos. We test for battery drain, unstable networks, and unexpected inputs from day one. ",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes: "mt-8 pt-4 font-label-mono text-label-mono-xs text-tertiary",
                              children: [
                                Component.text(" RESILIENCE // ZERO CHEAP DEMOS "),
                              ],
                            ),
                          ],
                        ),
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "div",
                          classes:
                              "p-8 sm:p-10 rounded-xl bg-surface-container-low shadow-sm flex flex-col justify-between hover:bg-surface-container transition-colors duration-300",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "div",
                                  classes:
                                      "w-12 h-12 rounded-lg bg-surface-container-highest flex items-center justify-center mb-6",
                                  children: [
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "span",
                                      classes: "material-symbols-outlined text-secondary text-[24px]",
                                      children: [
                                        Component.text("code_blocks"),
                                      ],
                                    ),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "h3",
                                  classes: "font-headline-md text-headline-md text-on-surface mb-3",
                                  children: [
                                    Component.text(" Clean Engineering "),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "p",
                                  classes: "font-body-md text-body-md text-on-surface-variant leading-relaxed",
                                  children: [
                                    Component.text(
                                      " Maintainable codebases, type-safety, modular architecture, and zero unnecessary dependencies that slow future development down. We leave systems clean so your in-house team can step in without dread. ",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes: "mt-8 pt-4 font-label-mono text-label-mono-xs text-tertiary",
                              children: [
                                Component.text(" INTEGRITY // ZERO CODE BLOAT "),
                              ],
                            ),
                          ],
                        ),
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "div",
                          classes:
                              "p-8 sm:p-10 rounded-xl bg-surface-container-low shadow-sm flex flex-col justify-between hover:bg-surface-container transition-colors duration-300",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "div",
                                  classes:
                                      "w-12 h-12 rounded-lg bg-surface-container-highest flex items-center justify-center mb-6",
                                  children: [
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "span",
                                      classes: "material-symbols-outlined text-primary text-[24px]",
                                      children: [
                                        Component.text("all_inclusive"),
                                      ],
                                    ),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "h3",
                                  classes: "font-headline-md text-headline-md text-on-surface mb-3",
                                  children: [
                                    Component.text(" Long-Term Thinking "),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "p",
                                  classes: "font-body-md text-body-md text-on-surface-variant leading-relaxed",
                                  children: [
                                    Component.text(
                                      " We build systems designed to be operated, maintained, and evolved gracefully long after initial launch day. Smart schema versioning, backward compatibility, and sound migration paths are non-negotiable. ",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes: "mt-8 pt-4 font-label-mono text-label-mono-xs text-tertiary",
                              children: [
                                Component.text(" LIFECYCLE // OPERATIONAL MATURITY "),
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
                  classes: "relative w-full max-w-7xl mx-auto px-6 sm:px-8 py-16 sm:py-24",
                  children: [
                    // ignore: prefer_html_components
                    Component.element(
                      tag: "div",
                      classes: "max-w-3xl mb-14 sm:mb-16",
                      children: [
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "div",
                          classes:
                              "flex items-center gap-2 font-label-mono text-label-mono text-secondary uppercase tracking-widest mb-3",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "span",
                              children: [
                                Component.text("02"),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "span",
                              classes: "w-8 h-[1px] bg-secondary/40",
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "span",
                              children: [
                                Component.text("Our Journey"),
                              ],
                            ),
                          ],
                        ),
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "h2",
                          classes: "font-headline-lg text-headline-lg text-on-surface tracking-tight",
                          children: [
                            Component.text(" Built through real projects. "),
                          ],
                        ),
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "p",
                          classes: "font-body-lg text-body-lg text-on-surface-variant mt-3",
                          children: [
                            Component.text(
                              " Capability is forged through shipping real software under tight constraints, not memorizing abstract buzzwords. ",
                            ),
                          ],
                        ),
                      ],
                    ),
                    // ignore: prefer_html_components
                    Component.element(
                      tag: "div",
                      classes: "relative grid grid-cols-1 md:grid-cols-4 gap-6",
                      children: [
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "div",
                          classes: "relative p-6 sm:p-8 rounded-xl bg-surface-container-low shadow-sm flex flex-col",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes: "flex items-center justify-between mb-6",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes: "font-label-mono text-label-mono text-secondary",
                                  children: [
                                    Component.text("PHASE 01"),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "div",
                                  classes: "w-3 h-3 rounded-full bg-secondary shadow-[0_0_8px_#4cd7f6]",
                                ),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "h3",
                              classes: "font-headline-md text-headline-md text-on-surface mb-2",
                              children: [
                                Component.text(" Learn "),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "p",
                              classes: "font-body-sm text-body-sm text-on-surface-variant leading-relaxed flex-1",
                              children: [
                                Component.text(
                                  " Deeply immersing in domain constraints, user behavior, and technology primitives before proposing any architectural pattern. ",
                                ),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes: "mt-6 pt-4 flex items-center gap-2 text-tertiary font-label-mono-xs",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes: "material-symbols-outlined text-[14px]",
                                  children: [
                                    Component.text("search"),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  children: [
                                    Component.text("Discovery & Scoping"),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "div",
                          classes: "relative p-6 sm:p-8 rounded-xl bg-surface-container-low shadow-sm flex flex-col",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes: "flex items-center justify-between mb-6",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes: "font-label-mono text-label-mono text-primary",
                                  children: [
                                    Component.text("PHASE 02"),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "div",
                                  classes: "w-3 h-3 rounded-full bg-primary shadow-[0_0_8px_#adc6ff]",
                                ),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "h3",
                              classes: "font-headline-md text-headline-md text-on-surface mb-2",
                              children: [
                                Component.text(" Build "),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "p",
                              classes: "font-body-sm text-body-sm text-on-surface-variant leading-relaxed flex-1",
                              children: [
                                Component.text(
                                  " Translating architecture into clean, testable software across mobile, web, and desktop with zero intermediate handoffs. ",
                                ),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes: "mt-6 pt-4 flex items-center gap-2 text-tertiary font-label-mono-xs",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes: "material-symbols-outlined text-[14px]",
                                  children: [
                                    Component.text("code"),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  children: [
                                    Component.text("Disciplined Coding"),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "div",
                          classes: "relative p-6 sm:p-8 rounded-xl bg-surface-container-low shadow-sm flex flex-col",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes: "flex items-center justify-between mb-6",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes: "font-label-mono text-label-mono text-secondary",
                                  children: [
                                    Component.text("PHASE 03"),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "div",
                                  classes: "w-3 h-3 rounded-full bg-secondary shadow-[0_0_8px_#4cd7f6]",
                                ),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "h3",
                              classes: "font-headline-md text-headline-md text-on-surface mb-2",
                              children: [
                                Component.text(" Ship "),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "p",
                              classes: "font-body-sm text-body-sm text-on-surface-variant leading-relaxed flex-1",
                              children: [
                                Component.text(
                                  " Deploying production releases with disciplined QA, smooth automated CI/CD, and stringent App Store or cloud compliance. ",
                                ),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes: "mt-6 pt-4 flex items-center gap-2 text-tertiary font-label-mono-xs",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes: "material-symbols-outlined text-[14px]",
                                  children: [
                                    Component.text("rocket_launch"),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  children: [
                                    Component.text("Automated Releases"),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "div",
                          classes: "relative p-6 sm:p-8 rounded-xl bg-surface-container-low shadow-sm flex flex-col",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes: "flex items-center justify-between mb-6",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes: "font-label-mono text-label-mono text-primary",
                                  children: [
                                    Component.text("PHASE 04"),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "div",
                                  classes: "w-3 h-3 rounded-full bg-primary shadow-[0_0_8px_#adc6ff]",
                                ),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "h3",
                              classes: "font-headline-md text-headline-md text-on-surface mb-2",
                              children: [
                                Component.text(" Improve "),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "p",
                              classes: "font-body-sm text-body-sm text-on-surface-variant leading-relaxed flex-1",
                              children: [
                                Component.text(
                                  " Listening to real user feedback, monitoring edge cases, profiling bottlenecks, and refining performance continuously. ",
                                ),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes: "mt-6 pt-4 flex items-center gap-2 text-tertiary font-label-mono-xs",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes: "material-symbols-outlined text-[14px]",
                                  children: [
                                    Component.text("refresh"),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  children: [
                                    Component.text("Telemetry & Polish"),
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
                  classes: "relative w-full max-w-7xl mx-auto px-6 sm:px-8 py-16 sm:py-24",
                  children: [
                    // ignore: prefer_html_components
                    Component.element(
                      tag: "div",
                      classes: "rounded-xl bg-surface-container-lowest p-8 sm:p-14 shadow-2xl relative overflow-hidden",
                      children: [
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "div",
                          classes:
                              "absolute top-0 left-0 right-0 h-[2px] bg-gradient-to-r from-transparent via-secondary to-transparent opacity-80",
                        ),
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "div",
                          classes: "max-w-2xl mb-12 sm:mb-16",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes:
                                  "flex items-center gap-2 font-label-mono text-label-mono text-secondary uppercase tracking-widest mb-3",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  children: [
                                    Component.text("03"),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes: "w-8 h-[1px] bg-secondary/40",
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  children: [
                                    Component.text("Engineering Philosophy"),
                                  ],
                                ),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "h2",
                              classes: "font-headline-lg text-headline-lg text-on-surface tracking-tight",
                              children: [
                                Component.text(" Good software isn't just code. "),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "p",
                              classes: "font-body-lg text-body-lg text-on-surface-variant mt-2",
                              children: [
                                Component.text(
                                  " Lines of code are a liability, not an asset. Value is measured by human simplicity and operational endurance. ",
                                ),
                              ],
                            ),
                          ],
                        ),
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "div",
                          classes: "grid grid-cols-1 md:grid-cols-3 gap-8 sm:gap-10",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes: "space-y-4",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes: "font-label-mono text-headline-sm text-secondary font-semibold",
                                  children: [
                                    Component.text("01"),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "h3",
                                  classes: "font-headline-md text-headline-md text-on-surface",
                                  children: [
                                    Component.text(" It solves a real problem "),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "p",
                                  classes: "font-body-md text-body-md text-on-surface-variant leading-relaxed",
                                  children: [
                                    Component.text(
                                      " If it doesn't eliminate friction or unlock a genuine capability, no amount of engineering polish will save it. We question assumptions early so time isn't wasted building what nobody uses. ",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes: "space-y-4",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes: "font-label-mono text-headline-sm text-primary font-semibold",
                                  children: [
                                    Component.text("02"),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "h3",
                                  classes: "font-headline-md text-headline-md text-on-surface",
                                  children: [
                                    Component.text(" It feels simple to use "),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "p",
                                  classes: "font-body-md text-body-md text-on-surface-variant leading-relaxed",
                                  children: [
                                    Component.text(
                                      " True sophistication is making complex distributed logic feel effortless, intuitive, and responsive to the user. Fast micro-interactions and sensible defaults beat confusing menus every time. ",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes: "space-y-4",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "span",
                                  classes: "font-label-mono text-headline-sm text-secondary font-semibold",
                                  children: [
                                    Component.text("03"),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "h3",
                                  classes: "font-headline-md text-headline-md text-on-surface",
                                  children: [
                                    Component.text(" It can grow "),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "p",
                                  classes: "font-body-md text-body-md text-on-surface-variant leading-relaxed",
                                  children: [
                                    Component.text(
                                      " Architected from day one so adding a mobile client, a new API endpoint, or doubling user volume doesn't require a complete rewrite. Modularity allows gradual evolution without friction. ",
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
                  classes: "relative w-full max-w-7xl mx-auto px-6 sm:px-8 py-16 sm:py-24",
                  children: [
                    // ignore: prefer_html_components
                    Component.element(
                      tag: "div",
                      classes: "max-w-3xl mb-14 sm:mb-16",
                      children: [
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "div",
                          classes:
                              "flex items-center gap-2 font-label-mono text-label-mono text-secondary uppercase tracking-widest mb-3",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "span",
                              children: [
                                Component.text("04"),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "span",
                              classes: "w-8 h-[1px] bg-secondary/40",
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "span",
                              children: [
                                Component.text("Engineers & Designers"),
                              ],
                            ),
                          ],
                        ),
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "h2",
                          classes: "font-headline-lg text-headline-lg text-on-surface tracking-tight",
                          children: [
                            Component.text(" Small by design. Driven by craft. "),
                          ],
                        ),
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "p",
                          classes: "font-body-lg text-body-lg text-on-surface-variant mt-3",
                          children: [
                            Component.text(
                              " We keep the team lean so every project gets direct attention from experienced practitioners. No junior delegates, no outsourced accounts. ",
                            ),
                          ],
                        ),
                      ],
                    ),
                    // ignore: prefer_html_components
                    Component.element(
                      tag: "div",
                      classes: "grid grid-cols-1 md:grid-cols-3 gap-8",
                      children: [
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "div",
                          classes:
                              "group rounded-xl bg-surface-container-low overflow-hidden shadow-sm flex flex-col justify-between hover:bg-surface-container transition-all duration-300",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "div",
                                  classes: "relative w-full h-72 overflow-hidden bg-surface-container-highest",
                                  children: [
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "img",
                                      classes:
                                          "w-full h-full object-cover grayscale contrast-125 group-hover:scale-105 transition-transform duration-500",
                                      attributes: {
                                        "data-alt":
                                            "Editorial portrait of a male technical lead engineer in a minimalist dark studio setting, moody cinematic soft lighting with subtle cool cyan rim light, wearing a dark crewneck, thoughtful and focused expression, high dynamic range editorial portrait photograph in contemporary aesthetic.",
                                        "src": "assets/images/Mahmoud.png",
                                      },
                                    ),
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "div",
                                      classes:
                                          "absolute inset-0 bg-gradient-to-t from-surface-container-low via-transparent to-transparent",
                                    ),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "div",
                                  classes: "p-6 sm:p-8 space-y-3",
                                  children: [
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "div",
                                      classes: "flex items-center justify-between",
                                      children: [
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "span",
                                          classes:
                                              "font-label-mono text-label-mono-xs text-secondary uppercase tracking-wider",
                                          children: [
                                            Component.text("FOUNDER / MOBILE DEVELOPER / BACK-END DEVELOPER"),
                                          ],
                                        ),
                                      ],
                                    ),
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "h3",
                                      classes: "font-headline-md text-headline-md text-on-surface font-semibold",
                                      children: [
                                        Component.text(" Mahmoud Bannan "),
                                      ],
                                    ),
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "p",
                                      classes: "font-body-sm text-body-sm text-tertiary",
                                      children: [
                                        Component.text(" FOUNDER & Mobile Developer & Back-end Developer "),
                                      ],
                                    ),
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "p",
                                      classes: "font-body-md text-body-md text-on-surface-variant pt-2 leading-relaxed",
                                      children: [
                                        Component.text(
                                          " Building reliable mobile applications and robust back-end systems with a focus on clean architecture, performance, and maintainable code. ",
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
                                  "px-6 sm:px-8 pb-6 sm:pb-8 pt-2 flex items-center gap-4 font-label-mono text-label-mono text-primary",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "a",
                                  classes: "inline-flex items-center gap-1 hover:text-secondary transition-colors",
                                  attributes: {
                                    "href": "https://www.linkedin.com/in/mouhammed-deeb-jalab",
                                  },
                                  children: [
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "span",
                                      children: [
                                        Component.text("LinkedIn"),
                                      ],
                                    ),
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "span",
                                      classes: "material-symbols-outlined text-[14px]",
                                      children: [
                                        Component.text("north_east"),
                                      ],
                                    ),
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
                                  tag: "a",
                                  classes: "inline-flex items-center gap-1 hover:text-secondary transition-colors",
                                  attributes: {
                                    "href": "https://github.com/Mohamed-Jalab",
                                  },
                                  children: [
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "span",
                                      children: [
                                        Component.text("GitHub"),
                                      ],
                                    ),
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "span",
                                      classes: "material-symbols-outlined text-[14px]",
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
                          classes:
                              "group rounded-xl bg-surface-container-low overflow-hidden shadow-sm flex flex-col justify-between hover:bg-surface-container transition-all duration-300",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "div",
                                  classes: "relative w-full h-72 overflow-hidden bg-surface-container-highest",
                                  children: [
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "img",
                                      classes:
                                          "w-full h-full object-cover grayscale contrast-125 group-hover:scale-105 transition-transform duration-500",
                                      attributes: {
                                        "alt":
                                            "Portrait of Mohammed Deeb Jalab, founder, mobile developer, and front-end web developer",
                                        "src": "assets/images/Mohammed.jpg",
                                      },
                                    ),
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "div",
                                      classes:
                                          "absolute inset-0 bg-gradient-to-t from-surface-container-low via-transparent to-transparent",
                                    ),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "div",
                                  classes: "p-6 sm:p-8 space-y-3",
                                  children: [
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "div",
                                      classes: "flex items-center justify-between",
                                      children: [
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "span",
                                          classes:
                                              "font-label-mono text-label-mono-xs text-primary uppercase tracking-wider",
                                          children: [
                                            Component.text("FOUNDER / MOBILE DEVELOPER / FRONT-END WEB DEVELOPER"),
                                          ],
                                        ),
                                      ],
                                    ),
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "h3",
                                      classes: "font-headline-md text-headline-md text-on-surface font-semibold",
                                      children: [
                                        Component.text(" Mohammed Deeb Jalab "),
                                      ],
                                    ),
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "p",
                                      classes: "font-body-sm text-body-sm text-tertiary",
                                      children: [
                                        Component.text(" FOUNDER & Mobile Developer & Front-end Web Developer "),
                                      ],
                                    ),
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "p",
                                      classes: "font-body-md text-body-md text-on-surface-variant pt-2 leading-relaxed",
                                      children: [
                                        Component.text(
                                          " Building polished mobile applications and responsive web experiences with clean code, intuitive interfaces, and dependable performance. ",
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
                                  "px-6 sm:px-8 pb-6 sm:pb-8 pt-2 flex items-center gap-4 font-label-mono text-label-mono text-primary",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "a",
                                  classes: "inline-flex items-center gap-1 hover:text-secondary transition-colors",
                                  attributes: {
                                    "href": "https://www.linkedin.com/in/mouhammed-deeb-jalab",
                                  },
                                  children: [
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "span",
                                      children: [
                                        Component.text("LinkedIn"),
                                      ],
                                    ),
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "span",
                                      classes: "material-symbols-outlined text-[14px]",
                                      children: [
                                        Component.text("north_east"),
                                      ],
                                    ),
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
                                  tag: "a",
                                  classes: "inline-flex items-center gap-1 hover:text-secondary transition-colors",
                                  attributes: {
                                    "href": "https://github.com/Mohamed-Jalab",
                                  },
                                  children: [
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "span",
                                      children: [
                                        Component.text("GitHub"),
                                      ],
                                    ),
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "span",
                                      classes: "material-symbols-outlined text-[14px]",
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
                      ],
                    ),
                  ],
                ),
                // ignore: prefer_html_components
                Component.element(
                  tag: "section",
                  classes: "relative w-full max-w-7xl mx-auto px-6 sm:px-8 py-10",
                  children: [
                    // ignore: prefer_html_components
                    Component.element(
                      tag: "div",
                      classes:
                          "py-5 px-6 sm:px-10 rounded-xl bg-surface-container-lowest/80 backdrop-blur-md flex flex-wrap items-center justify-around gap-4 shadow-sm",
                      children: [
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "span",
                          classes:
                              "font-label-mono text-label-mono text-on-surface flex items-center gap-2 tracking-wider",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "span",
                              classes: "w-1.5 h-1.5 rounded-full bg-secondary shadow-[0_0_6px_#4cd7f6]",
                            ),
                            Component.text(" Mobile "),
                          ],
                        ),
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "span",
                          classes: "text-outline-variant/60",
                          children: [
                            Component.text("•"),
                          ],
                        ),
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "span",
                          classes:
                              "font-label-mono text-label-mono text-on-surface flex items-center gap-2 tracking-wider",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "span",
                              classes: "w-1.5 h-1.5 rounded-full bg-primary shadow-[0_0_6px_#adc6ff]",
                            ),
                            Component.text(" Web "),
                          ],
                        ),
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "span",
                          classes: "text-outline-variant/60",
                          children: [
                            Component.text("•"),
                          ],
                        ),
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "span",
                          classes:
                              "font-label-mono text-label-mono text-on-surface flex items-center gap-2 tracking-wider",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "span",
                              classes: "w-1.5 h-1.5 rounded-full bg-secondary shadow-[0_0_6px_#4cd7f6]",
                            ),
                            Component.text(" Desktop "),
                          ],
                        ),
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "span",
                          classes: "text-outline-variant/60",
                          children: [
                            Component.text("•"),
                          ],
                        ),
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "span",
                          classes:
                              "font-label-mono text-label-mono text-on-surface flex items-center gap-2 tracking-wider",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "span",
                              classes: "w-1.5 h-1.5 rounded-full bg-secondary shadow-[0_0_6px_#4cd7f6]",
                            ),
                            Component.text(" UI/UX "),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                // ignore: prefer_html_components
                Component.element(
                  tag: "section",
                  classes: "relative w-full max-w-7xl mx-auto px-6 sm:px-8 pt-12 pb-24 sm:pb-32",
                  children: [
                    // ignore: prefer_html_components
                    Component.element(
                      tag: "div",
                      classes:
                          "relative rounded-2xl bg-surface-container-low p-8 sm:p-16 shadow-2xl overflow-hidden text-center flex flex-col items-center",
                      children: [
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "div",
                          classes:
                              "pointer-events-none absolute inset-0 bg-[radial-gradient(ellipse_at_center,rgba(77,142,255,0.12)_0%,transparent_70%)]",
                        ),
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "div",
                          classes:
                              "inline-flex items-center gap-2 px-3.5 py-1.5 rounded-full bg-surface-container-lowest text-secondary font-label-mono text-label-mono mb-8 shadow-sm",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "span",
                              classes: "w-2 h-2 rounded-full bg-secondary shadow-[0_0_8px_#4cd7f6] animate-ping",
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
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "h2",
                          classes: "font-headline-lg text-headline-lg text-on-surface tracking-tight max-w-2xl mb-4",
                          children: [
                            Component.text(" Have an Idea? Let's Build It Together. "),
                          ],
                        ),
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "p",
                          classes: "font-body-lg text-body-lg text-on-surface-variant max-w-xl mb-8 leading-relaxed",
                          children: [
                            Component.text(
                              " Whether you're starting something new or improving an existing product, let's turn your idea into reliable software. ",
                            ),
                          ],
                        ),
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "a",
                          classes:
                              "inline-flex items-center justify-center h-12 px-8 rounded-lg bg-primary-container text-on-primary-container font-body-md text-body-md font-medium hover:bg-primary transition-all duration-200 shadow-[inset_0_1px_0_rgba(255,255,255,0.2)] hover:shadow-[0_0_24px_rgba(77,142,255,0.4)]",
                          attributes: {
                            "data-path": "contact",
                            "href": "/contact",
                          },
                          children: [
                            Component.text(" Tell Us About Your Project → "),
                          ],
                        ),
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "p",
                          classes: "font-label-mono text-label-mono-xs text-tertiary mt-6",
                          children: [
                            Component.text(" DIRECT RESPONSE FROM A TECHNICAL LEAD WITHIN 24 HOURS "),
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
  ]);
}

const contactBodyClasses = "bg-background font-body-md text-on-surface antialiased min-h-screen";

Component buildContactPage() {
  return Component.fragment([
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
                  classes: "px-4 py-2 transition-colors bg-surface-container-high text-primary font-medium rounded-lg",
                  attributes: {
                    "aria-current": "page",
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
      classes: "w-full pt-20 bg-background min-h-screen",
      children: [
        // ignore: prefer_html_components
        Component.element(
          tag: "div",
          classes: "flex flex-col w-full",
          children: [
            // ignore: prefer_html_components
            Component.element(
              tag: "div",
              classes: "relative w-full overflow-hidden",
              children: [
                // ignore: prefer_html_components
                Component.element(
                  tag: "div",
                  classes:
                      "absolute top-0 left-1/2 -translate-x-1/2 w-[720px] h-[340px] bg-gradient-to-b from-primary/15 via-secondary/5 to-transparent blur-3xl pointer-events-none -z-10",
                ),
                // ignore: prefer_html_components
                Component.element(
                  tag: "section",
                  classes: "max-w-7xl mx-auto px-6 sm:px-8 pt-12 pb-16 w-full",
                  children: [
                    // ignore: prefer_html_components
                    Component.element(
                      tag: "div",
                      classes: "flex flex-col items-start gap-4 max-w-3xl",
                      children: [
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "div",
                          classes:
                              "inline-flex items-center gap-2 px-3 py-1 rounded-full bg-surface-container-high border border-outline-variant/40 shadow-sm",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "span",
                              classes: "w-1.5 h-1.5 rounded-full bg-secondary shadow-[0_0_8px_#4cd7f6] animate-pulse",
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "span",
                              classes: "font-label-mono text-label-mono text-secondary tracking-widest uppercase",
                              children: [
                                Component.text("Contact"),
                              ],
                            ),
                          ],
                        ),
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "h1",
                          classes:
                              "font-headline-lg text-headline-lg md:text-[54px] md:leading-[62px] text-on-surface tracking-tight font-semibold mt-1",
                          children: [
                            Component.text(" Let's Build "),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "span",
                              classes:
                                  "bg-clip-text text-transparent bg-gradient-to-r from-primary via-secondary to-primary-container",
                              children: [
                                Component.text("Something Together."),
                              ],
                            ),
                          ],
                        ),
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "p",
                          classes: "font-body-lg text-body-lg text-on-surface-variant max-w-2xl leading-relaxed mt-1",
                          children: [
                            Component.text(
                              " Have a software idea, an existing product that needs improvement, or a business problem that technology could solve? Tell us about it. ",
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
                  classes: "max-w-7xl mx-auto px-6 sm:px-8 pb-24 w-full",
                  children: [
                    // ignore: prefer_html_components
                    Component.element(
                      tag: "div",
                      classes: "grid grid-cols-1 lg:grid-cols-12 gap-8 items-start",
                      children: [
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "div",
                          classes:
                              "lg:col-span-12 bg-surface-container-low/90 backdrop-blur-md rounded-xl border border-outline-variant/40 p-6 md:p-8 shadow-xl relative",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes:
                                  "absolute inset-x-0 top-0 h-px bg-gradient-to-r from-transparent via-primary/30 to-transparent",
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "form",
                              id: "project-inquiry-form",
                              classes: "space-y-6",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "div",
                                  classes: "grid grid-cols-1 sm:grid-cols-2 gap-5",
                                  children: [
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "div",
                                      classes: "flex flex-col gap-2",
                                      children: [
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "label",
                                          classes:
                                              "font-body-md text-body-md font-medium text-on-surface flex items-center justify-between",
                                          attributes: {
                                            "for": "contact-name",
                                          },
                                          children: [
                                            // ignore: prefer_html_components
                                            Component.element(
                                              tag: "span",
                                              children: [
                                                Component.text("Your Name"),
                                              ],
                                            ),
                                            // ignore: prefer_html_components
                                            Component.element(
                                              tag: "span",
                                              classes:
                                                  "font-label-mono-xs text-label-mono-xs text-outline tracking-wider uppercase",
                                              children: [
                                                Component.text("Required"),
                                              ],
                                            ),
                                          ],
                                        ),
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "div",
                                          classes: "relative",
                                          children: [
                                            // ignore: prefer_html_components
                                            Component.element(
                                              tag: "input",
                                              id: "contact-name",
                                              classes:
                                                  "w-full h-11 px-3.5 rounded-lg bg-surface-container-lowest border border-outline-variant/50 text-on-surface placeholder:text-outline/70 font-body-md text-body-md focus:outline-none focus:border-primary focus:ring-1 focus:ring-primary transition-all",
                                              attributes: {
                                                "placeholder": "e.g., Alex Morgan",
                                                "required": "",
                                                "type": "text",
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "div",
                                      classes: "flex flex-col gap-2",
                                      children: [
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "label",
                                          classes:
                                              "font-body-md text-body-md font-medium text-on-surface flex items-center justify-between",
                                          attributes: {
                                            "for": "contact-email",
                                          },
                                          children: [
                                            // ignore: prefer_html_components
                                            Component.element(
                                              tag: "span",
                                              children: [
                                                Component.text("Work Email"),
                                              ],
                                            ),
                                            // ignore: prefer_html_components
                                            Component.element(
                                              tag: "span",
                                              classes:
                                                  "font-label-mono-xs text-label-mono-xs text-outline tracking-wider uppercase",
                                              children: [
                                                Component.text("Required"),
                                              ],
                                            ),
                                          ],
                                        ),
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "div",
                                          classes: "relative",
                                          children: [
                                            // ignore: prefer_html_components
                                            Component.element(
                                              tag: "input",
                                              id: "contact-email",
                                              classes:
                                                  "w-full h-11 px-3.5 rounded-lg bg-surface-container-lowest border border-outline-variant/50 text-on-surface placeholder:text-outline/70 font-body-md text-body-md focus:outline-none focus:border-primary focus:ring-1 focus:ring-primary transition-all",
                                              attributes: {
                                                "placeholder": "alex@company.com",
                                                "required": "",
                                                "type": "email",
                                              },
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
                                  classes: "flex flex-col gap-2",
                                  children: [
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "label",
                                      classes:
                                          "font-body-md text-body-md font-medium text-on-surface flex items-center justify-between",
                                      attributes: {
                                        "for": "contact-company",
                                      },
                                      children: [
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "span",
                                          children: [
                                            Component.text("Company or Organization"),
                                          ],
                                        ),
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "span",
                                          classes:
                                              "font-label-mono-xs text-label-mono-xs px-2 py-0.5 rounded bg-surface-container-high text-on-surface-variant uppercase tracking-wider",
                                          children: [
                                            Component.text("Optional"),
                                          ],
                                        ),
                                      ],
                                    ),
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "input",
                                      id: "contact-company",
                                      classes:
                                          "w-full h-11 px-3.5 rounded-lg bg-surface-container-lowest border border-outline-variant/50 text-on-surface placeholder:text-outline/70 font-body-md text-body-md focus:outline-none focus:border-primary focus:ring-1 focus:ring-primary transition-all",
                                      attributes: {
                                        "placeholder": "Acme Studio or stealth startup",
                                        "type": "text",
                                      },
                                    ),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "div",
                                  classes: "flex flex-col gap-3",
                                  children: [
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "label",
                                      classes:
                                          "font-body-md text-body-md font-medium text-on-surface flex items-center justify-between",
                                      children: [
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "span",
                                          children: [
                                            Component.text("What can we help you with?"),
                                          ],
                                        ),
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "span",
                                          classes: "font-label-mono-xs text-label-mono-xs text-outline",
                                          children: [
                                            Component.text("Select all that apply"),
                                          ],
                                        ),
                                      ],
                                    ),
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "div",
                                      id: "scope-pills",
                                      classes: "flex flex-wrap gap-2.5",
                                      children: [
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "button",
                                          classes:
                                              "scope-pill px-3.5 py-2 rounded-lg text-body-sm font-label-mono bg-surface-container-lowest border border-outline-variant/50 text-on-surface-variant hover:text-on-surface hover:border-outline transition-all flex items-center gap-1.5",
                                          attributes: {
                                            "data-selected": "false",
                                            "type": "button",
                                          },
                                          children: [
                                            // ignore: prefer_html_components
                                            Component.element(
                                              tag: "span",
                                              classes:
                                                  "material-symbols-outlined text-[16px] text-outline opacity-0 scope-icon transition-opacity",
                                              children: [
                                                Component.text("check"),
                                              ],
                                            ),
                                            // ignore: prefer_html_components
                                            Component.element(
                                              tag: "span",
                                              children: [
                                                Component.text("Mobile App"),
                                              ],
                                            ),
                                          ],
                                        ),
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "button",
                                          classes:
                                              "scope-pill px-3.5 py-2 rounded-lg text-body-sm font-label-mono bg-surface-container-lowest border border-outline-variant/50 text-on-surface-variant hover:text-on-surface hover:border-outline transition-all flex items-center gap-1.5",
                                          attributes: {
                                            "data-selected": "false",
                                            "type": "button",
                                          },
                                          children: [
                                            // ignore: prefer_html_components
                                            Component.element(
                                              tag: "span",
                                              classes:
                                                  "material-symbols-outlined text-[16px] text-outline opacity-0 scope-icon transition-opacity",
                                              children: [
                                                Component.text("check"),
                                              ],
                                            ),
                                            // ignore: prefer_html_components
                                            Component.element(
                                              tag: "span",
                                              children: [
                                                Component.text("Web Platform"),
                                              ],
                                            ),
                                          ],
                                        ),
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "button",
                                          classes:
                                              "scope-pill px-3.5 py-2 rounded-lg text-body-sm font-label-mono bg-surface-container-lowest border border-outline-variant/50 text-on-surface-variant hover:text-on-surface hover:border-outline transition-all flex items-center gap-1.5",
                                          attributes: {
                                            "data-selected": "false",
                                            "type": "button",
                                          },
                                          children: [
                                            // ignore: prefer_html_components
                                            Component.element(
                                              tag: "span",
                                              classes:
                                                  "material-symbols-outlined text-[16px] text-outline opacity-0 scope-icon transition-opacity",
                                              children: [
                                                Component.text("check"),
                                              ],
                                            ),
                                            // ignore: prefer_html_components
                                            Component.element(
                                              tag: "span",
                                              children: [
                                                Component.text("Desktop Software"),
                                              ],
                                            ),
                                          ],
                                        ),
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "button",
                                          classes:
                                              "scope-pill px-3.5 py-2 rounded-lg text-body-sm font-label-mono bg-surface-container-lowest border border-outline-variant/50 text-on-surface-variant hover:text-on-surface hover:border-outline transition-all flex items-center gap-1.5",
                                          attributes: {
                                            "data-selected": "false",
                                            "type": "button",
                                          },
                                          children: [
                                            // ignore: prefer_html_components
                                            Component.element(
                                              tag: "span",
                                              classes:
                                                  "material-symbols-outlined text-[16px] text-outline opacity-0 scope-icon transition-opacity",
                                              children: [
                                                Component.text("check"),
                                              ],
                                            ),
                                            // ignore: prefer_html_components
                                            Component.element(
                                              tag: "span",
                                              children: [
                                                Component.text("Backend & API"),
                                              ],
                                            ),
                                          ],
                                        ),
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "button",
                                          classes:
                                              "scope-pill px-3.5 py-2 rounded-lg text-body-sm font-label-mono bg-surface-container-lowest border border-outline-variant/50 text-on-surface-variant hover:text-on-surface hover:border-outline transition-all flex items-center gap-1.5",
                                          attributes: {
                                            "data-selected": "false",
                                            "type": "button",
                                          },
                                          children: [
                                            // ignore: prefer_html_components
                                            Component.element(
                                              tag: "span",
                                              classes:
                                                  "material-symbols-outlined text-[16px] text-outline opacity-0 scope-icon transition-opacity",
                                              children: [
                                                Component.text("check"),
                                              ],
                                            ),
                                            // ignore: prefer_html_components
                                            Component.element(
                                              tag: "span",
                                              children: [
                                                Component.text("UI/UX Design"),
                                              ],
                                            ),
                                          ],
                                        ),
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "button",
                                          classes:
                                              "scope-pill px-3.5 py-2 rounded-lg text-body-sm font-label-mono bg-surface-container-lowest border border-outline-variant/50 text-on-surface-variant hover:text-on-surface hover:border-outline transition-all flex items-center gap-1.5",
                                          attributes: {
                                            "data-selected": "false",
                                            "type": "button",
                                          },
                                          children: [
                                            // ignore: prefer_html_components
                                            Component.element(
                                              tag: "span",
                                              classes:
                                                  "material-symbols-outlined text-[16px] text-outline opacity-0 scope-icon transition-opacity",
                                              children: [
                                                Component.text("check"),
                                              ],
                                            ),
                                            // ignore: prefer_html_components
                                            Component.element(
                                              tag: "span",
                                              children: [
                                                Component.text("Not Sure Yet"),
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
                                  classes: "flex flex-col gap-2",
                                  children: [
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "label",
                                      classes:
                                          "font-body-md text-body-md font-medium text-on-surface flex items-center justify-between",
                                      attributes: {
                                        "for": "contact-message",
                                      },
                                      children: [
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "span",
                                          children: [
                                            Component.text("Tell us about your project"),
                                          ],
                                        ),
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "span",
                                          classes:
                                              "font-label-mono-xs text-label-mono-xs text-outline tracking-wider uppercase",
                                          children: [
                                            Component.text("Required"),
                                          ],
                                        ),
                                      ],
                                    ),
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "textarea",
                                      id: "contact-message",
                                      classes:
                                          "w-full p-3.5 rounded-lg bg-surface-container-lowest border border-outline-variant/50 text-on-surface placeholder:text-outline/70 font-body-md text-body-md focus:outline-none focus:border-primary focus:ring-1 focus:ring-primary transition-all resize-y leading-relaxed",
                                      attributes: {
                                        "placeholder":
                                            "Describe your idea, timeline, or current challenges. Tell us what you're trying to build...",
                                        "required": "",
                                        "rows": "5",
                                      },
                                    ),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "div",
                                  classes: "pt-2 flex flex-col sm:flex-row items-center justify-between gap-4",
                                  children: [
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "button",
                                      id: "submit-btn",
                                      classes:
                                          "w-full sm:w-auto inline-flex items-center justify-center gap-2.5 h-12 px-8 rounded-lg bg-primary-container text-on-primary-container font-headline-sm text-headline-sm font-medium hover:bg-primary transition-all duration-200 shadow-[inset_0_1px_0_rgba(255,255,255,0.25)] hover:shadow-[0_0_20px_rgba(77,142,255,0.45)] cursor-pointer group",
                                      attributes: {
                                        "type": "submit",
                                      },
                                      children: [
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "span",
                                          children: [
                                            Component.text("Send Project Inquiry"),
                                          ],
                                        ),
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "span",
                                          classes:
                                              "material-symbols-outlined text-[18px] group-hover:translate-x-1 transition-transform",
                                          children: [
                                            Component.text("arrow_forward"),
                                          ],
                                        ),
                                      ],
                                    ),
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "div",
                                      classes:
                                          "flex items-center gap-2 text-on-surface-variant font-label-mono-xs text-label-mono-xs",
                                      children: [
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "span",
                                          classes: "material-symbols-outlined text-outline text-[16px]",
                                          children: [
                                            Component.text("lock"),
                                          ],
                                        ),
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "span",
                                          children: [
                                            Component.text("Your project details remain confidential"),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "div",
                                  id: "form-feedback",
                                  classes:
                                      "hidden p-4 rounded-lg bg-surface-container-high border border-secondary/40 text-on-surface flex items-start gap-3",
                                  children: [
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "span",
                                      classes: "material-symbols-outlined text-secondary text-[20px] mt-0.5",
                                      children: [
                                        Component.text("check_circle"),
                                      ],
                                    ),
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "div",
                                      classes: "text-body-sm font-body-sm",
                                      children: [
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "p",
                                          classes: "font-medium text-on-surface",
                                          children: [
                                            Component.text(" Inquiry dispatched to our lead engineering room. "),
                                          ],
                                        ),
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "p",
                                          classes: "text-on-surface-variant mt-0.5",
                                          children: [
                                            Component.text(
                                              " We will review your notes and reply directly to your work email. ",
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
                // ignore: prefer_html_components
                Component.element(
                  tag: "section",
                  classes: "w-full bg-surface-container-lowest/70 border-y border-outline-variant/30 py-20 relative",
                  children: [
                    // ignore: prefer_html_components
                    Component.element(
                      tag: "div",
                      classes: "max-w-7xl mx-auto px-6 sm:px-8",
                      children: [
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "div",
                          classes: "max-w-2xl mb-12",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "span",
                              classes:
                                  "font-label-mono text-label-mono text-secondary tracking-widest uppercase block mb-2",
                              children: [
                                Component.text("What Happens Next?"),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "h2",
                              classes: "font-headline-lg text-headline-lg text-on-surface font-semibold tracking-tight",
                              children: [
                                Component.text(" A Simple, Transparent Start. "),
                              ],
                            ),
                          ],
                        ),
                        // ignore: prefer_html_components
                        Component.element(
                          tag: "div",
                          classes: "grid grid-cols-1 md:grid-cols-3 gap-6 relative",
                          children: [
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes:
                                  "p-6 rounded-xl bg-surface-container/70 border border-outline-variant/30 relative flex flex-col justify-between hover:border-primary/40 transition-colors group",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "div",
                                  classes: "space-y-4",
                                  children: [
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "div",
                                      classes: "flex items-center justify-between",
                                      children: [
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "span",
                                          classes: "font-label-mono text-[20px] font-semibold text-primary",
                                          children: [
                                            Component.text("01"),
                                          ],
                                        ),
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "span",
                                          classes:
                                              "material-symbols-outlined text-outline group-hover:text-primary transition-colors text-[22px]",
                                          children: [
                                            Component.text("description"),
                                          ],
                                        ),
                                      ],
                                    ),
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "h3",
                                      classes: "font-headline-sm text-headline-sm text-on-surface font-medium",
                                      children: [
                                        Component.text(" Tell Us About Your Idea "),
                                      ],
                                    ),
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "p",
                                      classes: "font-body-sm text-body-sm text-on-surface-variant leading-relaxed",
                                      children: [
                                        Component.text(
                                          " Submit the inquiry form with an overview of what you want to build or improve. ",
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "div",
                                  classes:
                                      "mt-8 h-1 w-12 rounded-full bg-outline-variant/40 group-hover:bg-primary transition-colors",
                                ),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes:
                                  "p-6 rounded-xl bg-surface-container/70 border border-outline-variant/30 relative flex flex-col justify-between hover:border-secondary/40 transition-colors group",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "div",
                                  classes: "space-y-4",
                                  children: [
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "div",
                                      classes: "flex items-center justify-between",
                                      children: [
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "span",
                                          classes: "font-label-mono text-[20px] font-semibold text-secondary",
                                          children: [
                                            Component.text("02"),
                                          ],
                                        ),
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "span",
                                          classes:
                                              "material-symbols-outlined text-outline group-hover:text-secondary transition-colors text-[22px]",
                                          children: [
                                            Component.text("manage_search"),
                                          ],
                                        ),
                                      ],
                                    ),
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "h3",
                                      classes: "font-headline-sm text-headline-sm text-on-surface font-medium",
                                      children: [
                                        Component.text(" We'll Review Your Needs "),
                                      ],
                                    ),
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "p",
                                      classes: "font-body-sm text-body-sm text-on-surface-variant leading-relaxed",
                                      children: [
                                        Component.text(
                                          " A technical lead reviews your requirements, scope, and feasibility within our engineering team. ",
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "div",
                                  classes:
                                      "mt-8 h-1 w-12 rounded-full bg-outline-variant/40 group-hover:bg-secondary transition-colors",
                                ),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "div",
                              classes:
                                  "p-6 rounded-xl bg-surface-container/70 border border-outline-variant/30 relative flex flex-col justify-between hover:border-primary/40 transition-colors group",
                              children: [
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "div",
                                  classes: "space-y-4",
                                  children: [
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "div",
                                      classes: "flex items-center justify-between",
                                      children: [
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "span",
                                          classes: "font-label-mono text-[20px] font-semibold text-primary",
                                          children: [
                                            Component.text("03"),
                                          ],
                                        ),
                                        // ignore: prefer_html_components
                                        Component.element(
                                          tag: "span",
                                          classes:
                                              "material-symbols-outlined text-outline group-hover:text-primary transition-colors text-[22px]",
                                          children: [
                                            Component.text("forum"),
                                          ],
                                        ),
                                      ],
                                    ),
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "h3",
                                      classes: "font-headline-sm text-headline-sm text-on-surface font-medium",
                                      children: [
                                        Component.text(" Let's Talk About the Right Solution "),
                                      ],
                                    ),
                                    // ignore: prefer_html_components
                                    Component.element(
                                      tag: "p",
                                      classes: "font-body-sm text-body-sm text-on-surface-variant leading-relaxed",
                                      children: [
                                        Component.text(
                                          " We arrange an introductory technical discussion to map architecture, timelines, and pragmatic next steps. ",
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                // ignore: prefer_html_components
                                Component.element(
                                  tag: "div",
                                  classes:
                                      "mt-8 h-1 w-12 rounded-full bg-outline-variant/40 group-hover:bg-primary transition-colors",
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
  ]);
}
