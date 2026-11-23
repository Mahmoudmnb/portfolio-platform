import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import 'store_button.dart';

class ProjectCard extends StatelessComponent {
  final String dataCategories;
  final String imageSrc;
  final String imageAlt;
  final String platformLabel;
  final String categoryLabel;
  final String title;
  final String description;
  final List<String> bulletPoints;
  final List<String> tags;
  final String? androidUrl;
  final String? iosUrl;

  const ProjectCard({
    required this.dataCategories,
    required this.imageSrc,
    required this.imageAlt,
    required this.platformLabel,
    required this.categoryLabel,
    required this.title,
    required this.description,
    required this.bulletPoints,
    required this.tags,
    this.androidUrl,
    this.iosUrl,
    super.key,
  });

  @override
  Component build(BuildContext context) {
    return article(
      classes:
          'project-item rounded-xl bg-surface-container-low border border-outline-variant/30 hover:border-primary/50 transition-all duration-300 flex flex-col overflow-hidden group shadow-lg',
      attributes: {
        'data-categories': dataCategories,
      },
      [
        // Image Header
        div(
          classes: 'relative h-64 overflow-hidden border-b border-outline-variant/20 bg-surface-container-high',
          [
            img(
              classes: 'h-full w-full object-cover transition-transform duration-500 group-hover:scale-[1.02]',
              alt: imageAlt,
              loading: MediaLoading.lazy,
              src: imageSrc,
              attributes: {
                'decoding': 'async',
              },
            ),
          ],
        ),

        // Body Content
        div(
          classes: 'p-6 flex flex-col flex-1 justify-between space-y-4',
          [
            div([
              // Metadata Header
              div(
                classes: 'flex items-center justify-between mb-2',
                [
                  span(
                    classes: 'font-label-mono text-label-mono-xs text-secondary uppercase font-semibold',
                    [.text(platformLabel)],
                  ),
                  span(
                    classes: 'font-label-mono text-label-mono-xs text-on-surface-variant',
                    [.text(categoryLabel)],
                  ),
                ],
              ),

              // Title
              h4(
                classes:
                    'font-headline-sm text-headline-sm text-on-surface font-semibold group-hover:text-primary transition-colors',
                [.text(" $title ")],
              ),

              // Description
              p(
                classes: 'font-body-md text-body-md text-on-surface-variant mt-2 leading-relaxed',
                [.text(' $description ')],
              ),

              // Bullet points
              ul(
                classes: 'mt-3 space-y-1.5 font-body-sm text-body-sm text-on-surface-variant leading-relaxed',
                bulletPoints
                    .map(
                      (point) => li(
                        classes: 'flex gap-2',
                        [
                          span(classes: 'text-secondary', [.text('•')]),
                          span([.text(point)]),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ]),

            // Footer (Tags & Action Links)
            div(
              classes: 'pt-2',
              [
                // Tech Stack Tags
                div(
                  classes: 'flex flex-wrap gap-1.5 mb-4',
                  tags
                      .map(
                        (tag) => span(
                          classes: 'px-2 py-0.5 rounded bg-surface-container font-label-mono text-[11px] text-primary',
                          [.text(tag)],
                        ),
                      )
                      .toList(),
                ),

                div(
                  classes: 'flex flex-wrap gap-3',
                  [
                    if (androidUrl != null)
                      StoreButton(
                        href: androidUrl!,
                        label: 'Android',
                        type: StoreType.android,
                      ),
                    if (iosUrl != null)
                      StoreButton(
                        href: iosUrl!,
                        label: 'iOS',
                        type: StoreType.ios,
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
