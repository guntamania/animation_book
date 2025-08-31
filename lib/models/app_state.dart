import 'package:flutter/foundation.dart';

@immutable
class AppState {
  const AppState({required this.counter, required this.isLoading, required this.userName, required this.theme, required this.currentPage});

  final int counter;
  final bool isLoading;
  final String userName;
  final AppTheme theme;
  final AppPage currentPage;

  AppState copyWith({int? counter, bool? isLoading, String? userName, AppTheme? theme, AppPage? currentPage}) {
    return AppState(
      counter: counter ?? this.counter,
      isLoading: isLoading ?? this.isLoading,
      userName: userName ?? this.userName,
      theme: theme ?? this.theme,
      currentPage: currentPage ?? this.currentPage,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AppState &&
        other.counter == counter &&
        other.isLoading == isLoading &&
        other.userName == userName &&
        other.theme == theme &&
        other.currentPage == currentPage;
  }

  @override
  int get hashCode {
    return counter.hashCode ^ isLoading.hashCode ^ userName.hashCode ^ theme.hashCode ^ currentPage.hashCode;
  }

  @override
  String toString() {
    return 'AppState(counter: $counter, isLoading: $isLoading, userName: $userName, theme: $theme, currentPage: $currentPage)';
  }
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
