import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_state.freezed.dart';
part 'app_state.g.dart';

@freezed
abstract class AppState with _$AppState {
  const AppState._();

  factory AppState({
    required int counter,
    required bool isLoading,
    required String userName,
    required AppTheme theme,
    required AppPage currentPage,
  }) = _AppState;

  factory AppState.fromJson(Map<String, dynamic> json) => _$AppStateFromJson(json);
}

enum AppTheme { light, dark }

extension AppThemeExtension on AppTheme {
  String get displayName {
    switch (this) {
      case AppTheme.light:
        return 'ライト';
      case AppTheme.dark:
        return 'ダーク';
    }
  }
}

enum AppPage { listDemo, riverpodHooksDemo }

extension AppPageExtension on AppPage {
  String get path {
    switch (this) {
      case AppPage.listDemo:
        return '/list-demo';
      case AppPage.riverpodHooksDemo:
        return '/riverpod-hooks-demo';
    }
  }

  String get displayName {
    switch (this) {
      case AppPage.listDemo:
        return 'リストデモ';
      case AppPage.riverpodHooksDemo:
        return 'Riverpod Hooksデモ';
    }
  }
}
