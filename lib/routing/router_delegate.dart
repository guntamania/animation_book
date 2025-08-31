import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/app_state.dart' as models;
import '../pages/list_demo.dart';
import '../pages/riverpod_hooks_demo.dart';
import '../providers/app_state_provider.dart';

class AppRouterDelegate extends RouterDelegate<models.AppPage>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<models.AppPage> {
  
  final WidgetRef ref;
  
  AppRouterDelegate(this.ref) {
    // AppStateの変更を監視してnotifyListenersを呼ぶ
    ref.listen<models.AppState>(appStateProvider, (previous, next) {
      if (previous?.currentPage != next.currentPage) {
        notifyListeners();
      }
    });
  }
  
  @override
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  
  @override
  models.AppPage? get currentConfiguration {
    final appState = ref.read(appStateProvider);
    return appState.currentPage;
  }
  
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final appState = ref.watch(appStateProvider);
        
        return Navigator(
          key: navigatorKey,
          pages: _buildPages(appState.currentPage),
          onPopPage: _handlePopPage,
        );
      },
    );
  }
  
  List<Page> _buildPages(models.AppPage currentPage) {
    switch (currentPage) {
      case models.AppPage.listDemo:
        return [
          MaterialPage(
            key: const ValueKey('list-demo'),
            child: const ListDemo(),
          ),
        ];
      case models.AppPage.riverpodHooksDemo:
        return [
          MaterialPage(
            key: const ValueKey('riverpod-hooks-demo'),
            child: const RiverpodHooksDemo(),
          ),
        ];
    }
  }
  
  bool _handlePopPage(Route<dynamic> route, dynamic result) {
    if (!route.didPop(result)) return false;
    
    // ポップ時の処理（必要に応じて実装）
    
    return true;
  }
  
  @override
  Future<void> setNewRoutePath(models.AppPage configuration) async {
    // URLが変更された時にAppStateを更新
    ref.read(appStateProvider.notifier).setCurrentPage(configuration);
  }
}