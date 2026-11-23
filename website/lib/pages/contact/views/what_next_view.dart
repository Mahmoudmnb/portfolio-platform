import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../components/step_card.dart';

class WhatNextView extends StatelessComponent {
  @override
  Component build(BuildContext context) {
    return section(
      classes: "w-full bg-surface-container-lowest/70 border-y border-outline-variant/30 py-20 relative",
      [
        div(
          classes: "max-w-7xl mx-auto px-6 sm:px-8",
          [
            div(
              classes: "max-w-2xl mb-12",
              [
                span(
                  classes: "font-label-mono text-label-mono text-secondary tracking-widest uppercase block mb-2",
                  [
                    .text("What Happens Next?"),
                  ],
                ),
                h2(
                  classes: "font-headline-lg text-headline-lg text-on-surface font-semibold tracking-tight",
                  [
                    .text(" A Simple, Transparent Start. "),
                  ],
                ),
              ],
            ),
            div(
              classes: "grid grid-cols-1 md:grid-cols-3 gap-6 relative",
              [
                const StepCard(
                  stepNumber: "01",
                  iconName: "description",
                  title: " Tell Us About Your Idea ",
                  description: " Submit the inquiry form with an overview of what you want to build or improve. ",
                ),
                const StepCard(
                  stepNumber: "02",
                  iconName: "manage_search",
                  title: " We'll Review Your Needs ",
                  description:
                      " A technical lead reviews your requirements, scope, and feasibility within our engineering team. ",
                  colorTheme: .secondary,
                ),
                const StepCard(
                  stepNumber: "03",
                  iconName: "forum",
                  title: " Let's Talk About the Right Solution ",
                  description:
                      " We arrange an introductory technical discussion to map architecture, timelines, and pragmatic next steps. ",
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
