import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../core/components/app_footer.dart';
import '../../core/components/app_header.dart';
import 'components/feature_matric_card.dart';
import 'views/feature_metrics_bar.dart';
import '../../core/components/get_in_touch_view.dart';
import 'views/how_we_work_view.dart';
import 'views/intro_view.dart';
import 'views/selected_work_view.dart';
import 'views/services_view.dart';
import 'views/why_us_view.dart';

class HomePage extends StatelessComponent {
  const HomePage();
  @override
  Component build(BuildContext context) {
    return .fragment([
      Document.html(attributes: const {'class': 'dark'}),
      Document.head(
        title: 'Brothers-Tech | Software That Moves Businesses Forward',
        meta: {
          'description':
              'Brothers-Tech designs and develops reliable mobile, web, and desktop software for real business needs.',
        },
      ),
      Document.body(
        attributes: {'class': "bg-background font-body-md text-on-surface antialiased min-h-screen flex flex-col"},
      ),
      .fragment([
        AppHeader(
          tabs: [
            (name: "Home", url: "/", isSelected: true),
            (name: "Services", url: "/services", isSelected: false),
            (name: "Projects", url: "/projects", isSelected: false),
            (name: "About", url: "/about", isSelected: false),
            (name: "Contact", url: "/contact", isSelected: false),
          ],
        ),
        main_(
          classes: "w-full pt-20 bg-background flex-1",
          [
            div(
              classes: "flex flex-col w-full",
              [
                IntroView(),
                FeatureMetricsBar(),
                ServicesView(),
                SelectedWorkView(),
                WhyUsView(),
                HowWeWorkView(),
                GetInTouchView(),
              ],
            ),
          ],
        ),
        AppFooter(),
      ]),
    ]);
  }
}
