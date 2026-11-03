import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../core/components/app_footer.dart';
import '../../core/components/app_header.dart';

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
        AppHeader(
          tabs: [
            (name: "Home", url: "/", isSelected: false),
            (name: "Services", url: "/services", isSelected: false),
            (name: "Projects", url: "/projects", isSelected: false),
            (name: "About", url: "/about", isSelected: true),
            (name: "Contact", url: "/contact", isSelected: false),
          ],
        ),
        main_(
          classes: "w-full pt-20 bg-background flex-1",
          [
            div(
              classes: "flex flex-col w-full",
              [
                div(
                  classes: "relative w-full overflow-hidden",
                  [
                    div(
                      classes:
                          "pointer-events-none absolute -top-40 left-1/2 -translate-x-1/2 w-[720px] h-[360px] bg-primary/10 rounded-full blur-[140px] opacity-70",
                      [],
                    ),
                    div(
                      classes:
                          "pointer-events-none absolute top-[30%] -right-40 w-[480px] h-[300px] bg-secondary/10 rounded-full blur-[120px] opacity-60",
                      [],
                    ),
                    div(
                      classes:
                          "pointer-events-none absolute top-[70%] -left-32 w-[500px] h-[300px] bg-primary-container/10 rounded-full blur-[130px] opacity-50",
                      [],
                    ),
                    section(
                      classes: "relative w-full max-w-7xl mx-auto px-6 sm:px-8 pt-16 sm:pt-24 pb-20 sm:pb-28",
                      [
                        div(
                          classes: "max-w-4xl flex flex-col items-start space-y-6 sm:space-y-8",
                          [
                            div(
                              classes:
                                  "inline-flex items-center gap-2.5 px-3 py-1 rounded-full bg-surface-container-low shadow-sm",
                              [
                                span(
                                  classes:
                                      "inline-block w-2 h-2 rounded-full bg-secondary shadow-[0_0_8px_#4cd7f6] animate-pulse",
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
                                  classes:
                                      "block bg-gradient-to-r from-primary via-secondary to-primary bg-clip-text text-transparent",
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
                              classes:
                                  "pt-4 flex flex-wrap items-center gap-3 sm:gap-4 font-label-mono text-label-mono text-tertiary",
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
                    ),
                    section(
                      classes: "relative w-full max-w-7xl mx-auto px-6 sm:px-8 py-16 sm:py-24",
                      [
                        div(
                          classes: "max-w-3xl mb-14 sm:mb-16",
                          [
                            div(
                              classes:
                                  "flex items-center gap-2 font-label-mono text-label-mono text-secondary uppercase tracking-widest mb-3",
                              [
                                span(
                                  [
                                    .text("01"),
                                  ],
                                ),
                                span(classes: "w-8 h-[1px] bg-secondary/40", []),
                                span(
                                  [
                                    .text("Core Principles"),
                                  ],
                                ),
                              ],
                            ),
                            h2(
                              classes: "font-headline-lg text-headline-lg text-on-surface tracking-tight",
                              [
                                .text(" What defines Brothers-Tech. "),
                              ],
                            ),
                            p(
                              classes: "font-body-lg text-body-lg text-on-surface-variant mt-3",
                              [
                                .text(
                                  " Engineering guidelines that dictate how we write every file, architect every database, and ship every release. ",
                                ),
                              ],
                            ),
                          ],
                        ),
                        div(
                          classes: "grid grid-cols-1 md:grid-cols-2 gap-6 lg:gap-8",
                          [
                            div(
                              classes:
                                  "p-8 sm:p-10 rounded-xl bg-surface-container-low shadow-sm flex flex-col justify-between hover:bg-surface-container transition-colors duration-300",
                              [
                                div(
                                  [
                                    div(
                                      classes:
                                          "w-12 h-12 rounded-lg bg-surface-container-highest flex items-center justify-center mb-6",
                                      [
                                        span(
                                          classes: "material-symbols-outlined text-secondary text-[24px]",
                                          [
                                            .text("view_in_ar"),
                                          ],
                                        ),
                                      ],
                                    ),
                                    h3(
                                      classes: "font-headline-md text-headline-md text-on-surface mb-3",
                                      [
                                        .text(" Product First "),
                                      ],
                                    ),
                                    p(
                                      classes: "font-body-md text-body-md text-on-surface-variant leading-relaxed",
                                      [
                                        .text(
                                          " We don't just write code to ticket specs; we think about user adoption, business viability, and real-world utility before touching a keyboard. A technically flawless feature is worthless if it creates user confusion. ",
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                div(
                                  classes: "mt-8 pt-4 font-label-mono text-label-mono-xs text-tertiary",
                                  [
                                    .text(" FOCUS // OUTCOME OVER CEREMONY "),
                                  ],
                                ),
                              ],
                            ),
                            div(
                              classes:
                                  "p-8 sm:p-10 rounded-xl bg-surface-container-low shadow-sm flex flex-col justify-between hover:bg-surface-container transition-colors duration-300",
                              [
                                div(
                                  [
                                    div(
                                      classes:
                                          "w-12 h-12 rounded-lg bg-surface-container-highest flex items-center justify-center mb-6",
                                      [
                                        span(
                                          classes: "material-symbols-outlined text-primary text-[24px]",
                                          [
                                            .text("signal_cellular_connected_no_internet_4_bar"),
                                          ],
                                        ),
                                      ],
                                    ),
                                    h3(
                                      classes: "font-headline-md text-headline-md text-on-surface mb-3",
                                      [
                                        .text(" Built for Real Use "),
                                      ],
                                    ),
                                    p(
                                      classes: "font-body-md text-body-md text-on-surface-variant leading-relaxed",
                                      [
                                        .text(
                                          " Software needs to work under edge conditions, slow connections, and messy human workflows—not just in clean local demos. We test for battery drain, unstable networks, and unexpected inputs from day one. ",
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                div(
                                  classes: "mt-8 pt-4 font-label-mono text-label-mono-xs text-tertiary",
                                  [
                                    .text(" RESILIENCE // ZERO CHEAP DEMOS "),
                                  ],
                                ),
                              ],
                            ),
                            div(
                              classes:
                                  "p-8 sm:p-10 rounded-xl bg-surface-container-low shadow-sm flex flex-col justify-between hover:bg-surface-container transition-colors duration-300",
                              [
                                div(
                                  [
                                    div(
                                      classes:
                                          "w-12 h-12 rounded-lg bg-surface-container-highest flex items-center justify-center mb-6",
                                      [
                                        span(
                                          classes: "material-symbols-outlined text-secondary text-[24px]",
                                          [
                                            .text("code_blocks"),
                                          ],
                                        ),
                                      ],
                                    ),
                                    h3(
                                      classes: "font-headline-md text-headline-md text-on-surface mb-3",
                                      [
                                        .text(" Clean Engineering "),
                                      ],
                                    ),
                                    p(
                                      classes: "font-body-md text-body-md text-on-surface-variant leading-relaxed",
                                      [
                                        .text(
                                          " Maintainable codebases, type-safety, modular architecture, and zero unnecessary dependencies that slow future development down. We leave systems clean so your in-house team can step in without dread. ",
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                div(
                                  classes: "mt-8 pt-4 font-label-mono text-label-mono-xs text-tertiary",
                                  [
                                    .text(" INTEGRITY // ZERO CODE BLOAT "),
                                  ],
                                ),
                              ],
                            ),
                            div(
                              classes:
                                  "p-8 sm:p-10 rounded-xl bg-surface-container-low shadow-sm flex flex-col justify-between hover:bg-surface-container transition-colors duration-300",
                              [
                                div(
                                  [
                                    div(
                                      classes:
                                          "w-12 h-12 rounded-lg bg-surface-container-highest flex items-center justify-center mb-6",
                                      [
                                        span(
                                          classes: "material-symbols-outlined text-primary text-[24px]",
                                          [
                                            .text("all_inclusive"),
                                          ],
                                        ),
                                      ],
                                    ),
                                    h3(
                                      classes: "font-headline-md text-headline-md text-on-surface mb-3",
                                      [
                                        .text(" Long-Term Thinking "),
                                      ],
                                    ),
                                    p(
                                      classes: "font-body-md text-body-md text-on-surface-variant leading-relaxed",
                                      [
                                        .text(
                                          " We build systems designed to be operated, maintained, and evolved gracefully long after initial launch day. Smart schema versioning, backward compatibility, and sound migration paths are non-negotiable. ",
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                div(
                                  classes: "mt-8 pt-4 font-label-mono text-label-mono-xs text-tertiary",
                                  [
                                    .text(" LIFECYCLE // OPERATIONAL MATURITY "),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    section(
                      classes: "relative w-full max-w-7xl mx-auto px-6 sm:px-8 py-16 sm:py-24",
                      [
                        div(
                          classes: "max-w-3xl mb-14 sm:mb-16",
                          [
                            div(
                              classes:
                                  "flex items-center gap-2 font-label-mono text-label-mono text-secondary uppercase tracking-widest mb-3",
                              [
                                span(
                                  [
                                    .text("02"),
                                  ],
                                ),
                                span(classes: "w-8 h-[1px] bg-secondary/40", []),
                                span(
                                  [
                                    .text("Our Journey"),
                                  ],
                                ),
                              ],
                            ),
                            h2(
                              classes: "font-headline-lg text-headline-lg text-on-surface tracking-tight",
                              [
                                .text(" Built through real projects. "),
                              ],
                            ),
                            p(
                              classes: "font-body-lg text-body-lg text-on-surface-variant mt-3",
                              [
                                .text(
                                  " Capability is forged through shipping real software under tight constraints, not memorizing abstract buzzwords. ",
                                ),
                              ],
                            ),
                          ],
                        ),
                        div(
                          classes: "relative grid grid-cols-1 md:grid-cols-4 gap-6",
                          [
                            div(
                              classes:
                                  "relative p-6 sm:p-8 rounded-xl bg-surface-container-low shadow-sm flex flex-col",
                              [
                                div(
                                  classes: "flex items-center justify-between mb-6",
                                  [
                                    span(
                                      classes: "font-label-mono text-label-mono text-secondary",
                                      [
                                        .text("PHASE 01"),
                                      ],
                                    ),
                                    div(classes: "w-3 h-3 rounded-full bg-secondary shadow-[0_0_8px_#4cd7f6]", []),
                                  ],
                                ),
                                h3(
                                  classes: "font-headline-md text-headline-md text-on-surface mb-2",
                                  [
                                    .text(" Learn "),
                                  ],
                                ),
                                p(
                                  classes: "font-body-sm text-body-sm text-on-surface-variant leading-relaxed flex-1",
                                  [
                                    .text(
                                      " Deeply immersing in domain constraints, user behavior, and technology primitives before proposing any architectural pattern. ",
                                    ),
                                  ],
                                ),
                                div(
                                  classes: "mt-6 pt-4 flex items-center gap-2 text-tertiary font-label-mono-xs",
                                  [
                                    span(
                                      classes: "material-symbols-outlined text-[14px]",
                                      [
                                        .text("search"),
                                      ],
                                    ),
                                    span(
                                      [
                                        .text("Discovery & Scoping"),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            div(
                              classes:
                                  "relative p-6 sm:p-8 rounded-xl bg-surface-container-low shadow-sm flex flex-col",
                              [
                                div(
                                  classes: "flex items-center justify-between mb-6",
                                  [
                                    span(
                                      classes: "font-label-mono text-label-mono text-primary",
                                      [
                                        .text("PHASE 02"),
                                      ],
                                    ),
                                    div(classes: "w-3 h-3 rounded-full bg-primary shadow-[0_0_8px_#adc6ff]", []),
                                  ],
                                ),
                                h3(
                                  classes: "font-headline-md text-headline-md text-on-surface mb-2",
                                  [
                                    .text(" Build "),
                                  ],
                                ),
                                p(
                                  classes: "font-body-sm text-body-sm text-on-surface-variant leading-relaxed flex-1",
                                  [
                                    .text(
                                      " Translating architecture into clean, testable software across mobile, web, and desktop with zero intermediate handoffs. ",
                                    ),
                                  ],
                                ),
                                div(
                                  classes: "mt-6 pt-4 flex items-center gap-2 text-tertiary font-label-mono-xs",
                                  [
                                    span(
                                      classes: "material-symbols-outlined text-[14px]",
                                      [
                                        .text("code"),
                                      ],
                                    ),
                                    span(
                                      [
                                        .text("Disciplined Coding"),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            div(
                              classes:
                                  "relative p-6 sm:p-8 rounded-xl bg-surface-container-low shadow-sm flex flex-col",
                              [
                                div(
                                  classes: "flex items-center justify-between mb-6",
                                  [
                                    span(
                                      classes: "font-label-mono text-label-mono text-secondary",
                                      [
                                        .text("PHASE 03"),
                                      ],
                                    ),
                                    div(classes: "w-3 h-3 rounded-full bg-secondary shadow-[0_0_8px_#4cd7f6]", []),
                                  ],
                                ),
                                h3(
                                  classes: "font-headline-md text-headline-md text-on-surface mb-2",
                                  [
                                    .text(" Ship "),
                                  ],
                                ),
                                p(
                                  classes: "font-body-sm text-body-sm text-on-surface-variant leading-relaxed flex-1",
                                  [
                                    .text(
                                      " Deploying production releases with disciplined QA, smooth automated CI/CD, and stringent App Store or cloud compliance. ",
                                    ),
                                  ],
                                ),
                                div(
                                  classes: "mt-6 pt-4 flex items-center gap-2 text-tertiary font-label-mono-xs",
                                  [
                                    span(
                                      classes: "material-symbols-outlined text-[14px]",
                                      [
                                        .text("rocket_launch"),
                                      ],
                                    ),
                                    span(
                                      [
                                        .text("Automated Releases"),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            div(
                              classes:
                                  "relative p-6 sm:p-8 rounded-xl bg-surface-container-low shadow-sm flex flex-col",
                              [
                                div(
                                  classes: "flex items-center justify-between mb-6",
                                  [
                                    span(
                                      classes: "font-label-mono text-label-mono text-primary",
                                      [
                                        .text("PHASE 04"),
                                      ],
                                    ),
                                    div(classes: "w-3 h-3 rounded-full bg-primary shadow-[0_0_8px_#adc6ff]", []),
                                  ],
                                ),
                                h3(
                                  classes: "font-headline-md text-headline-md text-on-surface mb-2",
                                  [
                                    .text(" Improve "),
                                  ],
                                ),
                                p(
                                  classes: "font-body-sm text-body-sm text-on-surface-variant leading-relaxed flex-1",
                                  [
                                    .text(
                                      " Listening to real user feedback, monitoring edge cases, profiling bottlenecks, and refining performance continuously. ",
                                    ),
                                  ],
                                ),
                                div(
                                  classes: "mt-6 pt-4 flex items-center gap-2 text-tertiary font-label-mono-xs",
                                  [
                                    span(
                                      classes: "material-symbols-outlined text-[14px]",
                                      [
                                        .text("refresh"),
                                      ],
                                    ),
                                    span(
                                      [
                                        .text("Telemetry & Polish"),
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
                      classes: "relative w-full max-w-7xl mx-auto px-6 sm:px-8 py-16 sm:py-24",
                      [
                        div(
                          classes:
                              "rounded-xl bg-surface-container-lowest p-8 sm:p-14 shadow-2xl relative overflow-hidden",
                          [
                            div(
                              classes:
                                  "absolute top-0 left-0 right-0 h-[2px] bg-gradient-to-r from-transparent via-secondary to-transparent opacity-80",
                              [],
                            ),
                            div(
                              classes: "max-w-2xl mb-12 sm:mb-16",
                              [
                                div(
                                  classes:
                                      "flex items-center gap-2 font-label-mono text-label-mono text-secondary uppercase tracking-widest mb-3",
                                  [
                                    span(
                                      [
                                        .text("03"),
                                      ],
                                    ),
                                    span(classes: "w-8 h-[1px] bg-secondary/40", []),
                                    span(
                                      [
                                        .text("Engineering Philosophy"),
                                      ],
                                    ),
                                  ],
                                ),
                                h2(
                                  classes: "font-headline-lg text-headline-lg text-on-surface tracking-tight",
                                  [
                                    .text(" Good software isn't just code. "),
                                  ],
                                ),
                                p(
                                  classes: "font-body-lg text-body-lg text-on-surface-variant mt-2",
                                  [
                                    .text(
                                      " Lines of code are a liability, not an asset. Value is measured by human simplicity and operational endurance. ",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            div(
                              classes: "grid grid-cols-1 md:grid-cols-3 gap-8 sm:gap-10",
                              [
                                div(
                                  classes: "space-y-4",
                                  [
                                    span(
                                      classes: "font-label-mono text-headline-sm text-secondary font-semibold",
                                      [
                                        .text("01"),
                                      ],
                                    ),
                                    h3(
                                      classes: "font-headline-md text-headline-md text-on-surface",
                                      [
                                        .text(" It solves a real problem "),
                                      ],
                                    ),
                                    p(
                                      classes: "font-body-md text-body-md text-on-surface-variant leading-relaxed",
                                      [
                                        .text(
                                          " If it doesn't eliminate friction or unlock a genuine capability, no amount of engineering polish will save it. We question assumptions early so time isn't wasted building what nobody uses. ",
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                div(
                                  classes: "space-y-4",
                                  [
                                    span(
                                      classes: "font-label-mono text-headline-sm text-primary font-semibold",
                                      [
                                        .text("02"),
                                      ],
                                    ),
                                    h3(
                                      classes: "font-headline-md text-headline-md text-on-surface",
                                      [
                                        .text(" It feels simple to use "),
                                      ],
                                    ),
                                    p(
                                      classes: "font-body-md text-body-md text-on-surface-variant leading-relaxed",
                                      [
                                        .text(
                                          " True sophistication is making complex distributed logic feel effortless, intuitive, and responsive to the user. Fast micro-interactions and sensible defaults beat confusing menus every time. ",
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                div(
                                  classes: "space-y-4",
                                  [
                                    span(
                                      classes: "font-label-mono text-headline-sm text-secondary font-semibold",
                                      [
                                        .text("03"),
                                      ],
                                    ),
                                    h3(
                                      classes: "font-headline-md text-headline-md text-on-surface",
                                      [
                                        .text(" It can grow "),
                                      ],
                                    ),
                                    p(
                                      classes: "font-body-md text-body-md text-on-surface-variant leading-relaxed",
                                      [
                                        .text(
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
                    section(
                      classes: "relative w-full max-w-7xl mx-auto px-6 sm:px-8 py-16 sm:py-24",
                      [
                        div(
                          classes: "max-w-3xl mb-14 sm:mb-16",
                          [
                            div(
                              classes:
                                  "flex items-center gap-2 font-label-mono text-label-mono text-secondary uppercase tracking-widest mb-3",
                              [
                                span(
                                  [
                                    .text("04"),
                                  ],
                                ),
                                span(classes: "w-8 h-[1px] bg-secondary/40", []),
                                span(
                                  [
                                    .text("Engineers & Designers"),
                                  ],
                                ),
                              ],
                            ),
                            h2(
                              classes: "font-headline-lg text-headline-lg text-on-surface tracking-tight",
                              [
                                .text(" Small by design. Driven by craft. "),
                              ],
                            ),
                            p(
                              classes: "font-body-lg text-body-lg text-on-surface-variant mt-3",
                              [
                                .text(
                                  " We keep the team lean so every project gets direct attention from experienced practitioners. No junior delegates, no outsourced accounts. ",
                                ),
                              ],
                            ),
                          ],
                        ),
                        div(
                          classes: "grid grid-cols-1 md:grid-cols-3 gap-8",
                          [
                            div(
                              classes:
                                  "group rounded-xl bg-surface-container-low overflow-hidden shadow-sm flex flex-col justify-between hover:bg-surface-container transition-all duration-300",
                              [
                                div(
                                  [
                                    div(
                                      classes: "relative w-full h-72 overflow-hidden bg-surface-container-highest",
                                      [
                                        img(
                                          classes:
                                              "w-full h-full object-cover grayscale contrast-125 group-hover:scale-105 transition-transform duration-500",
                                          src: "assets/images/Mahmoud.png",
                                          attributes: {
                                            "data-alt":
                                                "Editorial portrait of a male technical lead engineer in a minimalist dark studio setting, moody cinematic soft lighting with subtle cool cyan rim light, wearing a dark crewneck, thoughtful and focused expression, high dynamic range editorial portrait photograph in contemporary aesthetic.",
                                          },
                                        ),
                                        div(
                                          classes:
                                              "absolute inset-0 bg-gradient-to-t from-surface-container-low via-transparent to-transparent",
                                          [],
                                        ),
                                      ],
                                    ),
                                    div(
                                      classes: "p-6 sm:p-8 space-y-3",
                                      [
                                        div(
                                          classes: "flex items-center justify-between",
                                          [
                                            span(
                                              classes:
                                                  "font-label-mono text-label-mono-xs text-secondary uppercase tracking-wider",
                                              [
                                                .text("FOUNDER / MOBILE DEVELOPER / BACK-END DEVELOPER"),
                                              ],
                                            ),
                                          ],
                                        ),
                                        h3(
                                          classes: "font-headline-md text-headline-md text-on-surface font-semibold",
                                          [
                                            .text(" Mahmoud Bannan "),
                                          ],
                                        ),
                                        p(
                                          classes: "font-body-sm text-body-sm text-tertiary",
                                          [
                                            .text(" FOUNDER & Mobile Developer & Back-end Developer "),
                                          ],
                                        ),
                                        p(
                                          classes:
                                              "font-body-md text-body-md text-on-surface-variant pt-2 leading-relaxed",
                                          [
                                            .text(
                                              " Building reliable mobile applications and robust back-end systems with a focus on clean architecture, performance, and maintainable code. ",
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                div(
                                  classes:
                                      "px-6 sm:px-8 pb-6 sm:pb-8 pt-2 flex items-center gap-4 font-label-mono text-label-mono text-primary",
                                  [
                                    a(
                                      classes: "inline-flex items-center gap-1 hover:text-secondary transition-colors",
                                      href: "https://www.linkedin.com/in/mouhammed-deeb-jalab",

                                      [
                                        span(
                                          [
                                            .text("LinkedIn"),
                                          ],
                                        ),
                                        span(
                                          classes: "material-symbols-outlined text-[14px]",
                                          [
                                            .text("north_east"),
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
                                    a(
                                      classes: "inline-flex items-center gap-1 hover:text-secondary transition-colors",
                                      href: "https://github.com/Mohamed-Jalab",

                                      [
                                        span(
                                          [
                                            .text("GitHub"),
                                          ],
                                        ),
                                        span(
                                          classes: "material-symbols-outlined text-[14px]",
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
                              classes:
                                  "group rounded-xl bg-surface-container-low overflow-hidden shadow-sm flex flex-col justify-between hover:bg-surface-container transition-all duration-300",
                              [
                                div(
                                  [
                                    div(
                                      classes: "relative w-full h-72 overflow-hidden bg-surface-container-highest",
                                      [
                                        img(
                                          classes:
                                              "w-full h-full object-cover grayscale contrast-125 group-hover:scale-105 transition-transform duration-500",

                                          alt:
                                              "Portrait of Mohammed Deeb Jalab, founder, mobile developer, and front-end web developer",
                                          src: "assets/images/Mohammed.jpg",
                                        ),
                                        div(
                                          classes:
                                              "absolute inset-0 bg-gradient-to-t from-surface-container-low via-transparent to-transparent",
                                          [],
                                        ),
                                      ],
                                    ),
                                    div(
                                      classes: "p-6 sm:p-8 space-y-3",
                                      [
                                        div(
                                          classes: "flex items-center justify-between",
                                          [
                                            span(
                                              classes:
                                                  "font-label-mono text-label-mono-xs text-primary uppercase tracking-wider",
                                              [
                                                .text("FOUNDER / MOBILE DEVELOPER / FRONT-END WEB DEVELOPER"),
                                              ],
                                            ),
                                          ],
                                        ),
                                        h3(
                                          classes: "font-headline-md text-headline-md text-on-surface font-semibold",
                                          [
                                            .text(" Mohammed Deeb Jalab "),
                                          ],
                                        ),
                                        p(
                                          classes: "font-body-sm text-body-sm text-tertiary",
                                          [
                                            .text(" FOUNDER & Mobile Developer & Front-end Web Developer "),
                                          ],
                                        ),
                                        p(
                                          classes:
                                              "font-body-md text-body-md text-on-surface-variant pt-2 leading-relaxed",
                                          [
                                            .text(
                                              " Building polished mobile applications and responsive web experiences with clean code, intuitive interfaces, and dependable performance. ",
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                div(
                                  classes:
                                      "px-6 sm:px-8 pb-6 sm:pb-8 pt-2 flex items-center gap-4 font-label-mono text-label-mono text-primary",
                                  [
                                    a(
                                      classes: "inline-flex items-center gap-1 hover:text-secondary transition-colors",
                                      href: "https://www.linkedin.com/in/mouhammed-deeb-jalab",

                                      [
                                        span(
                                          [
                                            .text("LinkedIn"),
                                          ],
                                        ),
                                        span(
                                          classes: "material-symbols-outlined text-[14px]",
                                          [
                                            .text("north_east"),
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
                                    a(
                                      classes: "inline-flex items-center gap-1 hover:text-secondary transition-colors",
                                      href: "https://github.com/Mohamed-Jalab",

                                      [
                                        span(
                                          [
                                            .text("GitHub"),
                                          ],
                                        ),
                                        span(
                                          classes: "material-symbols-outlined text-[14px]",
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
                          ],
                        ),
                      ],
                    ),
                    section(
                      classes: "relative w-full max-w-7xl mx-auto px-6 sm:px-8 py-10",
                      [
                        div(
                          classes:
                              "py-5 px-6 sm:px-10 rounded-xl bg-surface-container-lowest/80 backdrop-blur-md flex flex-wrap items-center justify-around gap-4 shadow-sm",
                          [
                            span(
                              classes:
                                  "font-label-mono text-label-mono text-on-surface flex items-center gap-2 tracking-wider",
                              [
                                span(classes: "w-1.5 h-1.5 rounded-full bg-secondary shadow-[0_0_6px_#4cd7f6]", []),
                                .text(" Mobile "),
                              ],
                            ),
                            span(
                              classes: "text-outline-variant/60",
                              [
                                .text("•"),
                              ],
                            ),
                            span(
                              classes:
                                  "font-label-mono text-label-mono text-on-surface flex items-center gap-2 tracking-wider",
                              [
                                span(classes: "w-1.5 h-1.5 rounded-full bg-primary shadow-[0_0_6px_#adc6ff]", []),
                                .text(" Web "),
                              ],
                            ),
                            span(
                              classes: "text-outline-variant/60",
                              [
                                .text("•"),
                              ],
                            ),
                            span(
                              classes:
                                  "font-label-mono text-label-mono text-on-surface flex items-center gap-2 tracking-wider",
                              [
                                span(classes: "w-1.5 h-1.5 rounded-full bg-secondary shadow-[0_0_6px_#4cd7f6]", []),
                                .text(" Desktop "),
                              ],
                            ),
                            span(
                              classes: "text-outline-variant/60",
                              [
                                .text("•"),
                              ],
                            ),
                            span(
                              classes:
                                  "font-label-mono text-label-mono text-on-surface flex items-center gap-2 tracking-wider",
                              [
                                span(classes: "w-1.5 h-1.5 rounded-full bg-secondary shadow-[0_0_6px_#4cd7f6]", []),
                                .text(" UI/UX "),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    section(
                      classes: "relative w-full max-w-7xl mx-auto px-6 sm:px-8 pt-12 pb-24 sm:pb-32",
                      [
                        div(
                          classes:
                              "relative rounded-2xl bg-surface-container-low p-8 sm:p-16 shadow-2xl overflow-hidden text-center flex flex-col items-center",
                          [
                            div(
                              classes:
                                  "pointer-events-none absolute inset-0 bg-[radial-gradient(ellipse_at_center,rgba(77,142,255,0.12)_0%,transparent_70%)]",
                              [],
                            ),
                            div(
                              classes:
                                  "inline-flex items-center gap-2 px-3.5 py-1.5 rounded-full bg-surface-container-lowest text-secondary font-label-mono text-label-mono mb-8 shadow-sm",
                              [
                                span(
                                  classes: "w-2 h-2 rounded-full bg-secondary shadow-[0_0_8px_#4cd7f6] animate-ping",
                                  [],
                                ),
                                span(
                                  [
                                    .text("Available for new projects"),
                                  ],
                                ),
                              ],
                            ),
                            h2(
                              classes:
                                  "font-headline-lg text-headline-lg text-on-surface tracking-tight max-w-2xl mb-4",
                              [
                                .text(" Have an Idea? Let's Build It Together. "),
                              ],
                            ),
                            p(
                              classes:
                                  "font-body-lg text-body-lg text-on-surface-variant max-w-xl mb-8 leading-relaxed",
                              [
                                .text(
                                  " Whether you're starting something new or improving an existing product, let's turn your idea into reliable software. ",
                                ),
                              ],
                            ),
                            a(
                              classes:
                                  "inline-flex items-center justify-center h-12 px-8 rounded-lg bg-primary-container text-on-primary-container font-body-md text-body-md font-medium hover:bg-primary transition-all duration-200 shadow-[inset_0_1px_0_rgba(255,255,255,0.2)] hover:shadow-[0_0_24px_rgba(77,142,255,0.4)]",
                              href: "/contact",
                              attributes: {
                                "data-path": "contact",
                              },
                              [
                                .text(" Tell Us About Your Project → "),
                              ],
                            ),
                            p(
                              classes: "font-label-mono text-label-mono-xs text-tertiary mt-6",
                              [
                                .text(" DIRECT RESPONSE FROM A TECHNICAL LEAD WITHIN 24 HOURS "),
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
