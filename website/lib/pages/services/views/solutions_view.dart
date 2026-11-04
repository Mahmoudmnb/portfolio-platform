import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../components/solution_card.dart';

class SolutionsView extends StatelessComponent {
  @override
  Component build(BuildContext context) {
    return section(
      classes: "w-full px-6 lg:px-12 py-20 bg-surface-container-lowest",
      [
        div(
          classes: "max-w-7xl mx-auto flex flex-col items-center",
          [
            div(
              classes: "text-center max-w-3xl mb-16",
              [
                div(
                  classes:
                      "inline-flex items-center px-3.5 py-1 rounded-full bg-surface-container text-secondary font-label-mono-xs text-label-mono-xs uppercase tracking-widest font-semibold mb-space-sm",
                  [
                    .text(" Product Taxonomy "),
                  ],
                ),
                h2(
                  classes: "font-headline-lg text-headline-lg text-on-surface tracking-tight leading-tight mb-space-sm",
                  [
                    .text(" Software Solutions Tailored to Your Industry. "),
                  ],
                ),
                p(
                  classes: "font-body-lg text-body-lg text-on-surface-variant leading-relaxed",
                  [
                    .text(
                      " From complex enterprise workflow tools to customer-facing platforms, we engineer purpose-built systems. ",
                    ),
                  ],
                ),
              ],
            ),
            div(
              classes: "grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6 w-full",
              [
                div(
                  classes:
                      "p-6 rounded-2xl bg-surface-container flex flex-col justify-between shadow-sm hover:bg-surface-container-high transition-colors",
                  [
                    div(
                      [
                        div(
                          classes:
                              "w-10 h-10 rounded-lg bg-surface-container-highest flex items-center justify-center mb-4",
                          [
                            span(
                              classes: "material-symbols-outlined text-secondary text-[22px]",
                              [
                                .text("corporate_fare"),
                              ],
                            ),
                          ],
                        ),
                        h3(
                          classes: "font-headline-sm text-headline-sm text-on-surface font-semibold mb-2",
                          [
                            .text(" Business Applications "),
                          ],
                        ),
                        p(
                          classes: "font-body-md text-body-md text-on-surface-variant",
                          [
                            .text(
                              " Internal operations tools, automated resource planning, and custom ERP systems engineered for high-concurrency business data. ",
                            ),
                          ],
                        ),
                      ],
                    ),
                    div(
                      classes:
                          "mt-4 pt-3 flex items-center gap-2 text-on-surface-variant font-label-mono-xs text-label-mono-xs",
                      [
                        span(classes: "w-1.5 h-1.5 rounded-full bg-secondary", []),
                        span(
                          [
                            .text("Enterprise Ops • ERP"),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                SolutionCard(
                  iconName: 'school',
                  title: 'Educational Platforms',
                  description:
                      'Interactive Learning Management Systems (LMS), real-time virtual classroom software, student portals, and grading pipelines.',
                  footerText: 'LMS • Interactive Portals',
                ),
                SolutionCard(
                  iconName: 'inventory_2',
                  title: 'Management Systems',
                  description:
                      'High-accuracy inventory tracking, fleet dispatch management, supply-chain dashboards, and real-time asset control centers.',
                  footerText: 'Fleet • Logistics • Supply',
                ),
                SolutionCard(
                  iconName: 'shopping_cart',
                  title: 'E-commerce Solutions',
                  description:
                      'High-conversion checkout flows, custom multi-vendor marketplaces, dynamic catalog indexing, and low-latency inventory syncing.',
                  footerText: 'Marketplaces • Checkout',
                ),
                SolutionCard(
                  iconName: 'monitoring',
                  title: 'Dashboards & Analytics',
                  description:
                      'High-density telemetry dashboards, real-time streaming data visualizers, executive KPI portals, and custom report builders.',
                  footerText: 'Telemetry • Real-Time KPIs',
                ),
                SolutionCard(
                  iconName: 'admin_panel_settings',
                  title: 'Admin Panels',
                  description:
                      'Granular role-based access control portals, immutable audit logging, team administration consoles, and support tooling.',
                  footerText: 'RBAC • Audit Logs • Tools',
                ),
                SolutionCard(
                  iconName: 'extension',
                  title: 'Custom Software & Bespoke Engines',
                  description:
                      'Specialized proprietary algorithms, offline native automation workstations, local hardware-interfacing software, and mission-critical enterprise utilities built strictly to your specifications.',
                  footerText: 'Hardware Interfacing • Bespoke Engineering • Custom Protocols',
                  customClasses: 'md:col-span-2 xl:col-span-2',
                  iconBgClass: 'bg-secondary/10',
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
