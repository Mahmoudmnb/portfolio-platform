library;

import 'package:jaspr/dom.dart';
import 'package:jaspr/server.dart';

import 'app.dart';
import 'main.server.options.dart';
import 'styles/site_styles.dart';
import 'styles/tailwind_theme.g.dart';

void main() {
  Jaspr.initializeApp(options: defaultServerOptions);

  runApp(
    Document(
      title: 'Brothers-Tech',
      lang: 'en',
      meta: const {
        'theme-color': '#0f131c',
        'shell-type': 'web_standard',
      },
      styles: siteStyles,
      head: [
        link(href: "favicon.svg", rel: "icon", type: "image/svg+xml"),
        link(rel: 'preconnect', href: 'https://fonts.googleapis.com'),
        link(
          rel: 'preconnect',
          href: 'https://fonts.gstatic.com',
          attributes: {
            'crossorigin': '',
          },
        ),
        link(
          rel: 'stylesheet',
          href:
              'https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200&family=Geist:wght@100..900&family=JetBrains+Mono:wght@100..900&display=swap',
        ),
        script(src: 'https://cdn.tailwindcss.com'),
        script(content: 'tailwind.config = $tailwindThemeJson;'),
      ],
      body: const App(),
    ),
  );
}
