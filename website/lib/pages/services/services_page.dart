import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../core/components/app_footer.dart';
import '../../core/components/app_header.dart';
import '../../core/components/get_in_touch_view.dart';
import 'views/how_we_build_view.dart';
import 'views/our_services_view.dart';
import 'views/features_view.dart';
import 'views/solutions_view.dart';

class ServicesPage extends StatelessComponent {
  const ServicesPage();
  @override
  Component build(BuildContext context) {
    return .fragment([
      Document.html(attributes: const {'class': 'dark'}),
      Document.head(
        title: 'Services | Brothers-Tech',
        meta: {
          'description': 'Explore Brothers-Tech mobile, web, desktop, cloud, and AI software development services.',
        },
      ),
      Document.body(attributes: {'class': "bg-surface font-body-md text-on-surface antialiased"}),

      Component.fragment([
        AppHeader(
          tabs: [
            (name: "Home", url: "/", isSelected: false),
            (name: "Services", url: "/services", isSelected: true),
            (name: "Projects", url: "/projects", isSelected: false),
            (name: "About", url: "/about", isSelected: false),
            (name: "Contact", url: "/contact", isSelected: false),
          ],
        ),
        main_(
          classes: "w-full pt-20 bg-surface min-h-[calc(100vh-20rem)]",
          [
            div(
              classes: "flex flex-col w-full",
              [
                OurServicesView(),
                FeaturesView(),
                HowWeBuildView(),
                SolutionsView(),
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
