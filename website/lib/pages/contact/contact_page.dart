import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../core/components/app_footer.dart';

class ContactPage extends StatelessComponent {
  const ContactPage();
  @override
  Component build(BuildContext context) {
    return .fragment([
      Document.html(attributes: const {'class': 'dark'}),
      Document.head(
        title: 'Contact | Brothers-Tech',
        meta: {
          'description': 'Tell Brothers-Tech about your software idea, product improvement, or business challenge.',
        },
      ),
      Document.body(attributes: {'class': "bg-background font-body-md text-on-surface antialiased min-h-screen"}),
      Component.fragment([
        header(
          classes:
              "fixed top-0 left-0 right-0 w-full z-50 bg-surface/80 backdrop-blur-xl border-b border-[rgba(255,255,255,0.08)] transition-all duration-300",
          [
            div(
              classes: "h-20 max-w-7xl mx-auto px-6 sm:px-8 flex items-center justify-between",
              [
                a(
                  classes: "flex items-center gap-2 group",
                  href: "/",
                  attributes: {
                    "data-path": "home",
                  },
                  [
                    span(
                      classes:
                          "font-headline-sm text-headline-sm text-on-surface tracking-tight font-semibold group-hover:text-primary transition-colors",
                      [
                        Component.text("Brothers-Tech"),
                      ],
                    ),
                    span(classes: "h-2 w-2 rounded-full bg-secondary shadow-[0_0_8px_#4cd7f6]", []),
                  ],
                ),
                nav(
                  classes:
                      "hidden md:flex items-center gap-1 bg-surface-container-lowest/60 px-2 py-1.5 rounded-xl border border-[rgba(255,255,255,0.05)]",
                  attributes: {
                    "data-active-classes": "bg-surface-container-high text-primary font-medium rounded-lg",
                  },
                  [
                    a(
                      classes:
                          "px-4 py-2 text-on-surface-variant font-body-md text-body-md hover:text-on-surface hover:bg-surface-container-high transition-colors rounded-lg",
                      href: "/",
                      attributes: {
                        "data-path": "home",
                      },
                      [
                        Component.text("Home"),
                      ],
                    ),
                    a(
                      classes:
                          "px-4 py-2 text-on-surface-variant font-body-md text-body-md hover:text-on-surface hover:bg-surface-container-high transition-colors rounded-lg",
                      href: "/services",
                      attributes: {
                        "data-path": "services",
                      },
                      [
                        Component.text("Services"),
                      ],
                    ),
                    a(
                      classes:
                          "px-4 py-2 text-on-surface-variant font-body-md text-body-md hover:text-on-surface hover:bg-surface-container-high transition-colors rounded-lg",
                      href: "/projects",
                      attributes: {
                        "data-path": "projects",
                      },
                      [
                        Component.text("Projects"),
                      ],
                    ),
                    a(
                      classes:
                          "px-4 py-2 text-on-surface-variant font-body-md text-body-md hover:text-on-surface hover:bg-surface-container-high transition-colors rounded-lg",
                      href: "/about",
                      attributes: {
                        "data-path": "about",
                      },
                      [
                        Component.text("About"),
                      ],
                    ),
                    a(
                      classes:
                          "px-4 py-2 transition-colors bg-surface-container-high text-primary font-medium rounded-lg",
                      href: "/contact",
                      attributes: {
                        "aria-current": "page",
                        "data-path": "contact",
                      },
                      [
                        Component.text("Contact"),
                      ],
                    ),
                  ],
                ),
                div(
                  classes: "flex items-center gap-4",
                  [
                    a(
                      classes:
                          "hidden sm:inline-flex items-center justify-center h-10 px-5 rounded-lg bg-primary-container text-on-primary-container font-body-md text-body-md font-medium hover:bg-primary transition-all duration-200 shadow-[inset_0_1px_0_rgba(255,255,255,0.2)] hover:shadow-[0_0_16px_rgba(77,142,255,0.4)]",
                      href: "/contact",
                      attributes: {
                        "data-path": "contact",
                      },
                      [
                        Component.text("Start a Project →"),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        main_(
          classes: "w-full pt-20 bg-background min-h-screen",
          [
            div(
              classes: "flex flex-col w-full",
              [
                div(
                  classes: "relative w-full overflow-hidden",
                  [
                    div(
                      classes:
                          "absolute top-0 left-1/2 -translate-x-1/2 w-[720px] h-[340px] bg-gradient-to-b from-primary/15 via-secondary/5 to-transparent blur-3xl pointer-events-none -z-10",
                      [],
                    ),
                    section(
                      classes: "max-w-7xl mx-auto px-6 sm:px-8 pt-12 pb-16 w-full",
                      [
                        div(
                          classes: "flex flex-col items-start gap-4 max-w-3xl",
                          [
                            div(
                              classes:
                                  "inline-flex items-center gap-2 px-3 py-1 rounded-full bg-surface-container-high border border-outline-variant/40 shadow-sm",
                              [
                                span(
                                  classes:
                                      "w-1.5 h-1.5 rounded-full bg-secondary shadow-[0_0_8px_#4cd7f6] animate-pulse",
                                  [],
                                ),
                                span(
                                  classes: "font-label-mono text-label-mono text-secondary tracking-widest uppercase",
                                  [
                                    Component.text("Contact"),
                                  ],
                                ),
                              ],
                            ),
                            h1(
                              classes:
                                  "font-headline-lg text-headline-lg md:text-[54px] md:leading-[62px] text-on-surface tracking-tight font-semibold mt-1",
                              [
                                Component.text(" Let's Build "),
                                span(
                                  classes:
                                      "bg-clip-text text-transparent bg-gradient-to-r from-primary via-secondary to-primary-container",
                                  [
                                    Component.text("Something Together."),
                                  ],
                                ),
                              ],
                            ),
                            p(
                              classes:
                                  "font-body-lg text-body-lg text-on-surface-variant max-w-2xl leading-relaxed mt-1",
                              [
                                Component.text(
                                  " Have a software idea, an existing product that needs improvement, or a business problem that technology could solve? Tell us about it. ",
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    section(
                      classes: "max-w-7xl mx-auto px-6 sm:px-8 pb-24 w-full",
                      [
                        div(
                          classes: "grid grid-cols-1 lg:grid-cols-12 gap-8 items-start",
                          [
                            div(
                              classes:
                                  "lg:col-span-12 bg-surface-container-low/90 backdrop-blur-md rounded-xl border border-outline-variant/40 p-6 md:p-8 shadow-xl relative",
                              [
                                div(
                                  classes:
                                      "absolute inset-x-0 top-0 h-px bg-gradient-to-r from-transparent via-primary/30 to-transparent",
                                  [],
                                ),
                                form(
                                  id: "project-inquiry-form",
                                  classes: "space-y-6",
                                  [
                                    div(
                                      classes: "grid grid-cols-1 sm:grid-cols-2 gap-5",
                                      [
                                        div(
                                          classes: "flex flex-col gap-2",
                                          [
                                            label(
                                              classes:
                                                  "font-body-md text-body-md font-medium text-on-surface flex items-center justify-between",
                                              attributes: {
                                                "for": "contact-name",
                                              },
                                              [
                                                span(
                                                  [
                                                    Component.text("Your Name"),
                                                  ],
                                                ),
                                                span(
                                                  classes:
                                                      "font-label-mono-xs text-label-mono-xs text-outline tracking-wider uppercase",
                                                  [
                                                    Component.text("Required"),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            div(
                                              classes: "relative",
                                              [
                                                input(
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
                                        div(
                                          classes: "flex flex-col gap-2",
                                          [
                                            label(
                                              classes:
                                                  "font-body-md text-body-md font-medium text-on-surface flex items-center justify-between",
                                              attributes: {
                                                "for": "contact-email",
                                              },
                                              [
                                                span(
                                                  [
                                                    Component.text("Work Email"),
                                                  ],
                                                ),
                                                span(
                                                  classes:
                                                      "font-label-mono-xs text-label-mono-xs text-outline tracking-wider uppercase",
                                                  [
                                                    Component.text("Required"),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            div(
                                              classes: "relative",
                                              [
                                                input(
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
                                    div(
                                      classes: "flex flex-col gap-2",
                                      [
                                        label(
                                          classes:
                                              "font-body-md text-body-md font-medium text-on-surface flex items-center justify-between",
                                          attributes: {
                                            "for": "contact-company",
                                          },
                                          [
                                            span(
                                              [
                                                Component.text("Company or Organization"),
                                              ],
                                            ),
                                            span(
                                              classes:
                                                  "font-label-mono-xs text-label-mono-xs px-2 py-0.5 rounded bg-surface-container-high text-on-surface-variant uppercase tracking-wider",
                                              [
                                                Component.text("Optional"),
                                              ],
                                            ),
                                          ],
                                        ),
                                        input(
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
                                    div(
                                      classes: "flex flex-col gap-3",
                                      [
                                        label(
                                          classes:
                                              "font-body-md text-body-md font-medium text-on-surface flex items-center justify-between",
                                          [
                                            span(
                                              [
                                                Component.text("What can we help you with?"),
                                              ],
                                            ),
                                            span(
                                              classes: "font-label-mono-xs text-label-mono-xs text-outline",
                                              [
                                                Component.text("Select all that apply"),
                                              ],
                                            ),
                                          ],
                                        ),
                                        div(
                                          id: "scope-pills",
                                          classes: "flex flex-wrap gap-2.5",
                                          [
                                            button(
                                              classes:
                                                  "scope-pill px-3.5 py-2 rounded-lg text-body-sm font-label-mono bg-surface-container-lowest border border-outline-variant/50 text-on-surface-variant hover:text-on-surface hover:border-outline transition-all flex items-center gap-1.5",
                                              attributes: {
                                                "data-selected": "false",
                                                "type": "button",
                                              },
                                              [
                                                span(
                                                  classes:
                                                      "material-symbols-outlined text-[16px] text-outline opacity-0 scope-icon transition-opacity",
                                                  [
                                                    Component.text("check"),
                                                  ],
                                                ),
                                                span(
                                                  [
                                                    Component.text("Mobile App"),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            button(
                                              classes:
                                                  "scope-pill px-3.5 py-2 rounded-lg text-body-sm font-label-mono bg-surface-container-lowest border border-outline-variant/50 text-on-surface-variant hover:text-on-surface hover:border-outline transition-all flex items-center gap-1.5",
                                              attributes: {
                                                "data-selected": "false",
                                                "type": "button",
                                              },
                                              [
                                                span(
                                                  classes:
                                                      "material-symbols-outlined text-[16px] text-outline opacity-0 scope-icon transition-opacity",
                                                  [
                                                    Component.text("check"),
                                                  ],
                                                ),
                                                span(
                                                  [
                                                    Component.text("Web Platform"),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            button(
                                              classes:
                                                  "scope-pill px-3.5 py-2 rounded-lg text-body-sm font-label-mono bg-surface-container-lowest border border-outline-variant/50 text-on-surface-variant hover:text-on-surface hover:border-outline transition-all flex items-center gap-1.5",
                                              attributes: {
                                                "data-selected": "false",
                                                "type": "button",
                                              },
                                              [
                                                span(
                                                  classes:
                                                      "material-symbols-outlined text-[16px] text-outline opacity-0 scope-icon transition-opacity",
                                                  [
                                                    Component.text("check"),
                                                  ],
                                                ),
                                                span(
                                                  [
                                                    Component.text("Desktop Software"),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            button(
                                              classes:
                                                  "scope-pill px-3.5 py-2 rounded-lg text-body-sm font-label-mono bg-surface-container-lowest border border-outline-variant/50 text-on-surface-variant hover:text-on-surface hover:border-outline transition-all flex items-center gap-1.5",
                                              attributes: {
                                                "data-selected": "false",
                                                "type": "button",
                                              },
                                              [
                                                span(
                                                  classes:
                                                      "material-symbols-outlined text-[16px] text-outline opacity-0 scope-icon transition-opacity",
                                                  [
                                                    Component.text("check"),
                                                  ],
                                                ),
                                                span(
                                                  [
                                                    Component.text("Backend & API"),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            button(
                                              classes:
                                                  "scope-pill px-3.5 py-2 rounded-lg text-body-sm font-label-mono bg-surface-container-lowest border border-outline-variant/50 text-on-surface-variant hover:text-on-surface hover:border-outline transition-all flex items-center gap-1.5",
                                              attributes: {
                                                "data-selected": "false",
                                                "type": "button",
                                              },
                                              [
                                                span(
                                                  classes:
                                                      "material-symbols-outlined text-[16px] text-outline opacity-0 scope-icon transition-opacity",
                                                  [
                                                    Component.text("check"),
                                                  ],
                                                ),
                                                span(
                                                  [
                                                    Component.text("UI/UX Design"),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            button(
                                              classes:
                                                  "scope-pill px-3.5 py-2 rounded-lg text-body-sm font-label-mono bg-surface-container-lowest border border-outline-variant/50 text-on-surface-variant hover:text-on-surface hover:border-outline transition-all flex items-center gap-1.5",
                                              attributes: {
                                                "data-selected": "false",
                                                "type": "button",
                                              },
                                              [
                                                span(
                                                  classes:
                                                      "material-symbols-outlined text-[16px] text-outline opacity-0 scope-icon transition-opacity",
                                                  [
                                                    Component.text("check"),
                                                  ],
                                                ),
                                                span(
                                                  [
                                                    Component.text("Not Sure Yet"),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    div(
                                      classes: "flex flex-col gap-2",
                                      [
                                        label(
                                          classes:
                                              "font-body-md text-body-md font-medium text-on-surface flex items-center justify-between",
                                          attributes: {
                                            "for": "contact-message",
                                          },
                                          [
                                            span(
                                              [
                                                Component.text("Tell us about your project"),
                                              ],
                                            ),
                                            span(
                                              classes:
                                                  "font-label-mono-xs text-label-mono-xs text-outline tracking-wider uppercase",
                                              [
                                                Component.text("Required"),
                                              ],
                                            ),
                                          ],
                                        ),
                                        textarea(
                                          id: "contact-message",
                                          classes:
                                              "w-full p-3.5 rounded-lg bg-surface-container-lowest border border-outline-variant/50 text-on-surface placeholder:text-outline/70 font-body-md text-body-md focus:outline-none focus:border-primary focus:ring-1 focus:ring-primary transition-all resize-y leading-relaxed",
                                          attributes: {
                                            "placeholder":
                                                "Describe your idea, timeline, or current challenges. Tell us what you're trying to build...",
                                            "required": "",
                                            "rows": "5",
                                          },
                                          [],
                                        ),
                                      ],
                                    ),
                                    div(
                                      classes: "pt-2 flex flex-col sm:flex-row items-center justify-between gap-4",
                                      [
                                        button(
                                          id: "submit-btn",
                                          classes:
                                              "w-full sm:w-auto inline-flex items-center justify-center gap-2.5 h-12 px-8 rounded-lg bg-primary-container text-on-primary-container font-headline-sm text-headline-sm font-medium hover:bg-primary transition-all duration-200 shadow-[inset_0_1px_0_rgba(255,255,255,0.25)] hover:shadow-[0_0_20px_rgba(77,142,255,0.45)] cursor-pointer group",
                                          attributes: {
                                            "type": "submit",
                                          },
                                          [
                                            span(
                                              [
                                                Component.text("Send Project Inquiry"),
                                              ],
                                            ),
                                            span(
                                              classes:
                                                  "material-symbols-outlined text-[18px] group-hover:translate-x-1 transition-transform",
                                              [
                                                Component.text("arrow_forward"),
                                              ],
                                            ),
                                          ],
                                        ),
                                        div(
                                          classes:
                                              "flex items-center gap-2 text-on-surface-variant font-label-mono-xs text-label-mono-xs",
                                          [
                                            span(
                                              classes: "material-symbols-outlined text-outline text-[16px]",
                                              [
                                                Component.text("lock"),
                                              ],
                                            ),
                                            span(
                                              [
                                                Component.text("Your project details remain confidential"),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    div(
                                      id: "form-feedback",
                                      classes:
                                          "hidden p-4 rounded-lg bg-surface-container-high border border-secondary/40 text-on-surface flex items-start gap-3",
                                      [
                                        span(
                                          classes: "material-symbols-outlined text-secondary text-[20px] mt-0.5",
                                          [
                                            Component.text("check_circle"),
                                          ],
                                        ),
                                        div(
                                          classes: "text-body-sm font-body-sm",
                                          [
                                            p(
                                              classes: "font-medium text-on-surface",
                                              [
                                                Component.text(" Inquiry dispatched to our lead engineering room. "),
                                              ],
                                            ),
                                            p(
                                              classes: "text-on-surface-variant mt-0.5",
                                              [
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
                    section(
                      classes:
                          "w-full bg-surface-container-lowest/70 border-y border-outline-variant/30 py-20 relative",
                      [
                        div(
                          classes: "max-w-7xl mx-auto px-6 sm:px-8",
                          [
                            div(
                              classes: "max-w-2xl mb-12",
                              [
                                span(
                                  classes:
                                      "font-label-mono text-label-mono text-secondary tracking-widest uppercase block mb-2",
                                  [
                                    Component.text("What Happens Next?"),
                                  ],
                                ),
                                h2(
                                  classes:
                                      "font-headline-lg text-headline-lg text-on-surface font-semibold tracking-tight",
                                  [
                                    Component.text(" A Simple, Transparent Start. "),
                                  ],
                                ),
                              ],
                            ),
                            div(
                              classes: "grid grid-cols-1 md:grid-cols-3 gap-6 relative",
                              [
                                div(
                                  classes:
                                      "p-6 rounded-xl bg-surface-container/70 border border-outline-variant/30 relative flex flex-col justify-between hover:border-primary/40 transition-colors group",
                                  [
                                    div(
                                      classes: "space-y-4",
                                      [
                                        div(
                                          classes: "flex items-center justify-between",
                                          [
                                            span(
                                              classes: "font-label-mono text-[20px] font-semibold text-primary",
                                              [
                                                Component.text("01"),
                                              ],
                                            ),
                                            span(
                                              classes:
                                                  "material-symbols-outlined text-outline group-hover:text-primary transition-colors text-[22px]",
                                              [
                                                Component.text("description"),
                                              ],
                                            ),
                                          ],
                                        ),
                                        h3(
                                          classes: "font-headline-sm text-headline-sm text-on-surface font-medium",
                                          [
                                            Component.text(" Tell Us About Your Idea "),
                                          ],
                                        ),
                                        p(
                                          classes: "font-body-sm text-body-sm text-on-surface-variant leading-relaxed",
                                          [
                                            Component.text(
                                              " Submit the inquiry form with an overview of what you want to build or improve. ",
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    div(
                                      classes:
                                          "mt-8 h-1 w-12 rounded-full bg-outline-variant/40 group-hover:bg-primary transition-colors",
                                      [],
                                    ),
                                  ],
                                ),
                                div(
                                  classes:
                                      "p-6 rounded-xl bg-surface-container/70 border border-outline-variant/30 relative flex flex-col justify-between hover:border-secondary/40 transition-colors group",
                                  [
                                    div(
                                      classes: "space-y-4",
                                      [
                                        div(
                                          classes: "flex items-center justify-between",
                                          [
                                            span(
                                              classes: "font-label-mono text-[20px] font-semibold text-secondary",
                                              [
                                                Component.text("02"),
                                              ],
                                            ),
                                            span(
                                              classes:
                                                  "material-symbols-outlined text-outline group-hover:text-secondary transition-colors text-[22px]",
                                              [
                                                Component.text("manage_search"),
                                              ],
                                            ),
                                          ],
                                        ),
                                        h3(
                                          classes: "font-headline-sm text-headline-sm text-on-surface font-medium",
                                          [
                                            Component.text(" We'll Review Your Needs "),
                                          ],
                                        ),
                                        p(
                                          classes: "font-body-sm text-body-sm text-on-surface-variant leading-relaxed",
                                          [
                                            Component.text(
                                              " A technical lead reviews your requirements, scope, and feasibility within our engineering team. ",
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    div(
                                      classes:
                                          "mt-8 h-1 w-12 rounded-full bg-outline-variant/40 group-hover:bg-secondary transition-colors",
                                      [],
                                    ),
                                  ],
                                ),
                                div(
                                  classes:
                                      "p-6 rounded-xl bg-surface-container/70 border border-outline-variant/30 relative flex flex-col justify-between hover:border-primary/40 transition-colors group",
                                  [
                                    div(
                                      classes: "space-y-4",
                                      [
                                        div(
                                          classes: "flex items-center justify-between",
                                          [
                                            span(
                                              classes: "font-label-mono text-[20px] font-semibold text-primary",
                                              [
                                                Component.text("03"),
                                              ],
                                            ),
                                            span(
                                              classes:
                                                  "material-symbols-outlined text-outline group-hover:text-primary transition-colors text-[22px]",
                                              [
                                                Component.text("forum"),
                                              ],
                                            ),
                                          ],
                                        ),
                                        h3(
                                          classes: "font-headline-sm text-headline-sm text-on-surface font-medium",
                                          [
                                            Component.text(" Let's Talk About the Right Solution "),
                                          ],
                                        ),
                                        p(
                                          classes: "font-body-sm text-body-sm text-on-surface-variant leading-relaxed",
                                          [
                                            Component.text(
                                              " We arrange an introductory technical discussion to map architecture, timelines, and pragmatic next steps. ",
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    div(
                                      classes:
                                          "mt-8 h-1 w-12 rounded-full bg-outline-variant/40 group-hover:bg-primary transition-colors",
                                      [],
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
