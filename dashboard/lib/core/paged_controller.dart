import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:portfolio_api/portfolio_api.dart';

class PagedController extends ChangeNotifier {
  final PortfolioApi api;
  final Resource resource;
  final Map<String, dynamic> filters;
  List<Json> items = [];
  int page = 0, lastPage = 1, total = 0;
  bool loading = false;
  Object? error;
  CancelToken? _cancel;
  int _request = 0;
  Timer? _debounce;
  bool _disposed = false;
  PagedController(this.api, this.resource, {Map<String, dynamic>? filters})
    : filters = filters ?? {};
  void search(String value) {
    _debounce?.cancel();
    _cancel?.cancel();
    _request++;
    _debounce = Timer(const Duration(milliseconds: 350), () {
      filter('q', value);
    });
  }

  void filter(String key, dynamic value) {
    if (value == null || value == '') {
      filters.remove(key);
    } else {
      filters[key] = value;
    }
    load(reset: true);
  }

  Future<void> load({bool reset = false}) async {
    _cancel?.cancel();
    _cancel = CancelToken();
    final identity = ++_request;
    final next = reset ? 1 : page + 1;
    loading = true;
    error = null;
    notifyListeners();
    try {
      final result = await api.list(
        resource,
        query: {...filters, 'page': next, 'per_page': 20},
        cancel: _cancel,
      );
      if (_disposed || identity != _request) return;
      final merged = reset ? <Json>[] : List<Json>.of(items);
      for (final item in result.items) {
        final i = merged.indexWhere((v) => v['id'] == item['id']);
        if (i < 0) {
          merged.add(item);
        } else {
          merged[i] = item;
        }
      }
      items = merged;
      page = result.meta.current_page;
      lastPage = result.meta.last_page;
      total = result.meta.total;
    } catch (e) {
      if (!_disposed && identity == _request) error = e;
    } finally {
      if (!_disposed && identity == _request) {
        loading = false;
        notifyListeners();
      }
    }
  }

  @override
  void dispose() {
    _disposed = true;
    _request++;
    _cancel?.cancel();
    _debounce?.cancel();
    super.dispose();
  }
}
