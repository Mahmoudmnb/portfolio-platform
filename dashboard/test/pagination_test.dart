import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_admin/core/paged_controller.dart';
import 'package:portfolio_api/portfolio_api.dart';

class ControlledApi extends PortfolioApi {
  final pending = <Completer<ApiPage>>[];
  ControlledApi()
    : super('https://example.test/api/v1', credentials: () => null);
  @override
  Future<ApiPage> list(Resource r, {Json? query, CancelToken? cancel}) {
    final c = Completer<ApiPage>();
    pending.add(c);
    return c.future;
  }
}

ApiPage page(int p, List<int> ids) => ApiPage(
  ids.map((id) => <String, dynamic>{'id': id}).toList(),
  PaginationMeta(current_page: p, per_page: 2, last_page: 3, total: 5),
);
void main() {
  test('out-of-order completion cannot overwrite the active filter', () async {
    final api = ControlledApi();
    final data = PagedController(api, Resource.entries);
    final a = data.load(reset: true);
    final b = data.load(reset: true);
    api.pending[1].complete(page(1, [2]));
    await b;
    api.pending[0].complete(page(1, [1]));
    await a;
    expect(data.items.single['id'], 2);
    data.dispose();
  });
  test(
    'later-page failure keeps content and retries same page with deduplication',
    () async {
      final api = ControlledApi();
      final data = PagedController(api, Resource.entries);
      final a = data.load(reset: true);
      api.pending[0].complete(page(1, [1, 2]));
      await a;
      final b = data.load();
      api.pending[1].completeError(const ApiFailure('Offline'));
      await b;
      expect(data.items.length, 2);
      expect(data.page, 1);
      final c = data.load();
      api.pending[2].complete(page(2, [2, 3]));
      await c;
      expect(data.items.map((e) => e['id']), [1, 2, 3]);
      expect(data.total, 5);
      data.dispose();
    },
  );
  testWidgets('search debounces and resets page', (tester) async {
    final api = ControlledApi();
    final data = PagedController(api, Resource.entries);
    data.search('a');
    await tester.pump(const Duration(milliseconds: 200));
    data.search('ab');
    await tester.pump(const Duration(milliseconds: 349));
    expect(api.pending, isEmpty);
    await tester.pump(const Duration(milliseconds: 1));
    expect(api.pending.length, 1);
    expect(data.filters['q'], 'ab');
    api.pending.single.complete(page(1, []));
    await tester.pump();
    data.dispose();
  });
}
