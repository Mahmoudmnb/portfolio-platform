import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../core/components/app_footer.dart';
import '../../core/components/app_header.dart';
import '../../core/components/get_in_touch_view.dart';
import 'components/primary_project_card.dart';
import 'views/delivery_view.dart';
import 'views/intro_projects_view.dart';
import 'views/projects_view.dart';

class ProjectsPage extends StatelessComponent {
  const ProjectsPage();
  @override
  Component build(BuildContext context) {
    return .fragment([
      Document.html(attributes: const {'class': 'dark'}),
      Document.head(
        title: 'Projects | Brothers-Tech',
        meta: {
          'description': 'Explore mobile, web, and desktop products designed and deployed by Brothers-Tech.',
        },
        children: [
          link(href: "favicon.svg", rel: "icon", type: "image/svg+xml"),
        ],
      ),
      Document.body(
        attributes: {'class': "bg-background font-body-md text-on-surface antialiased min-h-screen flex flex-col"},
      ),
      Component.fragment([
        AppHeader(
          tabs: [
            (name: "Home", url: "/", isSelected: false),
            (name: "Services", url: "/services", isSelected: false),
            (name: "Projects", url: "/projects", isSelected: true),
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
                IntroProjectsView(),
                PrimaryProjectCard(),
                ProjectsView(),
                DeliveryView(),
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
