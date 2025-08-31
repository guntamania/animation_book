import 'package:flutter/material.dart';

import '../models/app_state.dart' as models;

class AppRouteInformationParser extends RouteInformationParser<models.AppPage> {
  @override
  Future<models.AppPage> parseRouteInformation(RouteInformation routeInformation) async {
    final uri = routeInformation.uri;
    
    switch (uri.path) {
      case '/list-demo':
        return models.AppPage.listDemo;
      case '/riverpod-hooks-demo':
        return models.AppPage.riverpodHooksDemo;
      default:
        return models.AppPage.riverpodHooksDemo; // デフォルト
    }
  }
  
  @override
  RouteInformation? restoreRouteInformation(models.AppPage configuration) {
    return RouteInformation(uri: Uri.parse(configuration.path));
  }
}