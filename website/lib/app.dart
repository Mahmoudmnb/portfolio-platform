import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

import 'pages/about/about_page.dart';
import 'pages/contact/contact_page.dart';
import 'pages/home/home_page.dart';
import 'pages/projects/projects_page.dart';
import 'pages/services/services_page.dart';

class App extends StatelessComponent {
  const App({super.key});

  @override
  Component build(BuildContext context) {
    return Router(
      routes: [
        Route(
          path: '/',
          title: 'Brothers-Tech | Software That Moves Businesses Forward',
          builder: (_, _) => const HomePage(),
        ),
        Route(
          path: '/services',
          title: 'Services | Brothers-Tech',
          builder: (_, _) => const ServicesPage(),
        ),
        Route(
          path: '/projects',
          title: 'Projects | Brothers-Tech',
          builder: (_, _) => const ProjectsPage(),
        ),
        Route(
          path: '/about',
          title: 'About | Brothers-Tech',
          builder: (_, _) => const AboutPage(),
        ),
        Route(
          path: '/contact',
          title: 'Contact | Brothers-Tech',
          builder: (_, _) => const ContactPage(),
        ),
      ],
    );
  }
}
