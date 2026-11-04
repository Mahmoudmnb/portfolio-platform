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
      List<Project> projects = await getProjects();

      if (projects.isEmpty) {
        return EmptyCard(
          title: "No Projects Available",
          description: "There are no projects to display right now. Check back soon for new updates and additions!",
        );
      }
      return section(
        classes: "w-full max-w-7xl mx-auto px-6 sm:px-8 mb-24",
        [
          div(
            id: "projects-grid",
            classes: "grid grid-cols-1 md:grid-cols-2 gap-8",
            projects
                .map<ProjectCard>(
                  (project) => ProjectCard(
                    dataCategories: 'mobile',
                    imageSrc: project.cover.url,
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
                )
                .toList(),
          ),
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
