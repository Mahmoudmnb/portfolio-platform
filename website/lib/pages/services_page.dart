import 'package:jaspr/jaspr.dart';

class ServicesPage extends StatelessComponent {
  const ServicesPage();
  @override
  Component build(BuildContext context) {
    return .fragment([
      Document.html(attributes: const {'class': 'dark'}),
      Document.head(
        title: 'Services | Brothers-Tech',
        meta: {
          'description': 'Explore Brothers-Tech mobile, web, desktop, cloud, and AI software development services.',
        },
      ),
      Document.body(attributes: {'class': "bg-surface font-body-md text-on-surface antialiased"}),

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
                          "px-4 py-2 transition-colors bg-surface-container-high text-primary font-medium rounded-lg",
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
                              classes:
                                  "pt-6 font-label-mono-xs text-label-mono-xs text-secondary flex items-center gap-1",
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
                              classes:
                                  "pt-6 font-label-mono-xs text-label-mono-xs text-secondary flex items-center gap-1",
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
                              classes:
                                  "pt-6 font-label-mono-xs text-label-mono-xs text-secondary flex items-center gap-1",
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
                              classes:
                                  "pt-6 font-label-mono-xs text-label-mono-xs text-secondary flex items-center gap-1",
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
                              classes:
                                  "pt-6 font-label-mono-xs text-label-mono-xs text-secondary flex items-center gap-1",
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
                              classes:
                                  "pt-6 font-label-mono-xs text-label-mono-xs text-secondary flex items-center gap-1",
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
                                      classes:
                                          "w-10 h-10 rounded-lg bg-secondary/10 flex items-center justify-center mb-4",
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
                          classes:
                              "font-headline-lg text-headline-lg text-on-surface tracking-tight max-w-2xl mb-space-md",
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
                          classes:
                              "font-label-mono text-label-mono text-on-surface tracking-wider uppercase font-semibold",
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
                          classes:
                              "font-label-mono text-label-mono text-on-surface tracking-wider uppercase font-semibold",
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
                          classes:
                              "font-label-mono text-label-mono text-on-surface tracking-wider uppercase font-semibold",
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
      ]),
    ]);
  }
}
