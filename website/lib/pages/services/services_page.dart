import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../core/components/app_footer.dart';
import '../../core/components/app_header.dart';

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
        AppHeader(
          tabs: [
            (name: "Home", url: "/", isSelected: false),
            (name: "Services", url: "/services", isSelected: true),
            (name: "Projects", url: "/projects", isSelected: false),
            (name: "About", url: "/about", isSelected: false),
            (name: "Contact", url: "/contact", isSelected: false),
          ],
        ),
        main_(
          classes: "w-full pt-20 bg-surface min-h-[calc(100vh-20rem)]",
          [
            div(
              classes: "flex flex-col w-full",
              [
                section(
                  classes: "relative w-full overflow-hidden px-6 lg:px-12 py-16 lg:py-24",
                  [
                    div(
                      classes:
                          "absolute -top-32 left-1/2 -translate-x-1/2 w-[720px] h-[360px] bg-gradient-to-b from-primary/15 via-secondary/5 to-transparent blur-3xl pointer-events-none -z-10",
                      [],
                    ),
                    div(
                      classes: "max-w-6xl mx-auto flex flex-col items-center text-center",
                      [
                        div(
                          classes:
                              "inline-flex items-center gap-space-sm px-3.5 py-1 rounded-full bg-surface-container-high shadow-sm mb-space-lg",
                          [
                            span(
                              classes: "relative flex h-2 w-2",
                              [
                                span(
                                  classes:
                                      "animate-ping absolute inline-flex h-full w-full rounded-full bg-secondary opacity-75",
                                  [],
                                ),
                                span(classes: "relative inline-flex rounded-full h-2 w-2 bg-secondary", []),
                              ],
                            ),
                            span(
                              classes:
                                  "font-label-mono text-label-mono uppercase tracking-widest text-secondary font-medium",
                              [
                                .text("Our Services"),
                              ],
                            ),
                          ],
                        ),
                        h1(
                          classes:
                              "font-display-hero text-display-hero tracking-tight text-on-surface max-w-4xl mb-space-md",
                          [
                            .text(" From Idea to "),
                            span(
                              classes:
                                  "text-transparent bg-clip-text bg-gradient-to-r from-primary via-secondary to-secondary-fixed",
                              [
                                .text("Working Software."),
                              ],
                            ),
                          ],
                        ),
                        p(
                          classes:
                              "font-body-lg text-body-lg text-on-surface-variant max-w-2xl leading-relaxed mb-space-xl",
                          [
                            .text(
                              " Brothers-Tech designs and develops mobile, web, desktop, and connected software solutions built around real business needs. ",
                            ),
                          ],
                        ),
                        div(
                          classes: "w-full max-w-4xl p-1 rounded-xl bg-surface-container-low shadow-md",
                          [
                            div(
                              classes:
                                  "px-6 py-3 rounded-lg bg-surface-container flex flex-wrap items-center justify-between gap-y-3 gap-x-6 text-on-surface-variant font-label-mono text-label-mono",
                              [
                                div(
                                  classes: "flex items-center gap-space-xs",
                                  [
                                    span(classes: "w-1.5 h-1.5 rounded-full bg-secondary", []),
                                    span(
                                      classes: "text-on-surface",
                                      [
                                        .text("5 Core Practices"),
                                      ],
                                    ),
                                  ],
                                ),
                                span(
                                  classes: "hidden sm:inline text-outline-variant font-mono",
                                  [
                                    .text("•"),
                                  ],
                                ),
                                div(
                                  classes: "flex items-center gap-space-xs",
                                  [
                                    span(classes: "w-1.5 h-1.5 rounded-full bg-secondary", []),
                                    span(
                                      classes: "text-on-surface",
                                      [
                                        .text("Multi-Platform Architecture"),
                                      ],
                                    ),
                                  ],
                                ),
                                span(
                                  classes: "hidden sm:inline text-outline-variant font-mono",
                                  [
                                    .text("•"),
                                  ],
                                ),
                                div(
                                  classes: "flex items-center gap-space-xs",
                                  [
                                    span(classes: "w-1.5 h-1.5 rounded-full bg-secondary", []),
                                    span(
                                      classes: "text-on-surface",
                                      [
                                        .text("Production Grade Systems"),
                                      ],
                                    ),
                                  ],
                                ),
                                span(
                                  classes: "hidden sm:inline text-outline-variant font-mono",
                                  [
                                    .text("•"),
                                  ],
                                ),
                                div(
                                  classes: "flex items-center gap-space-xs",
                                  [
                                    span(classes: "w-1.5 h-1.5 rounded-full bg-secondary", []),
                                    span(
                                      classes: "text-on-surface",
                                      [
                                        .text("Zero Vendor Lock-in"),
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
                  classes: "w-full px-6 lg:px-12 py-12 flex flex-col gap-24 lg:gap-32 max-w-7xl mx-auto",
                  [
                    div(
                      classes: "grid grid-cols-1 lg:grid-cols-12 gap-12 lg:gap-16 items-center",
                      [
                        div(
                          classes: "lg:col-span-6 flex flex-col items-start",
                          [
                            div(
                              classes:
                                  "inline-flex items-center px-3 py-1 rounded-md bg-surface-container-high text-secondary font-label-mono-xs text-label-mono-xs uppercase tracking-wider mb-space-md",
                              [
                                .text(" 01 • Mobile Applications "),
                              ],
                            ),
                            h2(
                              classes:
                                  "font-headline-lg text-headline-lg text-on-surface tracking-tight leading-tight mb-space-md",
                              [
                                .text(" Mobile Applications "),
                              ],
                            ),
                            p(
                              classes: "font-body-lg text-body-lg text-on-surface-variant leading-relaxed mb-space-lg",
                              [
                                .text(
                                  " Reliable Android and iOS applications designed around your users and business goals. We handle the full journey from planning and design to store release and ongoing improvements. ",
                                ),
                              ],
                            ),
                          ],
                        ),
                        div(
                          classes: "lg:col-span-6 relative w-full flex items-center justify-center",
                          [
                            img(
                              classes: "block w-full max-w-lg h-auto rounded-2xl shadow-2xl",

                              src: "assets/images/all_products.png",
                              alt: "Brothers-Tech mobile application portfolio",
                              loading: .lazy,
                            ),
                          ],
                        ),
                      ],
                    ),
                    div(
                      classes: "grid grid-cols-1 lg:grid-cols-12 gap-12 lg:gap-16 items-center",
                      [
                        div(
                          classes: "order-2 lg:order-1 lg:col-span-6 relative w-full flex items-center justify-center",
                          [
                            img(
                              classes: "block w-full max-w-lg h-auto rounded-2xl shadow-2xl",
                              src: "assets/images/drisavo/drisavo-website.png",
                              alt: "Drisavo web booking platform",
                              loading: .lazy,
                            ),
                          ],
                        ),
                        div(
                          classes: "order-1 lg:order-2 lg:col-span-6 flex flex-col items-start",
                          [
                            div(
                              classes:
                                  "inline-flex items-center px-3 py-1 rounded-md bg-surface-container-high text-secondary font-label-mono-xs text-label-mono-xs uppercase tracking-wider mb-space-md",
                              [
                                .text(" 02 • Web Platforms "),
                              ],
                            ),
                            h2(
                              classes:
                                  "font-headline-lg text-headline-lg text-on-surface tracking-tight leading-tight mb-space-md",
                              [
                                .text(" Web Platforms, Applications & High-Density Dashboards "),
                              ],
                            ),
                            p(
                              classes: "font-body-lg text-body-lg text-on-surface-variant leading-relaxed mb-space-lg",
                              [
                                .text(
                                  " Professional websites, customer portals, booking systems, dashboards, and business tools designed to be fast, accessible, easy to use, and ready to grow with your business. ",
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    div(
                      classes: "grid grid-cols-1 lg:grid-cols-12 gap-12 lg:gap-16 items-center",
                      [
                        div(
                          classes: "lg:col-span-6 flex flex-col items-start",
                          [
                            div(
                              classes:
                                  "inline-flex items-center px-3 py-1 rounded-md bg-surface-container-high text-secondary font-label-mono-xs text-label-mono-xs uppercase tracking-wider mb-space-md",
                              [
                                .text(" 03 • Desktop Applications "),
                              ],
                            ),
                            h2(
                              classes:
                                  "font-headline-lg text-headline-lg text-on-surface tracking-tight leading-tight mb-space-md",
                              [
                                .text(" Desktop Software & Operations Workstations "),
                              ],
                            ),
                            p(
                              classes: "font-body-lg text-body-lg text-on-surface-variant leading-relaxed mb-space-lg",
                              [
                                .text(
                                  " Reliable desktop software designed to simplify daily operations, organize complex workflows, manage important data, and help teams work efficiently—even when an internet connection is unavailable. ",
                                ),
                              ],
                            ),
                          ],
                        ),
                        div(
                          classes: "lg:col-span-6 relative w-full flex items-center justify-center",
                          [
                            img(
                              classes: "block w-full max-w-lg h-auto rounded-2xl shadow-2xl",
                              src: "assets/images/desktop-apps.png",
                              alt: "Brothers-Tech desktop software portfolio",
                              loading: .lazy,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                section(
                  classes: "w-full px-6 lg:px-12 py-20 max-w-7xl mx-auto",
                  [
                    div(
                      classes: "flex flex-col md:flex-row md:items-end justify-between mb-16 gap-6",
                      [
                        div(
                          [
                            div(
                              classes:
                                  "inline-flex items-center px-3 py-1 rounded-md bg-surface-container-high text-secondary font-label-mono-xs text-label-mono-xs uppercase tracking-wider mb-space-sm",
                              [
                                .text(" Engineering Delivery Framework "),
                              ],
                            ),
                            h2(
                              classes: "font-headline-lg text-headline-lg text-on-surface tracking-tight",
                              [
                                .text(" How We Build. "),
                              ],
                            ),
                          ],
                        ),
                        p(
                          classes: "font-body-lg text-body-lg text-on-surface-variant max-w-md",
                          [
                            .text(
                              " A disciplined, transparent delivery framework from initial whiteboard to continuous production support. ",
                            ),
                          ],
                        ),
                      ],
                    ),
                    div(
                      classes: "grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6",
                      [
                        div(
                          classes:
                              "p-6 rounded-2xl bg-surface-container shadow-md hover:bg-surface-container-high transition-colors flex flex-col justify-between h-full",
                          [
                            div(
                              [
                                div(
                                  classes: "flex items-center justify-between mb-4",
                                  [
                                    span(
                                      classes: "font-label-mono text-label-mono text-secondary font-bold",
                                      [
                                        .text("01 // DISCOVERY"),
                                      ],
                                    ),
                                    span(
                                      classes: "material-symbols-outlined text-on-surface-variant text-[20px]",
                                      [
                                        .text("architecture"),
                                      ],
                                    ),
                                  ],
                                ),
                                h3(
                                  classes: "font-headline-sm text-headline-sm text-on-surface font-semibold mb-2",
                                  [
                                    .text(" Plan "),
                                  ],
                                ),
                                p(
                                  classes: "font-body-md text-body-md text-on-surface-variant leading-relaxed",
                                  [
                                    .text(
                                      " Requirements discovery, technical architecture blueprint, database schema planning, API specs, and a milestone-driven roadmap. ",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            div(
                              classes:
                                  "pt-6 font-label-mono-xs text-label-mono-xs text-secondary flex items-center gap-1",
                              [
                                span(
                                  [
                                    .text("Deliverable: Technical RFC & Spec"),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        div(
                          classes:
                              "p-6 rounded-2xl bg-surface-container shadow-md hover:bg-surface-container-high transition-colors flex flex-col justify-between h-full",
                          [
                            div(
                              [
                                div(
                                  classes: "flex items-center justify-between mb-4",
                                  [
                                    span(
                                      classes: "font-label-mono text-label-mono text-secondary font-bold",
                                      [
                                        .text("02 // PROTOTYPING"),
                                      ],
                                    ),
                                    span(
                                      classes: "material-symbols-outlined text-on-surface-variant text-[20px]",
                                      [
                                        .text("palette"),
                                      ],
                                    ),
                                  ],
                                ),
                                h3(
                                  classes: "font-headline-sm text-headline-sm text-on-surface font-semibold mb-2",
                                  [
                                    .text(" Design "),
                                  ],
                                ),
                                p(
                                  classes: "font-body-md text-body-md text-on-surface-variant leading-relaxed",
                                  [
                                    .text(
                                      " User journey mapping, wireframing, high-fidelity UI design, tokenized design systems, and interactive clickable prototypes in Figma. ",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            div(
                              classes:
                                  "pt-6 font-label-mono-xs text-label-mono-xs text-secondary flex items-center gap-1",
                              [
                                span(
                                  [
                                    .text("Deliverable: Design Tokens & Prototypes"),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        div(
                          classes:
                              "p-6 rounded-2xl bg-surface-container shadow-md hover:bg-surface-container-high transition-colors flex flex-col justify-between h-full",
                          [
                            div(
                              [
                                div(
                                  classes: "flex items-center justify-between mb-4",
                                  [
                                    span(
                                      classes: "font-label-mono text-label-mono text-secondary font-bold",
                                      [
                                        .text("03 // EXECUTION"),
                                      ],
                                    ),
                                    span(
                                      classes: "material-symbols-outlined text-on-surface-variant text-[20px]",
                                      [
                                        .text("terminal"),
                                      ],
                                    ),
                                  ],
                                ),
                                h3(
                                  classes: "font-headline-sm text-headline-sm text-on-surface font-semibold mb-2",
                                  [
                                    .text(" Develop "),
                                  ],
                                ),
                                p(
                                  classes: "font-body-md text-body-md text-on-surface-variant leading-relaxed",
                                  [
                                    .text(
                                      " Full-stack engineering, strict static typing, clean modular architectural patterns, local unit tests, and continuous pull-request reviews. ",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            div(
                              classes:
                                  "pt-6 font-label-mono-xs text-label-mono-xs text-secondary flex items-center gap-1",
                              [
                                span(
                                  [
                                    .text("Deliverable: Staging Deployment Builds"),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        div(
                          classes:
                              "p-6 rounded-2xl bg-surface-container shadow-md hover:bg-surface-container-high transition-colors flex flex-col justify-between h-full",
                          [
                            div(
                              [
                                div(
                                  classes: "flex items-center justify-between mb-4",
                                  [
                                    span(
                                      classes: "font-label-mono text-label-mono text-secondary font-bold",
                                      [
                                        .text("04 // VERIFICATION"),
                                      ],
                                    ),
                                    span(
                                      classes: "material-symbols-outlined text-on-surface-variant text-[20px]",
                                      [
                                        .text("checklist"),
                                      ],
                                    ),
                                  ],
                                ),
                                h3(
                                  classes: "font-headline-sm text-headline-sm text-on-surface font-semibold mb-2",
                                  [
                                    .text(" Test "),
                                  ],
                                ),
                                p(
                                  classes: "font-body-md text-body-md text-on-surface-variant leading-relaxed",
                                  [
                                    .text(
                                      " Automated regression suites, cross-browser/device testing, penetration audits, load testing, and edge case resilience verification. ",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            div(
                              classes:
                                  "pt-6 font-label-mono-xs text-label-mono-xs text-secondary flex items-center gap-1",
                              [
                                span(
                                  [
                                    .text("Deliverable: QA & Security Audit Report"),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        div(
                          classes:
                              "p-6 rounded-2xl bg-surface-container shadow-md hover:bg-surface-container-high transition-colors flex flex-col justify-between h-full",
                          [
                            div(
                              [
                                div(
                                  classes: "flex items-center justify-between mb-4",
                                  [
                                    span(
                                      classes: "font-label-mono text-label-mono text-secondary font-bold",
                                      [
                                        .text("05 // ROLLOUT"),
                                      ],
                                    ),
                                    span(
                                      classes: "material-symbols-outlined text-on-surface-variant text-[20px]",
                                      [
                                        .text("rocket_launch"),
                                      ],
                                    ),
                                  ],
                                ),
                                h3(
                                  classes: "font-headline-sm text-headline-sm text-on-surface font-semibold mb-2",
                                  [
                                    .text(" Deploy "),
                                  ],
                                ),
                                p(
                                  classes: "font-body-md text-body-md text-on-surface-variant leading-relaxed",
                                  [
                                    .text(
                                      " Automated CI/CD orchestration, zero-downtime containerized infrastructure, DNS provisioning, and App Store / Google Play submissions. ",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            div(
                              classes:
                                  "pt-6 font-label-mono-xs text-label-mono-xs text-secondary flex items-center gap-1",
                              [
                                span(
                                  [
                                    .text("Deliverable: Production Release Verified"),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        div(
                          classes:
                              "p-6 rounded-2xl bg-surface-container shadow-md hover:bg-surface-container-high transition-colors flex flex-col justify-between h-full",
                          [
                            div(
                              [
                                div(
                                  classes: "flex items-center justify-between mb-4",
                                  [
                                    span(
                                      classes: "font-label-mono text-label-mono text-secondary font-bold",
                                      [
                                        .text("06 // MAINTENANCE"),
                                      ],
                                    ),
                                    span(
                                      classes: "material-symbols-outlined text-on-surface-variant text-[20px]",
                                      [
                                        .text("health_and_safety"),
                                      ],
                                    ),
                                  ],
                                ),
                                h3(
                                  classes: "font-headline-sm text-headline-sm text-on-surface font-semibold mb-2",
                                  [
                                    .text(" Support "),
                                  ],
                                ),
                                p(
                                  classes: "font-body-md text-body-md text-on-surface-variant leading-relaxed",
                                  [
                                    .text(
                                      " Continuous real-time telemetry monitoring, error tracking, infrastructure maintenance, security patching, and ongoing feature iteration. ",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            div(
                              classes:
                                  "pt-6 font-label-mono-xs text-label-mono-xs text-secondary flex items-center gap-1",
                              [
                                span(
                                  [
                                    .text("Deliverable: 24/7 SLA & Telemetry Logs"),
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
                  classes: "w-full px-6 lg:px-12 py-20 bg-surface-container-lowest",
                  [
                    div(
                      classes: "max-w-7xl mx-auto flex flex-col items-center",
                      [
                        div(
                          classes: "text-center max-w-3xl mb-16",
                          [
                            div(
                              classes:
                                  "inline-flex items-center px-3.5 py-1 rounded-full bg-surface-container text-secondary font-label-mono-xs text-label-mono-xs uppercase tracking-widest font-semibold mb-space-sm",
                              [
                                .text(" Product Taxonomy "),
                              ],
                            ),
                            h2(
                              classes:
                                  "font-headline-lg text-headline-lg text-on-surface tracking-tight leading-tight mb-space-sm",
                              [
                                .text(" Software Solutions Tailored to Your Industry. "),
                              ],
                            ),
                            p(
                              classes: "font-body-lg text-body-lg text-on-surface-variant leading-relaxed",
                              [
                                .text(
                                  " From complex enterprise workflow tools to customer-facing platforms, we engineer purpose-built systems. ",
                                ),
                              ],
                            ),
                          ],
                        ),
                        div(
                          classes: "grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6 w-full",
                          [
                            div(
                              classes:
                                  "p-6 rounded-2xl bg-surface-container flex flex-col justify-between shadow-sm hover:bg-surface-container-high transition-colors",
                              [
                                div(
                                  [
                                    div(
                                      classes:
                                          "w-10 h-10 rounded-lg bg-surface-container-highest flex items-center justify-center mb-4",
                                      [
                                        span(
                                          classes: "material-symbols-outlined text-secondary text-[22px]",
                                          [
                                            .text("corporate_fare"),
                                          ],
                                        ),
                                      ],
                                    ),
                                    h3(
                                      classes: "font-headline-sm text-headline-sm text-on-surface font-semibold mb-2",
                                      [
                                        .text(" Business Applications "),
                                      ],
                                    ),
                                    p(
                                      classes: "font-body-md text-body-md text-on-surface-variant",
                                      [
                                        .text(
                                          " Internal operations tools, automated resource planning, and custom ERP systems engineered for high-concurrency business data. ",
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                div(
                                  classes:
                                      "mt-4 pt-3 flex items-center gap-2 text-on-surface-variant font-label-mono-xs text-label-mono-xs",
                                  [
                                    span(classes: "w-1.5 h-1.5 rounded-full bg-secondary", []),
                                    span(
                                      [
                                        .text("Enterprise Ops • ERP"),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            div(
                              classes:
                                  "p-6 rounded-2xl bg-surface-container flex flex-col justify-between shadow-sm hover:bg-surface-container-high transition-colors",
                              [
                                div(
                                  [
                                    div(
                                      classes:
                                          "w-10 h-10 rounded-lg bg-surface-container-highest flex items-center justify-center mb-4",
                                      [
                                        span(
                                          classes: "material-symbols-outlined text-secondary text-[22px]",
                                          [
                                            .text("school"),
                                          ],
                                        ),
                                      ],
                                    ),
                                    h3(
                                      classes: "font-headline-sm text-headline-sm text-on-surface font-semibold mb-2",
                                      [
                                        .text(" Educational Platforms "),
                                      ],
                                    ),
                                    p(
                                      classes: "font-body-md text-body-md text-on-surface-variant",
                                      [
                                        .text(
                                          " Interactive Learning Management Systems (LMS), real-time virtual classroom software, student portals, and grading pipelines. ",
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                div(
                                  classes:
                                      "mt-4 pt-3 flex items-center gap-2 text-on-surface-variant font-label-mono-xs text-label-mono-xs",
                                  [
                                    span(classes: "w-1.5 h-1.5 rounded-full bg-secondary", []),
                                    span(
                                      [
                                        .text("LMS • Interactive Portals"),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            div(
                              classes:
                                  "p-6 rounded-2xl bg-surface-container flex flex-col justify-between shadow-sm hover:bg-surface-container-high transition-colors",
                              [
                                div(
                                  [
                                    div(
                                      classes:
                                          "w-10 h-10 rounded-lg bg-surface-container-highest flex items-center justify-center mb-4",
                                      [
                                        span(
                                          classes: "material-symbols-outlined text-secondary text-[22px]",
                                          [
                                            .text("inventory_2"),
                                          ],
                                        ),
                                      ],
                                    ),
                                    h3(
                                      classes: "font-headline-sm text-headline-sm text-on-surface font-semibold mb-2",
                                      [
                                        .text(" Management Systems "),
                                      ],
                                    ),
                                    p(
                                      classes: "font-body-md text-body-md text-on-surface-variant",
                                      [
                                        .text(
                                          " High-accuracy inventory tracking, fleet dispatch management, supply-chain dashboards, and real-time asset control centers. ",
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                div(
                                  classes:
                                      "mt-4 pt-3 flex items-center gap-2 text-on-surface-variant font-label-mono-xs text-label-mono-xs",
                                  [
                                    span(classes: "w-1.5 h-1.5 rounded-full bg-secondary", []),
                                    span(
                                      [
                                        .text("Fleet • Logistics • Supply"),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            div(
                              classes:
                                  "p-6 rounded-2xl bg-surface-container flex flex-col justify-between shadow-sm hover:bg-surface-container-high transition-colors",
                              [
                                div(
                                  [
                                    div(
                                      classes:
                                          "w-10 h-10 rounded-lg bg-surface-container-highest flex items-center justify-center mb-4",
                                      [
                                        span(
                                          classes: "material-symbols-outlined text-secondary text-[22px]",
                                          [
                                            .text("shopping_cart"),
                                          ],
                                        ),
                                      ],
                                    ),
                                    h3(
                                      classes: "font-headline-sm text-headline-sm text-on-surface font-semibold mb-2",
                                      [
                                        .text(" E-commerce Solutions "),
                                      ],
                                    ),
                                    p(
                                      classes: "font-body-md text-body-md text-on-surface-variant",
                                      [
                                        .text(
                                          " High-conversion checkout flows, custom multi-vendor marketplaces, dynamic catalog indexing, and low-latency inventory syncing. ",
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                div(
                                  classes:
                                      "mt-4 pt-3 flex items-center gap-2 text-on-surface-variant font-label-mono-xs text-label-mono-xs",
                                  [
                                    span(classes: "w-1.5 h-1.5 rounded-full bg-secondary", []),
                                    span(
                                      [
                                        .text("Marketplaces • Checkout"),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            div(
                              classes:
                                  "p-6 rounded-2xl bg-surface-container flex flex-col justify-between shadow-sm hover:bg-surface-container-high transition-colors",
                              [
                                div(
                                  [
                                    div(
                                      classes:
                                          "w-10 h-10 rounded-lg bg-surface-container-highest flex items-center justify-center mb-4",
                                      [
                                        span(
                                          classes: "material-symbols-outlined text-secondary text-[22px]",
                                          [
                                            .text("monitoring"),
                                          ],
                                        ),
                                      ],
                                    ),
                                    h3(
                                      classes: "font-headline-sm text-headline-sm text-on-surface font-semibold mb-2",
                                      [
                                        .text(" Dashboards & Analytics "),
                                      ],
                                    ),
                                    p(
                                      classes: "font-body-md text-body-md text-on-surface-variant",
                                      [
                                        .text(
                                          " High-density telemetry dashboards, real-time streaming data visualizers, executive KPI portals, and custom report builders. ",
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                div(
                                  classes:
                                      "mt-4 pt-3 flex items-center gap-2 text-on-surface-variant font-label-mono-xs text-label-mono-xs",
                                  [
                                    span(classes: "w-1.5 h-1.5 rounded-full bg-secondary", []),
                                    span(
                                      [
                                        .text("Telemetry • Real-Time KPIs"),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            div(
                              classes:
                                  "p-6 rounded-2xl bg-surface-container flex flex-col justify-between shadow-sm hover:bg-surface-container-high transition-colors",
                              [
                                div(
                                  [
                                    div(
                                      classes:
                                          "w-10 h-10 rounded-lg bg-surface-container-highest flex items-center justify-center mb-4",
                                      [
                                        span(
                                          classes: "material-symbols-outlined text-secondary text-[22px]",
                                          [
                                            .text("admin_panel_settings"),
                                          ],
                                        ),
                                      ],
                                    ),
                                    h3(
                                      classes: "font-headline-sm text-headline-sm text-on-surface font-semibold mb-2",
                                      [
                                        .text(" Admin Panels "),
                                      ],
                                    ),
                                    p(
                                      classes: "font-body-md text-body-md text-on-surface-variant",
                                      [
                                        .text(
                                          " Granular role-based access control portals, immutable audit logging, team administration consoles, and support tooling. ",
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                div(
                                  classes:
                                      "mt-4 pt-3 flex items-center gap-2 text-on-surface-variant font-label-mono-xs text-label-mono-xs",
                                  [
                                    span(classes: "w-1.5 h-1.5 rounded-full bg-secondary", []),
                                    span(
                                      [
                                        .text("RBAC • Audit Logs • Tools"),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            div(
                              classes:
                                  "p-6 rounded-2xl bg-surface-container flex flex-col justify-between shadow-sm hover:bg-surface-container-high transition-colors md:col-span-2 xl:col-span-2",
                              [
                                div(
                                  [
                                    div(
                                      classes:
                                          "w-10 h-10 rounded-lg bg-secondary/10 flex items-center justify-center mb-4",
                                      [
                                        span(
                                          classes: "material-symbols-outlined text-secondary text-[22px]",
                                          [
                                            .text("extension"),
                                          ],
                                        ),
                                      ],
                                    ),
                                    h3(
                                      classes: "font-headline-sm text-headline-sm text-on-surface font-semibold mb-2",
                                      [
                                        .text(" Custom Software & Bespoke Engines "),
                                      ],
                                    ),
                                    p(
                                      classes: "font-body-md text-body-md text-on-surface-variant max-w-xl",
                                      [
                                        .text(
                                          " Specialized proprietary algorithms, offline native automation workstations, local hardware-interfacing software, and mission-critical enterprise utilities built strictly to your specifications. ",
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                div(
                                  classes:
                                      "mt-4 pt-3 flex items-center gap-2 text-secondary font-label-mono-xs text-label-mono-xs",
                                  [
                                    span(classes: "w-1.5 h-1.5 rounded-full bg-secondary", []),
                                    span(
                                      [
                                        .text("Hardware Interfacing • Bespoke Engineering • Custom Protocols"),
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
                  classes: "w-full px-6 lg:px-12 py-20 lg:py-28 relative",
                  [
                    div(
                      classes:
                          "max-w-5xl mx-auto rounded-3xl bg-surface-container p-8 lg:p-16 relative overflow-hidden shadow-2xl flex flex-col items-center text-center",
                      [
                        div(
                          classes:
                              "absolute -top-24 left-1/2 -translate-x-1/2 w-96 h-96 bg-primary/20 rounded-full blur-3xl pointer-events-none",
                          [],
                        ),
                        div(
                          classes:
                              "inline-flex items-center gap-space-xs px-3 py-1 rounded-full bg-surface-container-high text-secondary font-label-mono-xs text-label-mono-xs uppercase tracking-widest font-semibold mb-space-md",
                          [
                            span(
                              [
                                .text("GET IN TOUCH"),
                              ],
                            ),
                          ],
                        ),
                        h2(
                          classes:
                              "font-headline-lg text-headline-lg text-on-surface tracking-tight max-w-2xl mb-space-md",
                          [
                            .text(" Have an Idea? Let's Build It Together. "),
                          ],
                        ),
                        p(
                          classes: "font-body-lg text-body-lg text-on-surface-variant max-w-xl mb-space-xl",
                          [
                            .text(
                              " Whether you're starting something new or improving an existing product, let's turn your idea into reliable, production-ready software. ",
                            ),
                          ],
                        ),
                        a(
                          classes:
                              "inline-flex items-center justify-center h-12 px-6 rounded-xl bg-primary text-on-primary font-headline-sm text-body-md hover:bg-primary-container hover:text-on-primary-container transition-all shadow-[0_0_24px_rgba(77,142,255,0.3)] hover:shadow-[0_0_32px_rgba(77,142,255,0.5)] mb-space-lg",
                          href: "/contact",
                          attributes: {
                            "data-path": "contact",
                          },
                          [
                            .text(" Tell Us About Your Project → "),
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
