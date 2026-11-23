import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../components/primary_selected_work_card.dart';
import '../components/selected_work_card.dart';

class SelectedWorkView extends StatelessComponent {
  @override
  Component build(BuildContext context) {
    return section(
      id: "selected-work",
      classes: "w-full bg-surface-container-low py-20 lg:py-28 relative",
      [
        div(
          classes: "max-w-7xl mx-auto px-6 sm:px-8",
          [
            div(
              classes: "flex flex-col md:flex-row md:items-end justify-between mb-16 gap-6",
              [
                div(
                  classes: "max-w-2xl space-y-4",
                  [
                    div(
                      classes:
                          "inline-flex items-center gap-2 font-label-mono text-label-mono uppercase tracking-wider text-secondary",
                      [
                        span(classes: "h-1.5 w-1.5 rounded-full bg-secondary", []),
                        span([
                          .text("SELECTED WORK"),
                        ]),
                      ],
                    ),
                    h2(
                      classes:
                          "font-headline-lg text-headline-lg lg:text-[44px] lg:leading-[52px] text-on-surface font-semibold tracking-tight",
                      [
                        .text(" Software Built for the Real World. "),
                      ],
                    ),
                    p(
                      classes: "font-body-lg text-body-lg text-on-surface-variant",
                      [
                        .text(
                          " Showcase of selected applications and digital platforms engineered by Brothers-Tech. ",
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            PrimarySelectedWorkCard(),
            div(
              classes: "grid grid-cols-1 md:grid-cols-2 gap-8",
              [
                SelectedWorkCard(
                  subtitle: "Quran Institute Management System • Android • Desktop",
                  title: "Alsaad Institute",
                  description:
                      "A multi-platform institute management system with separate applications for administrators, teachers, and students.",
                  primaryImageUrl: 'assets/images/alsaad/admin-desktop.png',
                  secondaryImages: [
                    (
                      url: 'assets/images/alsaad/user-mobile.png',
                      top: null,
                      bottom: 0,
                      left: 3,
                      right: null,
                    ),
                  ],
                  tags: ["Admin Portal", "Teacher App", "Student App", "Academic Tracking"],
                  links: [
                    (
                      name: "Android",
                      url: "https://play.google.com/store/apps/details?id=com.brothers.alsaad_mosque_institute",
                      iconName: "android",
                    ),
                  ],
                ),
                SelectedWorkCard(
                  subtitle: "Driving School Booking Platform • Canadian Market",
                  title: "Drisavo - Driving School Booking Platform",
                  description: "Driving lesson booking platform for the Canadian market.",
                  primaryImageUrl: 'assets/images/drisavo/cover.png',
                  tags: ["Android/iOS", "Chat", "Payment", "Map Tracking"],
                  links: [
                    (
                      name: "Android",
                      url: "https://play.google.com/store/apps/details?id=com.mkhalid.drisavo",
                      iconName: "android",
                    ),
                    (
                      name: "IOS",
                      url: "https://play.google.com/store/apps/details?id=com.mkhalid.drisavo",
                      iconName: "android",
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
