import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../components/service_card.dart';

class ServicesView extends StatelessComponent {
  @override
  Component build(BuildContext context) {
    return section(
                  id: "services",
                  classes: "w-full bg-surface py-20 lg:py-28 relative",
                  [
                    div(
                      classes: "max-w-7xl mx-auto px-6 sm:px-8",
                      [
                        div(
                          classes: "max-w-3xl mb-16 space-y-4",
                          [
                            div(
                              classes:
                                  "inline-flex items-center gap-2 font-label-mono text-label-mono uppercase tracking-wider text-secondary",
                              [
                                span(
                                  classes: "h-1.5 w-1.5 rounded-full bg-secondary",
                                  [],
                                ),
                                span(
                                  [.text("WHAT WE DO")],
                                ),
                              ],
                            ),
                            h2(
                              classes:
                                  "font-headline-lg text-headline-lg lg:text-[44px] lg:leading-[52px] text-on-surface font-semibold tracking-tight",
                              [
                                .text(" Everything You Need to Build Your Product. "),
                              ],
                            ),
                            p(
                              classes: "font-body-lg text-body-lg text-on-surface-variant leading-relaxed",
                              [
                                .text(
                                  " Brothers-Tech takes digital products from initial architecture and concept through robust engineering and global cloud deployment. ",
                                ),
                              ],
                            ),
                          ],
                        ),
                        div(
                          classes: "grid grid-cols-1 md:grid-cols-2 gap-6",
                          [
                            ServiceCard(
                              count: 1,
                              title: "Mobile App Development",
                              description:
                                  "High-quality Android and iOS applications designed for rapid performance, native gesture fidelity, and faultless offline resilience.",
                              iconName: "smartphone",
                              chips: ["Android", "iOS", "Cross-platform"],
                            ),
                            ServiceCard(
                              count: 2,
                              title: "Web Development",
                              description:
                                  "Modern websites, dynamic web applications, dashboards, and enterprise platforms architected for ultra-low latency and search discovery.",
                              iconName: "web",
                              chips: ["Web Apps", "Dashboards", "Business Platforms"],
                            ),
                            ServiceCard(
                              count: 3,
                              title: "Desktop Applications",
                              description:
                                  "Reliable desktop software, administrative terminals, and offline-capable management systems built seamlessly around complex operations.",
                              iconName: "desktop_windows",
                              chips: ["Desktop", "Management Systems", "Business Software"],
                            ),
                            ServiceCard(
                              count: 4,
                              title: "UI/UX Design",
                              description:
                                  "Clean and intuitive digital interfaces engineered around real user psychology, rigorous accessibility specs, and brand identity standards.",
                              iconName: "design_services",
                              chips: ["UI", "UX", "Product Design"],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                );
  }
}