import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class ServiceCard extends StatelessComponent {
  final int count;
  final String iconName, title, description;
  final List<String> chips;

  ServiceCard({
    super.key,
    required this.count,
    required this.iconName,
    required this.title,
    required this.description,
    required this.chips,
  });

  @override
  Component build(BuildContext context) {
    return div(
      classes:
          "p-8 rounded-2xl bg-surface-container border border-outline-variant/30 hover:border-primary/50 transition-all duration-300 flex flex-col justify-between group relative overflow-hidden",
      [
        div(
          classes:
              "absolute -right-10 -bottom-10 w-40 h-40 bg-primary/5 rounded-full blur-2xl group-hover:bg-primary/10 transition-colors pointer-events-none",
          [],
        ),
        div(
          classes: "space-y-4",
          [
            div(
              classes: "flex items-center justify-between",
              [
                span(
                  classes: "font-label-mono text-headline-md text-primary font-semibold",
                  [
                    .text(count.toString().padLeft(2, "0")),
                  ],
                ),
                div(
                  classes:
                      "w-10 h-10 rounded-lg bg-surface-container-high flex items-center justify-center text-primary group-hover:text-secondary transition-colors",
                  [
                    span(
                      classes: "material-symbols-outlined",
                      [
                        .text(iconName),
                      ],
                    ),
                  ],
                ),
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
                  " $description ",
                ),
              ],
            ),
          ],
        ),

        div(
          classes: "pt-8 flex flex-wrap gap-2",
          chips
              .map(
                (chip) => span(
                  classes:
                      "px-2.5 py-1 rounded bg-surface-container-high text-on-surface-variant font-label-mono-xs text-label-mono-xs border border-outline-variant/20",
                  [
                    .text(chip),
                  ],
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
