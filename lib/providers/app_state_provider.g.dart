// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$counterHash() => r'39abd8e265a09e307e4146fcbc1cac09acba5adc';

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
String _$isLoadingHash() => r'aa7a2eae8516e392b7fc82e393c6ef624628303f';

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
String _$userNameHash() => r'c6750f19d70c3ba8f4b18fd64582effda805c267';

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
String _$themeHash() => r'419a3b11cec99dd2206321eef857bfe82031c191';

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
String _$appStateHash() => r'13f22b8bb529b3ec4ed55d363b372a6d91ca5f78';

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
