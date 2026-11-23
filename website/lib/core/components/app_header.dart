import 'package:jaspr/dom.dart';
import 'package:jaspr/server.dart';

class AppHeader extends StatelessComponent {
  final List<({String name, String url, bool isSelected})> tabs;
  const AppHeader({required this.tabs});
  @override
  Component build(BuildContext context) {
    return header(
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
                    .text("Brothers-Tech"),
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
              List.generate(
                tabs.length,
                (index) => a(
                  classes:
                      "px-4 py-2 text-on-surface-variant font-body-md text-body-md hover:text-on-surface hover:bg-surface-container-high transition-colors rounded-lg",
                  href: tabs[index].url,
                  attributes: {
                    "data-path": "services",
                    if (tabs[index].isSelected) "aria-current": "page",
                  },
                  [
                    .text(tabs[index].name),
                  ],
                ),
              ),
               // [
              //   a(
              //     classes: "px-4 py-2 transition-colors bg-surface-container-high text-primary font-medium rounded-lg",
              //     href: "/",
              //     attributes: {
              //       "aria-current": "page",
              //       "data-path": "home",
              //     },
              //     [
              //       .text("Home"),
              //     ],
              //   ),
              //   a(
              //     classes:
              //         "px-4 py-2 text-on-surface-variant font-body-md text-body-md hover:text-on-surface hover:bg-surface-container-high transition-colors rounded-lg",
              //     href: "/services",
              //     attributes: {
              //       "data-path": "services",
              //     },
              //     [
              //       .text("Services"),
              //     ],
              //   ),
              //   a(
              //     classes:
              //         "px-4 py-2 text-on-surface-variant font-body-md text-body-md hover:text-on-surface hover:bg-surface-container-high transition-colors rounded-lg",
              //     href: "/projects",
              //     attributes: {
              //       "data-path": "projects",
              //     },
              //     [
              //       .text("Projects"),
              //     ],
              //   ),
              //   a(
              //     classes:
              //         "px-4 py-2 text-on-surface-variant font-body-md text-body-md hover:text-on-surface hover:bg-surface-container-high transition-colors rounded-lg",
              //     href: "/about",
              //     attributes: {
              //       "data-path": "about",
              //     },
              //     [
              //       .text("About"),
              //     ],
              //   ),
              //   a(
              //     classes:
              //         "px-4 py-2 text-on-surface-variant font-body-md text-body-md hover:text-on-surface hover:bg-surface-container-high transition-colors rounded-lg",
              //     href: "/contact",
              //     attributes: {
              //       "data-path": "contact",
              //     },
              //     [
              //       .text("Contact"),
              //     ],
              //   ),
              // ],
            
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
                    .text("Start a Project →"),
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
