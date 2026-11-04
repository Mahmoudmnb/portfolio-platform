import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../components/delivery_card.dart';

class DeliveryView extends StatelessComponent {
  @override
  Component build(BuildContext context) {
    return section(
      classes: "w-full bg-surface-container-lowest border-y border-outline-variant/20 py-16 mb-20",
      [
        div(
          classes: "max-w-7xl mx-auto px-6 sm:px-8",
          [
            div(
              classes: "mb-10 flex flex-col sm:flex-row sm:items-end justify-between gap-4",
              [
                div(
                  [
                    span(
                      classes:
                          "font-label-mono text-label-mono-xs text-secondary uppercase tracking-widest font-semibold",
                      [
                        .text("Engineered Precision"),
                      ],
                    ),
                    h3(
                      classes: "font-headline-md text-headline-md text-on-surface font-semibold mt-1",
                      [
                        .text(" Multi-Disciplinary Delivery "),
                      ],
                    ),
                  ],
                ),
                p(
                  classes: "font-body-sm text-body-sm text-on-surface-variant max-w-md",
                  [
                    .text(
                      " Every platform engineered by Brothers-Tech is built with production-grade telemetry, strict code audits, and uncompromising uptime standards. ",
                    ),
                  ],
                ),
              ],
            ),
            div(
              classes: "grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6",
              [
                DeliveryCard(
                  icon: "phone_android",
                  title: "Mobile Apps",
                  description: "Native and cross-platform mobile apps for iOS and Android with 60fps gesture fidelity.",
                  colorTheme: .secondary,
                ),
                DeliveryCard(
                  icon: "web",
                  title: "Web Platforms",
                  description:
                      "Complex web applications, responsive SaaS portals, and high-performance digital platforms.",
                ),
                DeliveryCard(
                  icon: "desktop_windows",
                  title: "Desktop Systems",
                  description:
                      "Native macOS and Windows administrative tools, terminals, and offline-capable software.",
                  colorTheme: .secondary,
                ),
                DeliveryCard(
                  icon: "dns",
                  title: "Secure Data & Integrations",
                  description:
                      "Reliable data management, secure connections with business tools, and systems designed to grow with your product.",
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
