import 'package:flutter/material.dart';
import 'package:navigation/navigation/page_managers/play_page_manager.dart';
import 'package:navigation/navigation/routers/app_router.dart';

class PlayScreen extends StatelessWidget {
  const PlayScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BottomNavigationState.of(context).backButtonDispatcher?.takePriority();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation'),
      ),
      body: Center(
        child: OutlinedButton(
            onPressed: () {
              PlayPageManager.of(context).goToMovies();
            },
            child: const Text('Go to Movies')),
      ),
    );
  }
}
