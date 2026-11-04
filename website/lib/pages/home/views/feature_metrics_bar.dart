import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../components/feature_matric_card.dart';

class FeatureMetricsBar extends StatelessComponent {
  @override
  Component build(BuildContext context) {
    return section(
      classes: "w-full bg-surface-container-lowest border-y border-outline-variant/20 py-8",
      [
        div(
          classes: "max-w-7xl mx-auto px-6 sm:px-8",
          [
            div(
              classes:
                  "grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6 lg:gap-8 divide-y sm:divide-y-0 sm:divide-x divide-outline-variant/20",
              [
                const FeatureMetricCard(
                  iconName: "deployed_code",
                  title: "Real-World Products",
                  description: "Software built for actual users, stress-tested workflows, and commercial viability.",
                  colorTheme: .primary,
                ),
                const FeatureMetricCard(
                  iconName: "devices",
                  title: "Multi-Platform",
                  description: "Android • iOS • Web • Desktop",
                  colorTheme: .secondary,
                  descriptionClasses:
                      "font-body-sm text-body-sm text-on-surface-variant font-label-mono text-secondary",
                ),
                const FeatureMetricCard(
                  iconName: "account_tree",
                  title: "End-to-End Dev",
                  description: "From architectural whiteboard to production deployment and lifecycle support.",
                  colorTheme: .primary,
                ),
                const FeatureMetricCard(
                  iconName: "bolt",
                  title: "Modern Tech Stack",
                  description: "Scalable, maintainable, cloud-native architecture without vendor bloat.",
                  colorTheme: .secondary,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
