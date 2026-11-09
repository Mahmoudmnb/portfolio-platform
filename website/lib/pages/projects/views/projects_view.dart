import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:jaspr/dom.dart';

import 'package:jaspr/server.dart';

import '../../../core/models/project.dart';
import '../../../core/utils/app_constants.dart';
import '../components/project_card.dart';

class ProjectsView extends AsyncStatelessComponent {
  @override
  Future<Component> build(BuildContext context) async {
    try {
      // List<Project> projects = await getProjects();
      await Future.delayed(const Duration(milliseconds: 300));

      // if (projects.isEmpty) {
      //   return EmptyCard(
      //     title: "No Projects Available",
      //     description: "There are no projects to display right now. Check back soon for new updates and additions!",
      //   );
      // }
      return section(
        classes: "w-full max-w-7xl mx-auto px-6 sm:px-8 mb-24",
        [
          div(id: "projects-grid", classes: "grid grid-cols-1 md:grid-cols-2 gap-8", [
            ProjectCard(
              dataCategories: 'mobile',
              imageSrc: 'assets/images/prime/prime_all.png',
              imageAlt: 'Prime medical education platform on desktop and mobile devices',
              platformLabel: 'Mobile • iOS & Android',
              categoryLabel: 'MEDICAL EDUCATION',
              title: 'Prime - Medical Education Platform',
              description: 'Mobile learning platform for medical students at Aleppo University.',
              bulletPoints: const [
                'Built question banks, previous exams, videos, PDFs, and learning resources.',
                'Integrated an AI assistant and offline content access.',
                'Implemented content encryption.',
              ],
              tags: const ['AI Integration', 'Encryption', 'Videos & PDFs', 'Offline Access'],
              androidUrl: 'https://play.google.com/store/apps/details?id=com.brothers.prime',
              iosUrl: 'https://apps.apple.com/us/app/prime/id6758918919',
            ),

            ProjectCard(
              dataCategories: 'mobile',
              imageSrc: 'assets/images/al-nadha/al-nadha_all.png',
              imageAlt: 'Ala Al-Nadha multi-service delivery platform on desktop and mobile devices',
              platformLabel: 'Mobile • iOS & Android',
              categoryLabel: 'DELIVERY PLATFORM',
              title: "ع الندهة | Ala Al-Nadha — Multi-Service Delivery Platform",
              description:
                  'Multi-service platform for food delivery, grocery shopping, and cleaning services across Aleppo.',
              bulletPoints: const [
                'Developed restaurant, supermarket, and cleaning-service ordering flows within one application.',
                'Built smart voice search that converts natural Arabic speech into relevant stores, products, and search keywords.',
                'Implemented location-based delivery, order management, offers, and a streamlined experience.',
              ],
              tags: const ['Voice Search', 'Location Services', 'Order Management'],
              androidUrl: 'https://play.google.com/store/apps/details?id=com.alnadha.app',
              iosUrl: 'https://play.google.com/store/apps/details?id=com.alnadha.app',
            ),
            ProjectCard(
              dataCategories: 'mobile',
              imageSrc: 'assets/images/drisavo/drisavo-all.png',
              imageAlt: 'Drisavo driving school booking platform on desktop and mobile devices',
              platformLabel: 'Mobile • iOS',
              categoryLabel: 'CANADIAN MARKET',
              title: 'Drisavo - Driving School Booking Platform',
              description: 'Driving lesson booking platform for the Canadian market.',
              bulletPoints: const [
                'Built dedicated student and instructor experiences with real-time lesson booking.',
                'Implemented chat, digital wallet payments, and driving-hour purchases.',
                'Added student progress tracking for parents.',
              ],
              tags: const [
                'Flutter',
                'Dart',
                'REST APIs',
                'Chat',
                'Payments',
                'Real-time Features',
              ],
              iosUrl: 'https://apps.apple.com/us/app/drisavo/id6759968663',
              // Omit `androidUrl` since this card only targets iOS.
            ),
            ProjectCard(
              dataCategories: 'mobile',
              imageSrc: 'assets/images/prime-bac/drisavo-bac-all.png',
              imageAlt: 'Prime Bac baccalaureate learning platform on desktop and mobile devices',
              platformLabel: 'Learning Platform',
              categoryLabel: 'BACCALAUREATE',
              title: 'Prime Bac - Baccalaureate Learning Platform',
              description:
                  'Educational platform for Baccalaureate students focused on exam preparation and study organization.',
              bulletPoints: const [
                'Developed chapter, section, and full-course tests with interactive learning resources.',
                'Implemented student-instructor communication and study task scheduling.',
                'Extended the Prime platform with productivity and learning-management features.',
              ],
              tags: const [
                'Real-time Communication',
                'Task Management',
                'Offline Access',
              ],
              // Omit `androidUrl` and `iosUrl` since this card has no external store links
            ),
            ProjectCard(
              dataCategories: 'mobile',
              imageSrc: 'assets/images/elegance/elegance-all.png',
              imageAlt: 'Elegance e-commerce shopping app on desktop and mobile devices',
              platformLabel: 'Mobile • iOS & Android',
              categoryLabel: 'E-COMMERCE',
              title: 'Elegance - E-Commerce Shop App',
              description:
                  'A polished cross-platform shopping app that lets customers browse products, shop offline, manage their cart, and complete secure purchases through PayPal.',
              bulletPoints: const [], // No bullet list in this card's raw markup
              tags: const [
                'Offline Access',
                'PayPal Payment',
                'Android/iOS',
              ],
              // Omit `androidUrl` and `iosUrl` since no store links were provided in this markup
            ),
          ]),
        ],
      );
    } catch (e) {
      return ErrorCard(error: e.toString());
    }
  }

