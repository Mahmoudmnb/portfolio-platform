import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../components/project_card.dart';

class ProjectsView extends StatelessComponent {
  @override
  Component build(BuildContext context) {
    return section(
      classes: "w-full max-w-7xl mx-auto px-6 sm:px-8 mb-24",
      [
        div(
          id: "projects-grid",
          classes: "grid grid-cols-1 md:grid-cols-2 gap-8",
          [
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
          ],
        ),
      ],
    );
  }
}
