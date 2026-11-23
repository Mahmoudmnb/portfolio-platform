import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../components/step_card.dart';

class HowWeBuildView extends StatelessComponent {
  @override
  Component build(BuildContext context) {
    return section(
      classes: "w-full px-6 lg:px-12 py-20 max-w-7xl mx-auto",
      [
        div(
          classes: "flex flex-col md:flex-row md:items-end justify-between mb-16 gap-6",
          [
            div(
              [
                div(
                  classes:
                      "inline-flex items-center px-3 py-1 rounded-md bg-surface-container-high text-secondary font-label-mono-xs text-label-mono-xs uppercase tracking-wider mb-space-sm",
                  [
                    .text(" Engineering Delivery Framework "),
                  ],
                ),
                h2(
                  classes: "font-headline-lg text-headline-lg text-on-surface tracking-tight",
                  [
                    .text(" How We Build. "),
                  ],
                ),
              ],
            ),
            p(
              classes: "font-body-lg text-body-lg text-on-surface-variant max-w-md",
              [
                .text(
                  " A disciplined, transparent delivery framework from initial whiteboard to continuous production support. ",
                ),
              ],
            ),
          ],
        ),
        div(
          classes: "grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6",
          [
            StepCard(
              stepTag: '01 // DISCOVERY',
              iconName: 'architecture',
              title: 'Plan',
              description:
                  'Requirements discovery, technical architecture blueprint, database schema planning, API specs, and a milestone-driven roadmap.',
              deliverable: 'Technical RFC & Spec',
            ),
            StepCard(
              stepTag: '02 // PROTOTYPING',
              iconName: 'palette',
              title: 'Design',
              description:
                  'User journey mapping, wireframing, high-fidelity UI design, tokenized design systems, and interactive clickable prototypes in Figma.',
              deliverable: 'Design Tokens & Prototypes',
            ),
            StepCard(
              stepTag: '03 // EXECUTION',
              iconName: 'terminal',
              title: 'Develop',
              description:
                  'Full-stack engineering, strict static typing, clean modular architectural patterns, local unit tests, and continuous pull-request reviews.',
              deliverable: 'Staging Deployment Builds',
            ),
            StepCard(
              stepTag: '04 // VERIFICATION',
              iconName: 'checklist',
              title: 'Test',
              description:
                  'Automated regression suites, cross-browser/device testing, penetration audits, load testing, and edge case resilience verification.',
              deliverable: 'QA & Security Audit Report',
            ),
            StepCard(
              stepTag: '05 // ROLLOUT',
              iconName: 'rocket_launch',
              title: 'Deploy',
              description:
                  'Automated CI/CD orchestration, zero-downtime containerized infrastructure, DNS provisioning, and App Store / Google Play submissions.',
              deliverable: 'Production Release Verified',
            ),
            StepCard(
              stepTag: '06 // MAINTENANCE',
              iconName: 'health_and_safety',
              title: 'Support',
              description:
                  'Continuous real-time telemetry monitoring, error tracking, infrastructure maintenance, security patching, and ongoing feature iteration.',
              deliverable: '24/7 SLA & Telemetry Logs',
            ),
          ],
        ),
      ],
    );
  }
}
