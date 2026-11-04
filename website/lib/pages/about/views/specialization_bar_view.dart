import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class SpecializationBarView extends StatelessComponent {
  @override
  Component build(BuildContext context) {
    return section(
      classes: "relative w-full max-w-7xl mx-auto px-6 sm:px-8 py-10",
      [
        div(
          classes:
              "py-5 px-6 sm:px-10 rounded-xl bg-surface-container-lowest/80 backdrop-blur-md flex flex-wrap items-center justify-around gap-4 shadow-sm",
          [
            span(
              classes: "font-label-mono text-label-mono text-on-surface flex items-center gap-2 tracking-wider",
              [
                span(classes: "w-1.5 h-1.5 rounded-full bg-secondary shadow-[0_0_6px_#4cd7f6]", []),
                .text(" Mobile "),
              ],
            ),
            span(
              classes: "text-outline-variant/60",
              [
                .text("•"),
              ],
            ),
            span(
              classes: "font-label-mono text-label-mono text-on-surface flex items-center gap-2 tracking-wider",
              [
                span(classes: "w-1.5 h-1.5 rounded-full bg-primary shadow-[0_0_6px_#adc6ff]", []),
                .text(" Web "),
              ],
            ),
            span(
              classes: "text-outline-variant/60",
              [
                .text("•"),
              ],
            ),
            span(
              classes: "font-label-mono text-label-mono text-on-surface flex items-center gap-2 tracking-wider",
              [
                span(classes: "w-1.5 h-1.5 rounded-full bg-secondary shadow-[0_0_6px_#4cd7f6]", []),
                .text(" Desktop "),
              ],
            ),
            span(
              classes: "text-outline-variant/60",
              [
                .text("•"),
              ],
            ),
            span(
              classes: "font-label-mono text-label-mono text-on-surface flex items-center gap-2 tracking-wider",
              [
                span(classes: "w-1.5 h-1.5 rounded-full bg-secondary shadow-[0_0_6px_#4cd7f6]", []),
                .text(" UI/UX "),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
