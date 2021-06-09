import 'package:flutter/material.dart';

import '../route_paths/app_route_paths.dart';

abstract class AppRouteUriParser {
  static AppRoutePath parseRoute(Uri uri) {
    if (uri.pathSegments.isEmpty) {
      return HomeRootPath();
    }

    switch (uri.toString()) {
      case '/':
        return HomeRootPath();
      case '/featured_movies':
        return FeaturedMoviesPath();
      case '/play':
        return PlayRootPath();
      case '/play/movies':
        return PlayMoviesPath();
      case '/account':
        return AccountRootPath();
      case '/account/detail':
        return AccountDetailPath();
      default:
        return HomeRootPath();
    }
  }
}

class AppRouteInformationParser extends RouteInformationParser<AppRoutePath> {
  @override
  Future<AppRoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location ?? '');
    return AppRouteUriParser.parseRoute(uri);
  }

  @override
  RouteInformation? restoreRouteInformation(AppRoutePath configuration) {
    if (configuration is HomeRootPath) {
      return const RouteInformation(location: '/');
    }
    if (configuration is FeaturedMoviesPath) {
      return const RouteInformation(location: '/featured_movies');
    }
    if (configuration is PlayRootPath) {
      return const RouteInformation(location: '/play');
    }
    if (configuration is PlayMoviesPath) {
      return const RouteInformation(location: '/play/movies');
    }
    if (configuration is AccountRootPath) {
      return const RouteInformation(location: '/account');
    }
    if (configuration is AccountDetailPath) {
      return const RouteInformation(location: '/account/detail');
    }
  }
}
