import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class ContactFormView extends StatelessComponent {
  @override
  Component build(BuildContext context) {
    return section(
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
                              classes: "font-label-mono-xs text-label-mono-xs text-outline tracking-wider uppercase",
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
    );
  }
}
