import 'package:jaspr/jaspr.dart';

import '../components/generated/site_pages.g.dart';
import '../interop/browser_interactions.dart';

@client
class SitePage extends StatefulComponent {
  const SitePage({required this.page, super.key});

  final String page;

  @override
  State<SitePage> createState() => SitePageState();
}

class SitePageState extends State<SitePage> {
  @override
  void initState() {
    super.initState();
    if (kIsWeb) scheduleBrowserInteractions();
  }

  @override
  Component build(BuildContext context) {
    final (title, description, bodyClasses, content) = switch (component.page) {
      'services' => (
        'Services | Brothers-Tech',
        'Explore Brothers-Tech mobile, web, desktop, cloud, and AI software development services.',
        servicesBodyClasses,
        buildServicesPage(),
      ),
      'projects' => (
        'Projects | Brothers-Tech',
        'Explore mobile, web, and desktop products designed and deployed by Brothers-Tech.',
        projectsBodyClasses,
        buildProjectsPage(),
      ),
      'about' => (
        'About | Brothers-Tech',
        'Meet the Brothers-Tech team and learn how we build practical, reliable digital products.',
        aboutBodyClasses,
        buildAboutPage(),
      ),
      'contact' => (
        'Contact | Brothers-Tech',
        'Tell Brothers-Tech about your software idea, product improvement, or business challenge.',
        contactBodyClasses,
        buildContactPage(),
      ),
      _ => (
        'Brothers-Tech | Software That Moves Businesses Forward',
        'Brothers-Tech designs and develops reliable mobile, web, and desktop software for real business needs.',
        homeBodyClasses,
        buildHomePage(),
      ),
    };

    return Component.fragment([
      Document.html(attributes: const {'class': 'dark'}),
      Document.head(title: title, meta: {'description': description}),
      Document.body(attributes: {'class': bodyClasses}),
      content,
    ]);
  }
}
