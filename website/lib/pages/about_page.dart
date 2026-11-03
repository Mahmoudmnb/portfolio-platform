import 'package:jaspr/jaspr.dart';

class AboutPage extends StatelessComponent {
  const AboutPage();
  @override
  Component build(BuildContext context) {
    return .fragment([
      Document.html(attributes: const {'class': 'dark'}),
      Document.head(
        title: 'About | Brothers-Tech',
        meta: {
          'description': 'Meet the Brothers-Tech team and learn how we build practical, reliable digital products.',
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
                        "aria-current": "page",
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
                              classes:
                                  "relative p-6 sm:p-8 rounded-xl bg-surface-container-low shadow-sm flex flex-col",
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
                              classes:
                                  "relative p-6 sm:p-8 rounded-xl bg-surface-container-low shadow-sm flex flex-col",
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
                              classes:
                                  "relative p-6 sm:p-8 rounded-xl bg-surface-container-low shadow-sm flex flex-col",
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
                              classes:
                                  "relative p-6 sm:p-8 rounded-xl bg-surface-container-low shadow-sm flex flex-col",
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
                          classes:
                              "rounded-xl bg-surface-container-lowest p-8 sm:p-14 shadow-2xl relative overflow-hidden",
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
                                          classes:
                                              "font-body-md text-body-md text-on-surface-variant pt-2 leading-relaxed",
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
                                          classes:
                                              "font-body-md text-body-md text-on-surface-variant pt-2 leading-relaxed",
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
                              classes:
                                  "font-headline-lg text-headline-lg text-on-surface tracking-tight max-w-2xl mb-4",
                              children: [
                                Component.text(" Have an Idea? Let's Build It Together. "),
                              ],
                            ),
                            // ignore: prefer_html_components
                            Component.element(
                              tag: "p",
                              classes:
                                  "font-body-lg text-body-lg text-on-surface-variant max-w-xl mb-8 leading-relaxed",
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
      ]),
    ]);
  }
}