  Future<List<Project>> getProjects() async {
    http.Response res = await http.get(Uri.parse("${AppConstants.entries}?per_page=100"));
    if (res.statusCode == 200) {
      final List<dynamic> projectsRaw = jsonDecode(res.body)["data"];
      return projectsRaw.map<Project>((project) => Project.fromJson(project)).toList();
    } else {
      final body = jsonDecode(res.body);
      throw body["message"] ?? res.body;
    }
  }
}

class EmptyCard extends StatelessComponent {
  final String title, description;

  EmptyCard({super.key, required this.title, required this.description});
  @override
  Component build(BuildContext context) {
    return section(
      classes: "w-full max-w-7xl mx-auto px-6 sm:px-8 mb-24",
      [
        div(
          id: "empty-projects-container",
          classes:
              "flex flex-col items-center justify-center p-16 bg-zinc-900/50 border border-zinc-800 rounded-2xl text-center shadow-sm",
          [
            div(
              classes:
                  "w-16 h-16 bg-zinc-800 text-zinc-400 rounded-full flex items-center justify-center mb-6 shadow-inner",
              [
                span(classes: "text-2xl", [.text("📂")]),
              ],
            ),
            h3(
              classes: "text-xl font-bold text-zinc-100 mb-2",
              [.text(title)],
            ),
            p(
              classes: "text-zinc-400 max-w-md mb-6",
              [.text(description)],
            ),
          ],
        ),
      ],
    );
  }
}

class ErrorCard extends StatelessComponent {
  final String error;

  ErrorCard({super.key, required this.error});
  @override
  Component build(BuildContext context) {
    return section(
      classes: "w-full max-w-7xl mx-auto px-6 sm:px-8 mb-24",
      [
        div(
          id: "error-container",
          classes:
              "flex flex-col items-center justify-center p-12 bg-red-950/30 border border-red-900/50 rounded-2xl text-center shadow-sm",
          [
            div(
              classes:
                  "w-16 h-16 bg-red-900/40 text-red-400 rounded-full flex items-center justify-center mb-6 shadow-inner",
              [
                span(classes: "text-3xl font-bold", [.text("!")]),
              ],
            ),
            h3(
              classes: "text-xl font-bold text-red-200 mb-2",
              [.text("Failed to Load Content")],
            ),
            p(
              classes: "text-red-300 max-w-md mb-6",
              [.text("Something went wrong while fetching the data. $error")],
            ),
          ],
        ),
      ],
    );
  }
}
