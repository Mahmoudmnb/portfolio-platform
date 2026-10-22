import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio_api/portfolio_api.dart';

import '../core/session.dart';
import '../core/ui.dart';
import '../features/auth.dart';
import '../features/resource_list.dart';
import '../features/editor.dart';
import '../features/media.dart';
import '../features/reports.dart';
import '../features/account.dart';
import 'theme.dart';

import 'package:flutter_svg/flutter_svg.dart';

class DashboardApp extends StatelessWidget {
  final OwnerSession session;
  const DashboardApp({super.key, required this.session});
  @override
  Widget build(BuildContext context) => AnimatedBuilder(
    animation: session,
    builder: (context, _) => _SessionRouter(
      key: ValueKey(session.privateGeneration),
      session: session,
    ),
  );
}

class _SessionRouter extends StatefulWidget {
  final OwnerSession session;
  const _SessionRouter({super.key, required this.session});
  @override
  State<_SessionRouter> createState() => _DashboardAppState();
}

class _DashboardAppState extends State<_SessionRouter> {
  late final GoRouter router;
  @override
  void initState() {
    super.initState();
    router = GoRouter(
      initialLocation: '/overview',
      refreshListenable: widget.session,
      redirect: (c, s) {
        final state = widget.session.state;
        final checking = [
          SessionState.checking,
          SessionState.offline,
          SessionState.forbidden,
        ].contains(state);
        if (checking) return s.uri.path == '/check' ? null : '/check';
        if (state != SessionState.authenticated) {
          return s.uri.path == '/login' ? null : '/login';
        }
        if (['/check', '/login'].contains(s.uri.path)) return '/overview';
        return null;
      },
      routes: [
        GoRoute(path: '/login', builder: (_, _) => const LoginScreen()),
        GoRoute(path: '/check', builder: (_, _) => const SessionCheck()),
        StatefulShellRoute.indexedStack(
          builder: (c, s, shell) =>
              DashboardShell(shell, key: ValueKey(widget.session.epoch)),
          branches: [
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/overview',
                  builder: (_, _) => const OverviewScreen(),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/content',
                  builder: (_, _) => const ResourceListScreen(Resource.entries),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/inbox',
                  builder: (_, _) =>
                      const ResourceListScreen(Resource.inquiries),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(path: '/more', builder: (_, _) => const MoreScreen()),
              ],
            ),
          ],
        ),
        for (final r in [
          Resource.entries,
          Resource.team,
          Resource.services,
          Resource.categories,
          Resource.technologies,
          Resource.inquiries,
        ])
          GoRoute(
            path: '/${r.path}/:id',
            builder: (c, s) => EditorScreen(
              r.path,
              id: s.pathParameters['id'] == 'new'
                  ? null
                  : int.tryParse(s.pathParameters['id']!),
            ),
          ),
        for (final r in [
          Resource.team,
          Resource.services,
          Resource.categories,
          Resource.technologies,
          Resource.media,
          Resource.audit,
        ])
          GoRoute(path: '/${r.path}', builder: (_, _) => ResourceListScreen(r)),
        GoRoute(
          path: '/media/:id',
          builder: (c, s) =>
              MediaDetailScreen(int.parse(s.pathParameters['id']!)),
        ),
        GoRoute(
          path: '/taxonomies',
          builder: (_, _) => const TaxonomiesScreen(),
        ),
        GoRoute(
          path: '/site-settings',
          builder: (_, _) => const EditorScreen('site-settings'),
        ),
        GoRoute(path: '/analytics', builder: (_, _) => const AnalyticsScreen()),
        GoRoute(path: '/account', builder: (_, _) => const AccountScreen()),
      ],
    );
  }

  @override
  void dispose() {
    router.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => MaterialApp.router(
    title: 'Bannan Studio',
    debugShowCheckedModeBanner: false,
    theme: brandTheme(),
    routerConfig: router,
  );
}

class DashboardShell extends StatelessWidget {
  final StatefulNavigationShell shell;
  const DashboardShell(this.shell, {super.key});
  @override
  Widget build(BuildContext context) =>
      Scaffold(body: shell, bottomNavigationBar: _StudioNavigation(shell));
}

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('More')),
    body: SafeArea(
      child: PageBody(
        children: [
          Text(
            'Manage your studio',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 24),
          for (final e in {
            'team-members': 'Team',
            'services': 'Services',
            'media': 'Media library',
            'taxonomies': 'Categories & technologies',
            'analytics': 'Analytics',
            'site-settings': 'Site settings',
            'audit-events': 'Activity log',
            'account': 'Account & security',
          }.entries)
            Card(
              child: ListTile(
                contentPadding: const EdgeInsets.all(16),
                title: Text(e.value),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => context.push('/${e.key}'),
              ),
            ),
        ],
      ),
    ),
  );
}

class TaxonomiesScreen extends StatelessWidget {
  const TaxonomiesScreen({super.key});
  @override
  Widget build(BuildContext context) => DefaultTabController(
    length: 2,
    child: Scaffold(
      appBar: AppBar(
        title: const Text('Categories & technologies'),
        bottom: const TabBar(
          tabs: [
            Tab(text: 'Categories'),
            Tab(text: 'Technologies'),
          ],
        ),
      ),
      body: const TabBarView(
        children: [
          ResourceListScreen(Resource.categories),
          ResourceListScreen(Resource.technologies),
        ],
      ),
    ),
  );
}

class _StudioNavigation extends StatelessWidget {
  final StatefulNavigationShell shell;
  const _StudioNavigation(this.shell);
  @override
  Widget build(BuildContext context) {
    const labels = ['Overview', 'Content', 'Inbox', 'More'];
    final large =
        MediaQuery.textScalerOf(context).scale(12) > 18 &&
        MediaQuery.sizeOf(context).width < 600;
    Widget destination(int i) => Expanded(
      child: Semantics(
        selected: shell.currentIndex == i,
        button: true,
        label: labels[i],
        onTap: () => shell.goBranch(i),
        child: ExcludeSemantics(
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: Material(
              color: shell.currentIndex == i
                  ? const Color(0xFFE5F2EC)
                  : Colors.white,
              borderRadius: BorderRadius.circular(12),
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () => shell.goBranch(i),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FigmaNavigationIcon(index: i, tab: shell.currentIndex),
                      const SizedBox(height: 4),
                      Text(
                        labels[i],
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: shell.currentIndex == i ? teal : muted,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
    return Material(
      color: Colors.white,
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: large
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(children: [destination(0), destination(1)]),
                    Row(children: [destination(2), destination(3)]),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [for (var i = 0; i < 4; i++) destination(i)],
                ),
        ),
      ),
    );
  }
}

class FigmaNavigationIcon extends StatelessWidget {
  final int index, tab;
  const FigmaNavigationIcon({
    super.key,
    required this.index,
    required this.tab,
  });
  @override
  Widget build(BuildContext context) {
    const names = [
      'imgHomeIcon',
      'imgContentIcon',
      'imgInboxIcon',
      'imgMoreIcon',
    ];
    final prefix = tab == 1
        ? '03'
        : tab == 3
        ? '06'
        : '02';
    return SizedBox.square(
      dimension: 24,
      child: SvgPicture.asset(
        'assets/figma/$prefix-${names[index]}.svg',
        excludeFromSemantics: true,
      ),
    );
  }
}
