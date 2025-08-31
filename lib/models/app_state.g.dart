// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppState _$AppStateFromJson(Map<String, dynamic> json) => _AppState(
  counter: (json['counter'] as num).toInt(),
  isLoading: json['isLoading'] as bool,
  userName: json['userName'] as String,
  theme: $enumDecode(_$AppThemeEnumMap, json['theme']),
  currentPage: $enumDecode(_$AppPageEnumMap, json['currentPage']),
);

Map<String, dynamic> _$AppStateToJson(_AppState instance) => <String, dynamic>{
  'counter': instance.counter,
  'isLoading': instance.isLoading,
  'userName': instance.userName,
  'theme': _$AppThemeEnumMap[instance.theme]!,
  'currentPage': _$AppPageEnumMap[instance.currentPage]!,
};

const _$AppThemeEnumMap = {AppTheme.light: 'light', AppTheme.dark: 'dark'};

const _$AppPageEnumMap = {
  AppPage.listDemo: 'listDemo',
  AppPage.riverpodHooksDemo: 'riverpodHooksDemo',
};
