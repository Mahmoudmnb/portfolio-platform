import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class AppFooter extends StatelessComponent {
  const AppFooter();
  @override
  Component build(BuildContext context) {
    return  footer(
          classes: "w-full bg-surface-container-lowest border-t border-[rgba(255,255,255,0.08)] py-16",
          [
            div(
              classes: "max-w-7xl mx-auto px-6 sm:px-8",
              [
                div(
                  classes: "grid grid-cols-1 md:grid-cols-4 gap-10 mb-12",
                  [
                    Component.element(
                      tag: "div",
                      classes: "space-y-4",
                      children: [
                        div(
                          classes: "flex items-center gap-2",
                          [
                            span(
                              classes: "font-headline-sm text-headline-sm text-on-surface font-semibold",
                              [
                                .text("Brothers-Tech"),
                              ],
                            ),
                            span(classes: "h-2 w-2 rounded-full bg-secondary shadow-[0_0_8px_#4cd7f6]", []),
                          ],
                        ),
                        p(
                          classes: "font-body-sm text-body-sm text-on-surface-variant leading-relaxed",
                          [
                            .text(
                              " Architecting elite software systems, AI infrastructure, and mission-critical cloud platforms for modern enterprises. ",
                            ),
                          ],
                        ),
                      ],
                    ),
                    div(
                      [
                        h4(
                          classes: "font-label-mono text-label-mono text-on-surface uppercase tracking-wider mb-4",
                          [
                            .text(" Navigation "),
                          ],
                        ),
                        ul(
                          classes: "space-y-2.5 font-body-sm text-body-sm text-on-surface-variant",
                          [
                            li(
                              [
                                a(
                                  classes: "hover:text-primary transition-colors",
                                  href: "/",
                                  attributes: {
                                    "data-path": "home",
                                  },
                                  [
                                    .text("Home"),
                                  ],
                                ),
                              ],
                            ),
                            li(
                              [
                                a(
                                  classes: "hover:text-primary transition-colors",
                                  href: "/services",
                                  attributes: {
                                    "data-path": "services",
                                  },
                                  [
                                    .text("Services"),
                                  ],
                                ),
                              ],
                            ),
                            li(
                              [
                                a(
                                  classes: "hover:text-primary transition-colors",
                                  href: "/projects",
                                  attributes: {
                                    "data-path": "projects",
                                  },
                                  [
                                    .text("Projects"),
                                  ],
                                ),
                              ],
                            ),
                            li(
                              [
                                a(
                                  classes: "hover:text-primary transition-colors",
                                  href: "/about",
                                  attributes: {
                                    "data-path": "about",
                                  },
                                  [
                                    .text("About"),
                                  ],
                                ),
                              ],
                            ),
                            li(
                              [
                                a(
                                  classes: "hover:text-primary transition-colors",
                                  href: "/contact",
                                  attributes: {
                                    "data-path": "contact",
                                  },
                                  [
                                    .text("Contact"),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    div(
                      [
                        h4(
                          classes: "font-label-mono text-label-mono text-on-surface uppercase tracking-wider mb-4",
                          [
                            .text(" Practices "),
                          ],
                        ),
                        ul(
                          classes: "space-y-2.5 font-body-sm text-body-sm text-on-surface-variant",
                          [
                            li(
                              [
                                .text("Full-Stack Platforms"),
                              ],
                            ),
                            li(
                              [
                                .text("AI & Machine Learning"),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    div(
                      [
                        h4(
                          classes: "font-label-mono text-label-mono text-on-surface uppercase tracking-wider mb-4",
                          [
                            .text(" Studio "),
                          ],
                        ),
                        p(
                          classes: "font-body-sm text-body-sm text-on-surface-variant mb-4",
                          [
                            .text(" Engineering disciplined technical solutions with surgical execution. "),
                          ],
                        ),
                        div(
                          classes: "flex items-center gap-3 text-secondary font-label-mono text-label-mono",
                          [
                            span(
                              [
                                .text("EST. 2024"),
                              ],
                            ),
                            span(classes: "inline-block w-1.5 h-1.5 rounded-full bg-secondary", []),
                            span(
                              [
                                .text("GLOBAL CORE"),
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
                      "pt-8 border-t border-[rgba(255,255,255,0.06)] flex flex-col sm:flex-row items-center justify-between gap-4 font-label-mono text-label-mono-xs text-on-surface-variant",
                  [
                    p(
                      [
                        .text("© 2025 Brothers-Tech Studio. All rights reserved."),
                      ],
                    ),
                    div(
                      classes: "flex items-center gap-6",
                      [
                        a(
                          classes: "hover:text-on-surface transition-colors",
                          href: "#",

                          [
                            .text("Security Policy"),
                          ],
                        ),
                        a(
                          classes: "hover:text-on-surface transition-colors",
                          href: "#",

                          [
                            .text("Terms of Service"),
                          ],
                        ),
                        a(
                          classes: "hover:text-on-surface transition-colors",
                          href: "#",
                          [
                            .text("Privacy Architecture"),
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
