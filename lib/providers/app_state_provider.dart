import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/app_state.dart' as models;

part 'app_state_provider.g.dart';

@riverpod
class AppState extends _$AppState {
  @override
  models.AppState build() {
    return const models.AppState(
      counter: 0,
      isLoading: false,
      userName: 'ユーザー',
      theme: models.AppTheme.light,
      currentPage: models.AppPage.riverpodHooksDemo,
    );
  }

  void increment() {
    state = state.copyWith(counter: state.counter + 1);
  }

  void decrement() {
    if (state.counter > 0) {
      state = state.copyWith(counter: state.counter - 1);
    }
  }

  void reset() {
    state = state.copyWith(counter: 0);
  }

  Future<void> incrementAsync() async {
    state = state.copyWith(isLoading: true);
    
    await Future.delayed(const Duration(seconds: 1));
    
    state = state.copyWith(
      counter: state.counter + 1,
      isLoading: false,
    );
  }

  void setUserName(String name) {
    state = state.copyWith(userName: name);
  }

  void toggleTheme() {
    final newTheme = state.theme == models.AppTheme.light 
        ? models.AppTheme.dark 
        : models.AppTheme.light;
    state = state.copyWith(theme: newTheme);
  }

  void setLoading(bool loading) {
    state = state.copyWith(isLoading: loading);
  }

  void setCurrentPage(models.AppPage page) {
    state = state.copyWith(currentPage: page);
  }
}

@riverpod
int counter(Ref ref) {
  return ref.watch(appStateProvider).counter;
}

@riverpod
bool isLoading(Ref ref) {
  return ref.watch(appStateProvider).isLoading;
}

@riverpod
String userName(Ref ref) {
  return ref.watch(appStateProvider).userName;
}

@riverpod
models.AppTheme theme(Ref ref) {
  return ref.watch(appStateProvider).theme;
}