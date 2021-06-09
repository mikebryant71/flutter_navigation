import 'package:flutter/material.dart';
import 'package:navigation/navigation/route_paths/app_route_paths.dart';
import 'package:navigation/screens/home_screen.dart';
import 'package:navigation/screens/screen.dart';
import 'package:provider/provider.dart';

import 'page_manager.dart';

class HomePageManager extends PageManager {
  HomePageManager() {
    addPage(const MaterialPage(
      child: HomeScreen(),
      key: ValueKey('HomeScreen'),
      name: '/',
    ));
  }

  @override
  Future<void> setNewRoutePath(AppRoutePath configuration) async {
    if (configuration is FeaturedMoviesPath) {
      addPage(
        MaterialPage(
          child: const Screen(title: 'Featured Movies'),
          key: UniqueKey(),
          name: '/featured_movies',
        ),
      );
    } else if (configuration is HomeRootPath) {
      removePagesWhere(
        (element) => element.key != const Key('HomeScreen'),
      );
    }

    notifyListeners();
  }

  void goToFeaturedMovies() {
    setNewRoutePath(FeaturedMoviesPath());
  }

  static HomePageManager of(BuildContext context) {
    return Provider.of<HomePageManager>(context, listen: false);
  }
}
