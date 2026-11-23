import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class SelectedWorkCard extends StatelessComponent {
  final String title, subtitle, description, primaryImageUrl;
  final List<({String name, String iconName, String url})> links;
  final List<String> tags;
  final List<({String url, int? top, int? bottom, int? left, int? right})> secondaryImages;

  const SelectedWorkCard({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.primaryImageUrl,
    this.links = const [],
    this.tags = const [],
    this.secondaryImages = const [],
  });

  @override
  Component build(BuildContext context) {
    return div(
      classes:
          "p-8 rounded-2xl bg-surface-container border border-outline-variant/30 hover:border-primary/40 transition-all duration-300 flex flex-col justify-between group",
      [
        div(
          classes: "space-y-4",
          [
            if (secondaryImages.isEmpty)
              div(
                classes:
                    "aspect-video rounded-xl bg-surface-container-low border border-outline-variant/30 overflow-hidden group-hover:border-secondary/40 transition-colors",
                [
                  img(
                    classes: "block w-full h-full object-cover",
                    src: primaryImageUrl,
                    alt: "Primary image",
                    loading: .lazy,
                  ),
                ],
              )
            else
              div(
                classes:
                    'relative h-72 sm:h-80 rounded-xl bg-surface-container-low border border-outline-variant/30 overflow-hidden group-hover:border-primary/40 transition-colors',
                [
                  div(
                    classes:
                        'absolute top-3 left-3 right-3 overflow-hidden rounded-lg border border-outline-variant/40 bg-surface-container-lowest shadow-xl',
                    [
                      img(
                        classes: 'block w-full h-auto',
                        src: primaryImageUrl,
                        alt: 'Secondary images project',
                        loading: .lazy,
                      ),
                    ],
                  ),
                  ...secondaryImages.map(
                    (secondaryImage) => div(
                      classes:
                          'absolute ${secondaryImage.top != null ? "top-${secondaryImage.top}" : ""} ${secondaryImage.left != null ? "left-${secondaryImage.left}" : ""} ${secondaryImage.right != null ? "right-${secondaryImage.right}" : ""} ${secondaryImage.bottom != null ? "bottom-${secondaryImage.bottom}" : ""} sm:left-4 w-24 sm:w-28',
                      [
                        img(
                          classes: 'block w-full h-auto',
                          src: secondaryImage.url,
                          alt: 'Primary image project',
                          loading: .lazy,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            div(
              classes: "font-label-mono-xs text-label-mono-xs text-secondary uppercase tracking-wider pt-2",
              [
                .text(" $subtitle "),
              ],
            ),
            h3(
              classes:
                  "font-headline-md text-headline-md text-on-surface font-semibold group-hover:text-primary transition-colors",
              [
                .text(" $title "),
              ],
            ),
            p(
              classes: "font-body-md text-body-md text-on-surface-variant leading-relaxed",
              [
                .text(
                  description,
                ),
              ],
            ),
          ],
        ),
        div(
          classes: "pt-6 flex flex-wrap gap-2",
          [
            ...tags.map(
              (tag) => span(
                classes:
                    "px-2.5 py-1 rounded bg-surface-container-high text-on-surface-variant font-label-mono-xs text-label-mono-xs border border-outline-variant/20",
                [
                  .text(tag),
                ],
              ),
            ),
            div(
              classes: 'basis-full flex flex-wrap items-center gap-3 pt-2',
              List.generate(links.length, (index) {
                final tempLink = links[index];
                if (index.isEven) {
                  return a(
                    classes:
                        'w-fit flex-none inline-flex items-center gap-2 px-5 py-2.5 rounded-lg bg-primary-container text-on-primary-container font-body-md text-body-md font-semibold hover:bg-primary transition-all shadow-[0_0_18px_rgba(77,142,255,0.25)] group/android',
                    href: tempLink.url,
                    target: .blank,
                    attributes: {
                      'rel': 'noopener noreferrer',
                      'aria-label': 'Download Drisavo for Android from Google Play',
                    },
                    [
                      span(
                        classes: 'material-symbols-outlined text-lg',
                        [.text(tempLink.iconName)],
                      ),
                      span([.text(tempLink.name)]),
                      span(
                        classes:
                            'material-symbols-outlined text-base group-hover/android:translate-x-1 transition-transform',
                        [.text('open_in_new')],
                      ),
                    ],
                  );
                }
                return a(
                  classes:
                      'w-fit flex-none inline-flex items-center gap-2 px-5 py-2.5 rounded-lg bg-surface-container-high text-on-surface font-body-md text-body-md font-semibold border border-outline-variant/40 hover:border-secondary/60 hover:text-secondary transition-all group/store',
                  href: tempLink.url,
                  target: .blank,
                  attributes: {
                    'rel': 'noopener noreferrer',
                    'aria-label': 'Download Drisavo from the App Store',
                  },
                  [
                    // Apple Icon
                    svg(
                      classes: 'w-5 h-5 fill-current',
                      viewBox: '0 0 384 512',
                      attributes: {
                        'aria-hidden': 'true',
                      },
                      [
                        path(
                          d: 'M318.7 268.7c-.2-36.7 16.4-64.4 50-84.8-18.8-26.9-47.2-41.7-84.7-44.6-35.5-2.8-74.3 20.7-88.5 20.7-15 0-49.4-19.7-76.4-19.7C63.3 141.2 4 184.8 4 273.5c0 26.9 4.9 54.6 14.8 83.1 13.2 36.7 60.8 126.7 110.5 125.2 26-.6 44.3-18.4 78.2-18.4 32.9 0 49.8 18.4 78.8 18.4 50.1-.7 93.3-82.5 105.9-119.3-67.1-31.6-73.5-93.3-73.5-95.6zm-23.2-164.2c27.3-32.4 24.8-61.9 24-72.5-24.1 1.4-52 16.4-67.9 34.9-17.5 19.8-27.8 44.3-25.6 71.9 26.1 2 49.9-11.4 69.5-34.3z',
                          [],
                        ),
                      ],
                    ),
                    span([.text(tempLink.name)]),
                    span(
                      classes:
                          'material-symbols-outlined text-base group-hover/store:translate-x-1 transition-transform',
                      [.text('open_in_new')],
                    ),
                  ],
                );
              }).toList(),
            ),
          ],
        ),
      ],
    );
  }
}
