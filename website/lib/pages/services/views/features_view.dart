import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../components/feature_card.dart';

class FeaturesView extends StatelessComponent {
  const FeaturesView({super.key});

  @override
  Component build(BuildContext context) {
    return section(classes: 'w-full px-6 lg:px-12 py-12 flex flex-col gap-24 lg:gap-32 max-w-7xl mx-auto', [
      const FeatureCard(
        tag: '01 • Mobile Applications',
        title: 'Mobile Applications',
        description:
            'Reliable Android and iOS applications designed around your users and business goals. We handle the full journey from planning and design to store release and ongoing improvements.',
        imageSrc: 'assets/images/all_products.png',
        imageAlt: 'Brothers-Tech mobile application portfolio',
      ),
      const FeatureCard(
        tag: '02 • Web Platforms',
        title: 'Web Platforms, Applications & High-Density Dashboards',
        description:
            'Professional websites, customer portals, booking systems, dashboards, and business tools designed to be fast, accessible, easy to use, and ready to grow with your business.',
        imageSrc: 'assets/images/drisavo/drisavo-website.png',
        imageAlt: 'Drisavo web booking platform',
        reversed: true,
      ),
      const FeatureCard(
        tag: '03 • Desktop Applications',
        title: 'Desktop Software & Operations Workstations',
        description:
            'Reliable desktop software designed to simplify daily operations, organize complex workflows, manage important data, and help teams work efficiently—even when an internet connection is unavailable.',
        imageSrc: 'assets/images/desktop-apps.png',
        imageAlt: 'Brothers-Tech desktop software portfolio',
      ),
    ]);
  }
}
