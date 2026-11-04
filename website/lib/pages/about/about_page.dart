import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../core/components/app_footer.dart';
import '../../core/components/app_header.dart';
import '../../core/components/get_in_touch_view.dart';
import 'views/core_principles_view.dart';
import 'views/intro_about_us_view.dart';
import 'views/our_journey_view.dart';
import 'views/philosophies_view.dart';
import 'views/specialization_bar_view.dart';
import 'views/team_members_view.dart';

class AboutPage extends StatelessComponent {
  const AboutPage();
  @override
  Component build(BuildContext context) {
    return .fragment([
      Document.html(attributes: const {'class': 'dark'}),
      Document.head(
        title: 'About | Brothers-Tech',
        meta: {
          'description': 'Meet the Brothers-Tech team and learn how we build practical, reliable digital products.',
        },
      ),
      Document.body(
        attributes: {'class': "bg-background font-body-md text-on-surface antialiased min-h-screen flex flex-col"},
      ),
      Component.fragment([
        AppHeader(
          tabs: [
            (name: "Home", url: "/", isSelected: false),
            (name: "Services", url: "/services", isSelected: false),
            (name: "Projects", url: "/projects", isSelected: false),
            (name: "About", url: "/about", isSelected: true),
            (name: "Contact", url: "/contact", isSelected: false),
          ],
        ),
        main_(
          classes: "w-full pt-20 bg-background flex-1",
          [
            div(
              classes: "flex flex-col w-full",
              [
                div(
                  classes: "relative w-full overflow-hidden",
                  [
                    div(
                      classes:
                          "pointer-events-none absolute -top-40 left-1/2 -translate-x-1/2 w-[720px] h-[360px] bg-primary/10 rounded-full blur-[140px] opacity-70",
                      [],
                    ),
                    div(
                      classes:
                          "pointer-events-none absolute top-[30%] -right-40 w-[480px] h-[300px] bg-secondary/10 rounded-full blur-[120px] opacity-60",
                      [],
                    ),
                    div(
                      classes:
                          "pointer-events-none absolute top-[70%] -left-32 w-[500px] h-[300px] bg-primary-container/10 rounded-full blur-[130px] opacity-50",
                      [],
                    ),
                    IntroAboutUsView(),
                    CorePrinciplesView(),
                    OurJourneyView(),
                    PhilosophiesView(),
                    TeamMembersView(),
                    SpecializationBarView(),
                    GetInTouchView(),
                  ],
                ),
              ],
            ),
          ],
        ),
        AppFooter(),
      ]),
    ]);
  }
}
