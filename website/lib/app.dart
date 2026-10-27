import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

import 'pages/site_page.dart';

class App extends StatelessComponent {
  const App({super.key});

  @override
  Component build(BuildContext context) {
    return Router(
      routes: [
        Route(
          path: '/',
          title: 'Brothers-Tech | Software That Moves Businesses Forward',
          builder: (_, _) => const SitePage(page: 'home'),
        ),
        Route(
          path: '/services',
          title: 'Services | Brothers-Tech',
          builder: (_, _) => const SitePage(page: 'services'),
        ),
        Route(
          path: '/projects',
          title: 'Projects | Brothers-Tech',
          builder: (_, _) => const SitePage(page: 'projects'),
        ),
        Route(
          path: '/about',
          title: 'About | Brothers-Tech',
          builder: (_, _) => const SitePage(page: 'about'),
        ),
        Route(
          path: '/contact',
          title: 'Contact | Brothers-Tech',
          builder: (_, _) => const SitePage(page: 'contact'),
        ),
      ],
    );
  }
}
