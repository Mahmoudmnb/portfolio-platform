import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

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
            Component.element(
              tag: "div",
              classes: "h-20 max-w-7xl mx-auto px-6 sm:px-8 flex items-center justify-between",
              children: [
                Component.element(
                  tag: "a",
                  classes: "flex items-center gap-2 group",
                  attributes: {
                    "data-path": "home",
                    "href": "/",
                  },
                  children: [
                    Component.element(
                      tag: "span",
                      classes:
                          "font-headline-sm text-headline-sm text-on-surface tracking-tight font-semibold group-hover:text-primary transition-colors",
                      children: [
                        Component.text("Brothers-Tech"),
                      ],
                    ),
                    Component.element(
                      tag: "span",
                      classes: "h-2 w-2 rounded-full bg-secondary shadow-[0_0_8px_#4cd7f6]",
                    ),
                  ],
                ),
                Component.element(
                  tag: "nav",
                  classes:
                      "hidden md:flex items-center gap-1 bg-surface-container-lowest/60 px-2 py-1.5 rounded-xl border border-[rgba(255,255,255,0.05)]",
                  attributes: {
                    "data-active-classes": "bg-surface-container-high text-primary font-medium rounded-lg",
                  },
                  children: [
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
                    Component.element(
                      tag: "a",
                      classes:
                          "px-4 py-2 transition-colors bg-surface-container-high text-primary font-medium rounded-lg",
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
                Component.element(
                  tag: "div",
                  classes: "flex items-center gap-4",
                  children: [
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
        Component.element(
          tag: "main",
          classes: "w-full pt-20 bg-background min-h-screen",
          children: [
            Component.element(
              tag: "div",
              classes: "flex flex-col w-full",
              children: [
                Component.element(
                  tag: "div",
                  classes: "relative w-full overflow-hidden",
                  children: [
                    Component.element(
                      tag: "div",
                      classes:
                          "absolute top-0 left-1/2 -translate-x-1/2 w-[720px] h-[340px] bg-gradient-to-b from-primary/15 via-secondary/5 to-transparent blur-3xl pointer-events-none -z-10",
                    ),
                    Component.element(
                      tag: "section",
                      classes: "max-w-7xl mx-auto px-6 sm:px-8 pt-12 pb-16 w-full",
                      children: [
                        Component.element(
                          tag: "div",
                          classes: "flex flex-col items-start gap-4 max-w-3xl",
                          children: [
                            Component.element(
                              tag: "div",
                              classes:
                                  "inline-flex items-center gap-2 px-3 py-1 rounded-full bg-surface-container-high border border-outline-variant/40 shadow-sm",
                              children: [
                                Component.element(
                                  tag: "span",
                                  classes:
                                      "w-1.5 h-1.5 rounded-full bg-secondary shadow-[0_0_8px_#4cd7f6] animate-pulse",
                                ),
                                Component.element(
                                  tag: "span",
                                  classes: "font-label-mono text-label-mono text-secondary tracking-widest uppercase",
                                  children: [
                                    Component.text("Contact"),
                                  ],
                                ),
                              ],
                            ),
                            Component.element(
                              tag: "h1",
                              classes:
                                  "font-headline-lg text-headline-lg md:text-[54px] md:leading-[62px] text-on-surface tracking-tight font-semibold mt-1",
                              children: [
                                Component.text(" Let's Build "),
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
                            Component.element(
                              tag: "p",
                              classes:
                                  "font-body-lg text-body-lg text-on-surface-variant max-w-2xl leading-relaxed mt-1",
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
                    Component.element(
                      tag: "section",
                      classes: "max-w-7xl mx-auto px-6 sm:px-8 pb-24 w-full",
                      children: [
                        Component.element(
                          tag: "div",
                          classes: "grid grid-cols-1 lg:grid-cols-12 gap-8 items-start",
                          children: [
                            Component.element(
                              tag: "div",
                              classes:
                                  "lg:col-span-12 bg-surface-container-low/90 backdrop-blur-md rounded-xl border border-outline-variant/40 p-6 md:p-8 shadow-xl relative",
                              children: [
                                Component.element(
                                  tag: "div",
                                  classes:
                                      "absolute inset-x-0 top-0 h-px bg-gradient-to-r from-transparent via-primary/30 to-transparent",
                                ),
                                Component.element(
                                  tag: "form",
                                  id: "project-inquiry-form",
                                  classes: "space-y-6",
                                  children: [
                                    Component.element(
                                      tag: "div",
                                      classes: "grid grid-cols-1 sm:grid-cols-2 gap-5",
                                      children: [
                                        Component.element(
                                          tag: "div",
                                          classes: "flex flex-col gap-2",
                                          children: [
                                            Component.element(
                                              tag: "label",
                                              classes:
                                                  "font-body-md text-body-md font-medium text-on-surface flex items-center justify-between",
                                              attributes: {
                                                "for": "contact-name",
                                              },
                                              children: [
                                                Component.element(
                                                  tag: "span",
                                                  children: [
                                                    Component.text("Your Name"),
                                                  ],
                                                ),
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
                                            Component.element(
                                              tag: "div",
                                              classes: "relative",
                                              children: [
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
                                        Component.element(
                                          tag: "div",
                                          classes: "flex flex-col gap-2",
                                          children: [
                                            Component.element(
                                              tag: "label",
                                              classes:
                                                  "font-body-md text-body-md font-medium text-on-surface flex items-center justify-between",
                                              attributes: {
                                                "for": "contact-email",
                                              },
                                              children: [
                                                Component.element(
                                                  tag: "span",
                                                  children: [
                                                    Component.text("Work Email"),
                                                  ],
                                                ),
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
                                            Component.element(
                                              tag: "div",
                                              classes: "relative",
                                              children: [
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
                                    Component.element(
                                      tag: "div",
                                      classes: "flex flex-col gap-2",
                                      children: [
                                        Component.element(
                                          tag: "label",
                                          classes:
                                              "font-body-md text-body-md font-medium text-on-surface flex items-center justify-between",
                                          attributes: {
                                            "for": "contact-company",
                                          },
                                          children: [
                                            Component.element(
                                              tag: "span",
                                              children: [
                                                Component.text("Company or Organization"),
                                              ],
                                            ),
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
                                    Component.element(
                                      tag: "div",
                                      classes: "flex flex-col gap-3",
                                      children: [
                                        Component.element(
                                          tag: "label",
                                          classes:
                                              "font-body-md text-body-md font-medium text-on-surface flex items-center justify-between",
                                          children: [
                                            Component.element(
                                              tag: "span",
                                              children: [
                                                Component.text("What can we help you with?"),
                                              ],
                                            ),
                                            Component.element(
                                              tag: "span",
                                              classes: "font-label-mono-xs text-label-mono-xs text-outline",
                                              children: [
                                                Component.text("Select all that apply"),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Component.element(
                                          tag: "div",
                                          id: "scope-pills",
                                          classes: "flex flex-wrap gap-2.5",
                                          children: [
                                            Component.element(
                                              tag: "button",
                                              classes:
                                                  "scope-pill px-3.5 py-2 rounded-lg text-body-sm font-label-mono bg-surface-container-lowest border border-outline-variant/50 text-on-surface-variant hover:text-on-surface hover:border-outline transition-all flex items-center gap-1.5",
                                              attributes: {
                                                "data-selected": "false",
                                                "type": "button",
                                              },
                                              children: [
                                                Component.element(
                                                  tag: "span",
                                                  classes:
                                                      "material-symbols-outlined text-[16px] text-outline opacity-0 scope-icon transition-opacity",
                                                  children: [
                                                    Component.text("check"),
                                                  ],
                                                ),
                                                Component.element(
                                                  tag: "span",
                                                  children: [
                                                    Component.text("Mobile App"),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Component.element(
                                              tag: "button",
                                              classes:
                                                  "scope-pill px-3.5 py-2 rounded-lg text-body-sm font-label-mono bg-surface-container-lowest border border-outline-variant/50 text-on-surface-variant hover:text-on-surface hover:border-outline transition-all flex items-center gap-1.5",
                                              attributes: {
                                                "data-selected": "false",
                                                "type": "button",
                                              },
                                              children: [
                                                Component.element(
                                                  tag: "span",
                                                  classes:
                                                      "material-symbols-outlined text-[16px] text-outline opacity-0 scope-icon transition-opacity",
                                                  children: [
                                                    Component.text("check"),
                                                  ],
                                                ),
                                                Component.element(
                                                  tag: "span",
                                                  children: [
                                                    Component.text("Web Platform"),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Component.element(
                                              tag: "button",
                                              classes:
                                                  "scope-pill px-3.5 py-2 rounded-lg text-body-sm font-label-mono bg-surface-container-lowest border border-outline-variant/50 text-on-surface-variant hover:text-on-surface hover:border-outline transition-all flex items-center gap-1.5",
                                              attributes: {
                                                "data-selected": "false",
                                                "type": "button",
                                              },
                                              children: [
                                                Component.element(
                                                  tag: "span",
                                                  classes:
                                                      "material-symbols-outlined text-[16px] text-outline opacity-0 scope-icon transition-opacity",
                                                  children: [
                                                    Component.text("check"),
                                                  ],
                                                ),
                                                Component.element(
                                                  tag: "span",
                                                  children: [
                                                    Component.text("Desktop Software"),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Component.element(
                                              tag: "button",
                                              classes:
                                                  "scope-pill px-3.5 py-2 rounded-lg text-body-sm font-label-mono bg-surface-container-lowest border border-outline-variant/50 text-on-surface-variant hover:text-on-surface hover:border-outline transition-all flex items-center gap-1.5",
                                              attributes: {
                                                "data-selected": "false",
                                                "type": "button",
                                              },
                                              children: [
                                                Component.element(
                                                  tag: "span",
                                                  classes:
                                                      "material-symbols-outlined text-[16px] text-outline opacity-0 scope-icon transition-opacity",
                                                  children: [
                                                    Component.text("check"),
                                                  ],
                                                ),
                                                Component.element(
                                                  tag: "span",
                                                  children: [
                                                    Component.text("Backend & API"),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Component.element(
                                              tag: "button",
                                              classes:
                                                  "scope-pill px-3.5 py-2 rounded-lg text-body-sm font-label-mono bg-surface-container-lowest border border-outline-variant/50 text-on-surface-variant hover:text-on-surface hover:border-outline transition-all flex items-center gap-1.5",
                                              attributes: {
                                                "data-selected": "false",
                                                "type": "button",
                                              },
                                              children: [
                                                Component.element(
                                                  tag: "span",
                                                  classes:
                                                      "material-symbols-outlined text-[16px] text-outline opacity-0 scope-icon transition-opacity",
                                                  children: [
                                                    Component.text("check"),
                                                  ],
                                                ),
                                                Component.element(
                                                  tag: "span",
                                                  children: [
                                                    Component.text("UI/UX Design"),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Component.element(
                                              tag: "button",
                                              classes:
                                                  "scope-pill px-3.5 py-2 rounded-lg text-body-sm font-label-mono bg-surface-container-lowest border border-outline-variant/50 text-on-surface-variant hover:text-on-surface hover:border-outline transition-all flex items-center gap-1.5",
                                              attributes: {
                                                "data-selected": "false",
                                                "type": "button",
                                              },
                                              children: [
                                                Component.element(
                                                  tag: "span",
                                                  classes:
                                                      "material-symbols-outlined text-[16px] text-outline opacity-0 scope-icon transition-opacity",
                                                  children: [
                                                    Component.text("check"),
                                                  ],
                                                ),
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
                                    Component.element(
                                      tag: "div",
                                      classes: "flex flex-col gap-2",
                                      children: [
                                        Component.element(
                                          tag: "label",
                                          classes:
                                              "font-body-md text-body-md font-medium text-on-surface flex items-center justify-between",
                                          attributes: {
                                            "for": "contact-message",
                                          },
                                          children: [
                                            Component.element(
                                              tag: "span",
                                              children: [
                                                Component.text("Tell us about your project"),
                                              ],
                                            ),
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
                                    Component.element(
                                      tag: "div",
                                      classes: "pt-2 flex flex-col sm:flex-row items-center justify-between gap-4",
                                      children: [
                                        Component.element(
                                          tag: "button",
                                          id: "submit-btn",
                                          classes:
                                              "w-full sm:w-auto inline-flex items-center justify-center gap-2.5 h-12 px-8 rounded-lg bg-primary-container text-on-primary-container font-headline-sm text-headline-sm font-medium hover:bg-primary transition-all duration-200 shadow-[inset_0_1px_0_rgba(255,255,255,0.25)] hover:shadow-[0_0_20px_rgba(77,142,255,0.45)] cursor-pointer group",
                                          attributes: {
                                            "type": "submit",
                                          },
                                          children: [
                                            Component.element(
                                              tag: "span",
                                              children: [
                                                Component.text("Send Project Inquiry"),
                                              ],
                                            ),
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
                                        Component.element(
                                          tag: "div",
                                          classes:
                                              "flex items-center gap-2 text-on-surface-variant font-label-mono-xs text-label-mono-xs",
                                          children: [
                                            Component.element(
                                              tag: "span",
                                              classes: "material-symbols-outlined text-outline text-[16px]",
                                              children: [
                                                Component.text("lock"),
                                              ],
                                            ),
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
                                    Component.element(
                                      tag: "div",
                                      id: "form-feedback",
                                      classes:
                                          "hidden p-4 rounded-lg bg-surface-container-high border border-secondary/40 text-on-surface flex items-start gap-3",
                                      children: [
                                        Component.element(
                                          tag: "span",
                                          classes: "material-symbols-outlined text-secondary text-[20px] mt-0.5",
                                          children: [
                                            Component.text("check_circle"),
                                          ],
                                        ),
                                        Component.element(
                                          tag: "div",
                                          classes: "text-body-sm font-body-sm",
                                          children: [
                                            Component.element(
                                              tag: "p",
                                              classes: "font-medium text-on-surface",
                                              children: [
                                                Component.text(" Inquiry dispatched to our lead engineering room. "),
                                              ],
                                            ),
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
                    Component.element(
                      tag: "section",
                      classes:
                          "w-full bg-surface-container-lowest/70 border-y border-outline-variant/30 py-20 relative",
                      children: [
                        Component.element(
                          tag: "div",
                          classes: "max-w-7xl mx-auto px-6 sm:px-8",
                          children: [
                            Component.element(
                              tag: "div",
                              classes: "max-w-2xl mb-12",
                              children: [
                                Component.element(
                                  tag: "span",
                                  classes:
                                      "font-label-mono text-label-mono text-secondary tracking-widest uppercase block mb-2",
                                  children: [
                                    Component.text("What Happens Next?"),
                                  ],
                                ),
                                Component.element(
                                  tag: "h2",
                                  classes:
                                      "font-headline-lg text-headline-lg text-on-surface font-semibold tracking-tight",
                                  children: [
                                    Component.text(" A Simple, Transparent Start. "),
                                  ],
                                ),
                              ],
                            ),
                            Component.element(
                              tag: "div",
                              classes: "grid grid-cols-1 md:grid-cols-3 gap-6 relative",
                              children: [
                                Component.element(
                                  tag: "div",
                                  classes:
                                      "p-6 rounded-xl bg-surface-container/70 border border-outline-variant/30 relative flex flex-col justify-between hover:border-primary/40 transition-colors group",
                                  children: [
                                    Component.element(
                                      tag: "div",
                                      classes: "space-y-4",
                                      children: [
                                        Component.element(
                                          tag: "div",
                                          classes: "flex items-center justify-between",
                                          children: [
                                            Component.element(
                                              tag: "span",
                                              classes: "font-label-mono text-[20px] font-semibold text-primary",
                                              children: [
                                                Component.text("01"),
                                              ],
                                            ),
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
                                        Component.element(
                                          tag: "h3",
                                          classes: "font-headline-sm text-headline-sm text-on-surface font-medium",
                                          children: [
                                            Component.text(" Tell Us About Your Idea "),
                                          ],
                                        ),
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
                                    Component.element(
                                      tag: "div",
                                      classes:
                                          "mt-8 h-1 w-12 rounded-full bg-outline-variant/40 group-hover:bg-primary transition-colors",
                                    ),
                                  ],
                                ),
                                Component.element(
                                  tag: "div",
                                  classes:
                                      "p-6 rounded-xl bg-surface-container/70 border border-outline-variant/30 relative flex flex-col justify-between hover:border-secondary/40 transition-colors group",
                                  children: [
                                    Component.element(
                                      tag: "div",
                                      classes: "space-y-4",
                                      children: [
                                        Component.element(
                                          tag: "div",
                                          classes: "flex items-center justify-between",
                                          children: [
                                            Component.element(
                                              tag: "span",
                                              classes: "font-label-mono text-[20px] font-semibold text-secondary",
                                              children: [
                                                Component.text("02"),
                                              ],
                                            ),
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
                                        Component.element(
                                          tag: "h3",
                                          classes: "font-headline-sm text-headline-sm text-on-surface font-medium",
                                          children: [
                                            Component.text(" We'll Review Your Needs "),
                                          ],
                                        ),
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
                                    Component.element(
                                      tag: "div",
                                      classes:
                                          "mt-8 h-1 w-12 rounded-full bg-outline-variant/40 group-hover:bg-secondary transition-colors",
                                    ),
                                  ],
                                ),
                                Component.element(
                                  tag: "div",
                                  classes:
                                      "p-6 rounded-xl bg-surface-container/70 border border-outline-variant/30 relative flex flex-col justify-between hover:border-primary/40 transition-colors group",
                                  children: [
                                    Component.element(
                                      tag: "div",
                                      classes: "space-y-4",
                                      children: [
                                        Component.element(
                                          tag: "div",
                                          classes: "flex items-center justify-between",
                                          children: [
                                            Component.element(
                                              tag: "span",
                                              classes: "font-label-mono text-[20px] font-semibold text-primary",
                                              children: [
                                                Component.text("03"),
                                              ],
                                            ),
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
                                        Component.element(
                                          tag: "h3",
                                          classes: "font-headline-sm text-headline-sm text-on-surface font-medium",
                                          children: [
                                            Component.text(" Let's Talk About the Right Solution "),
                                          ],
                                        ),
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
        Component.element(
          tag: "footer",
          classes: "w-full bg-surface-container-lowest border-t border-[rgba(255,255,255,0.08)] py-16",
          children: [
            Component.element(
              tag: "div",
              classes: "max-w-7xl mx-auto px-6 sm:px-8",
              children: [
                Component.element(
                  tag: "div",
                  classes: "grid grid-cols-1 md:grid-cols-4 gap-10 mb-12",
                  children: [
                    Component.element(
                      tag: "div",
                      classes: "space-y-4",
                      children: [
                        Component.element(
                          tag: "div",
                          classes: "flex items-center gap-2",
                          children: [
                            Component.element(
                              tag: "span",
                              classes: "font-headline-sm text-headline-sm text-on-surface font-semibold",
                              children: [
                                Component.text("Brothers-Tech"),
                              ],
                            ),
                            Component.element(
                              tag: "span",
                              classes: "h-2 w-2 rounded-full bg-secondary shadow-[0_0_8px_#4cd7f6]",
                            ),
                          ],
                        ),
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
                    Component.element(
                      tag: "div",
                      children: [
                        Component.element(
                          tag: "h4",
                          classes: "font-label-mono text-label-mono text-on-surface uppercase tracking-wider mb-4",
                          children: [
                            Component.text(" Navigation "),
                          ],
                        ),
                        Component.element(
                          tag: "ul",
                          classes: "space-y-2.5 font-body-sm text-body-sm text-on-surface-variant",
                          children: [
                            Component.element(
                              tag: "li",
                              children: [
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
                            Component.element(
                              tag: "li",
                              children: [
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
                            Component.element(
                              tag: "li",
                              children: [
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
                            Component.element(
                              tag: "li",
                              children: [
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
                            Component.element(
                              tag: "li",
                              children: [
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
                    Component.element(
                      tag: "div",
                      children: [
                        Component.element(
                          tag: "h4",
                          classes: "font-label-mono text-label-mono text-on-surface uppercase tracking-wider mb-4",
                          children: [
                            Component.text(" Practices "),
                          ],
                        ),
                        Component.element(
                          tag: "ul",
                          classes: "space-y-2.5 font-body-sm text-body-sm text-on-surface-variant",
                          children: [
                            Component.element(
                              tag: "li",
                              children: [
                                Component.text("Full-Stack Platforms"),
                              ],
                            ),
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
                    Component.element(
                      tag: "div",
                      children: [
                        Component.element(
                          tag: "h4",
                          classes: "font-label-mono text-label-mono text-on-surface uppercase tracking-wider mb-4",
                          children: [
                            Component.text(" Studio "),
                          ],
                        ),
                        Component.element(
                          tag: "p",
                          classes: "font-body-sm text-body-sm text-on-surface-variant mb-4",
                          children: [
                            Component.text(" Engineering disciplined technical solutions with surgical execution. "),
                          ],
                        ),
                        Component.element(
                          tag: "div",
                          classes: "flex items-center gap-3 text-secondary font-label-mono text-label-mono",
                          children: [
                            Component.element(
                              tag: "span",
                              children: [
                                Component.text("EST. 2024"),
                              ],
                            ),
                            Component.element(
                              tag: "span",
                              classes: "inline-block w-1.5 h-1.5 rounded-full bg-secondary",
                            ),
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
                Component.element(
                  tag: "div",
                  classes:
                      "pt-8 border-t border-[rgba(255,255,255,0.06)] flex flex-col sm:flex-row items-center justify-between gap-4 font-label-mono text-label-mono-xs text-on-surface-variant",
                  children: [
                    Component.element(
                      tag: "p",
                      children: [
                        Component.text("© 2025 Brothers-Tech Studio. All rights reserved."),
                      ],
                    ),
                    Component.element(
                      tag: "div",
                      classes: "flex items-center gap-6",
                      children: [
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
