import 'package:flutter/material.dart';
import 'package:navigation/navigation/route_paths/app_route_paths.dart';
import 'package:navigation/screens/play_screen.dart';
import 'package:navigation/screens/screen.dart';
import 'package:provider/provider.dart';

import 'page_manager.dart';

class PlayPageManager extends PageManager {
  PlayPageManager() {
    addPage(const MaterialPage(
      child: PlayScreen(),
      key: ValueKey('PlayScreen'),
      name: '/play',
    ));
  }

  @override
  Future<void> setNewRoutePath(AppRoutePath configuration) async {
    if (configuration is PlayMoviesPath) {
      addPage(
        MaterialPage(
          child: const Screen(title: 'Movies'),
          key: UniqueKey(),
          name: '/movies',
        ),
      );
    } else if (configuration is PlayRootPath) {
      removePagesWhere(
        (element) => element.key != const Key('PlayScreen'),
      );
    }

    notifyListeners();
  }

  void goToMovies() {
    setNewRoutePath(PlayMoviesPath());
  }

  static PlayPageManager of(BuildContext context) {
    return Provider.of<PlayPageManager>(context, listen: false);
  }
}
