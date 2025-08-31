// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$counterHash() => r'a035dd4316a1f3d94de1be092e0d4a8989987132';

/// See also [counter].
@ProviderFor(counter)
final counterProvider = AutoDisposeProvider<int>.internal(
  counter,
  name: r'counterProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$counterHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CounterRef = AutoDisposeProviderRef<int>;
String _$isLoadingHash() => r'98134f2d3b23b6755e81786f17cf1d733a23c4b8';

/// See also [isLoading].
@ProviderFor(isLoading)
final isLoadingProvider = AutoDisposeProvider<bool>.internal(
  isLoading,
  name: r'isLoadingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$isLoadingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef IsLoadingRef = AutoDisposeProviderRef<bool>;
String _$userNameHash() => r'0b469b189d416387af1f49d2319439bb1d08ef75';

/// See also [userName].
@ProviderFor(userName)
final userNameProvider = AutoDisposeProvider<String>.internal(
  userName,
  name: r'userNameProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userNameHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UserNameRef = AutoDisposeProviderRef<String>;
String _$themeHash() => r'f2b5f22841838a07c63b3ce031d994b823fb2033';

/// See also [theme].
@ProviderFor(theme)
final themeProvider = AutoDisposeProvider<models.AppTheme>.internal(
  theme,
  name: r'themeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$themeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ThemeRef = AutoDisposeProviderRef<models.AppTheme>;
String _$appStateHash() => r'0027589657db8f358c38baaad9f93f616c2bbb4d';

/// See also [AppState].
@ProviderFor(AppState)
final appStateProvider =
    AutoDisposeNotifierProvider<AppState, models.AppState>.internal(
      AppState.new,
      name: r'appStateProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$appStateHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$AppState = AutoDisposeNotifier<models.AppState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
