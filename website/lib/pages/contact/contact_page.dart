import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../core/components/app_footer.dart';
import '../../core/components/app_header.dart';

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
        AppHeader(
          tabs: [
            (name: "Home", url: "/", isSelected: false),
            (name: "Services", url: "/services", isSelected: false),
            (name: "Projects", url: "/projects", isSelected: false),
            (name: "About", url: "/about", isSelected: false),
            (name: "Contact", url: "/contact", isSelected: true),
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
                                    .text("Contact"),
                                  ],
                                ),
                              ],
                            ),
                            h1(
                              classes:
                                  "font-headline-lg text-headline-lg md:text-[54px] md:leading-[62px] text-on-surface tracking-tight font-semibold mt-1",
                              [
                                .text(" Let's Build "),
                                span(
                                  classes:
                                      "bg-clip-text text-transparent bg-gradient-to-r from-primary via-secondary to-primary-container",
                                  [
                                    .text("Something Together."),
                                  ],
                                ),
                              ],
                            ),
                            p(
                              classes:
                                  "font-body-lg text-body-lg text-on-surface-variant max-w-2xl leading-relaxed mt-1",
                              [
                                .text(
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
                                                    .text("Your Name"),
                                                  ],
                                                ),
                                                span(
                                                  classes:
                                                      "font-label-mono-xs text-label-mono-xs text-outline tracking-wider uppercase",
                                                  [
                                                    .text("Required"),
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
                                                    .text("Work Email"),
                                                  ],
                                                ),
                                                span(
                                                  classes:
                                                      "font-label-mono-xs text-label-mono-xs text-outline tracking-wider uppercase",
                                                  [
                                                    .text("Required"),
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
                                                .text("Company or Organization"),
                                              ],
                                            ),
                                            span(
                                              classes:
                                                  "font-label-mono-xs text-label-mono-xs px-2 py-0.5 rounded bg-surface-container-high text-on-surface-variant uppercase tracking-wider",
                                              [
                                                .text("Optional"),
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
                                                .text("What can we help you with?"),
                                              ],
                                            ),
                                            span(
                                              classes: "font-label-mono-xs text-label-mono-xs text-outline",
                                              [
                                                .text("Select all that apply"),
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
                                                    .text("check"),
                                                  ],
                                                ),
                                                span(
                                                  [
                                                    .text("Mobile App"),
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
                                                    .text("check"),
                                                  ],
                                                ),
                                                span(
                                                  [
                                                    .text("Web Platform"),
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
                                                    .text("check"),
                                                  ],
                                                ),
                                                span(
                                                  [
                                                    .text("Desktop Software"),
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
                                                    .text("check"),
                                                  ],
                                                ),
                                                span(
                                                  [
                                                    .text("Backend & API"),
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
                                                    .text("check"),
                                                  ],
                                                ),
                                                span(
                                                  [
                                                    .text("UI/UX Design"),
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
                                                    .text("check"),
                                                  ],
                                                ),
                                                span(
                                                  [
                                                    .text("Not Sure Yet"),
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
                                                .text("Tell us about your project"),
                                              ],
                                            ),
                                            span(
                                              classes:
                                                  "font-label-mono-xs text-label-mono-xs text-outline tracking-wider uppercase",
                                              [
                                                .text("Required"),
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
                                                .text("Send Project Inquiry"),
                                              ],
                                            ),
                                            span(
                                              classes:
                                                  "material-symbols-outlined text-[18px] group-hover:translate-x-1 transition-transform",
                                              [
                                                .text("arrow_forward"),
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
                                                .text("lock"),
                                              ],
                                            ),
                                            span(
                                              [
                                                .text("Your project details remain confidential"),
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
                                            .text("check_circle"),
                                          ],
                                        ),
                                        div(
                                          classes: "text-body-sm font-body-sm",
                                          [
                                            p(
                                              classes: "font-medium text-on-surface",
                                              [
                                                .text(" Inquiry dispatched to our lead engineering room. "),
                                              ],
                                            ),
                                            p(
                                              classes: "text-on-surface-variant mt-0.5",
                                              [
                                                .text(
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
                                    .text("What Happens Next?"),
                                  ],
                                ),
                                h2(
                                  classes:
                                      "font-headline-lg text-headline-lg text-on-surface font-semibold tracking-tight",
                                  [
                                    .text(" A Simple, Transparent Start. "),
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
                                                .text("01"),
                                              ],
                                            ),
                                            span(
                                              classes:
                                                  "material-symbols-outlined text-outline group-hover:text-primary transition-colors text-[22px]",
                                              [
                                                .text("description"),
                                              ],
                                            ),
                                          ],
                                        ),
                                        h3(
                                          classes: "font-headline-sm text-headline-sm text-on-surface font-medium",
                                          [
                                            .text(" Tell Us About Your Idea "),
                                          ],
                                        ),
                                        p(
                                          classes: "font-body-sm text-body-sm text-on-surface-variant leading-relaxed",
                                          [
                                            .text(
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
                                                .text("02"),
                                              ],
                                            ),
                                            span(
                                              classes:
                                                  "material-symbols-outlined text-outline group-hover:text-secondary transition-colors text-[22px]",
                                              [
                                                .text("manage_search"),
                                              ],
                                            ),
                                          ],
                                        ),
                                        h3(
                                          classes: "font-headline-sm text-headline-sm text-on-surface font-medium",
                                          [
                                            .text(" We'll Review Your Needs "),
                                          ],
                                        ),
                                        p(
                                          classes: "font-body-sm text-body-sm text-on-surface-variant leading-relaxed",
                                          [
                                            .text(
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
                                                .text("03"),
                                              ],
                                            ),
                                            span(
                                              classes:
                                                  "material-symbols-outlined text-outline group-hover:text-primary transition-colors text-[22px]",
                                              [
                                                .text("forum"),
                                              ],
                                            ),
                                          ],
                                        ),
                                        h3(
                                          classes: "font-headline-sm text-headline-sm text-on-surface font-medium",
                                          [
                                            .text(" Let's Talk About the Right Solution "),
                                          ],
                                        ),
                                        p(
                                          classes: "font-body-sm text-body-sm text-on-surface-variant leading-relaxed",
                                          [
                                            .text(
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
