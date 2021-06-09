import 'package:flutter/material.dart';
import 'package:navigation/navigation/page_managers/home_page_manager.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation'),
      ),
      body: Center(
        child: OutlinedButton(
            onPressed: () {
              HomePageManager.of(context).goToFeaturedMovies();
            },
            child: const Text('Go to Featured Movies')),
      ),
    );
  }
}
