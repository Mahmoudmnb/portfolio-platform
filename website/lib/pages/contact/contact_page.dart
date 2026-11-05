import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../core/components/app_footer.dart';
import '../../core/components/app_header.dart';
import 'views/contact_form_view.dart';
import 'views/what_next_view.dart';

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
        children: [
          link(href: "favicon.svg", rel: "icon", type: "image/svg+xml"),
        ],
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
                    ContactFormView(),
                    WhatNextView(),
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
