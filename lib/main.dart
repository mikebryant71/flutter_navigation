import 'package:flutter/material.dart';

import 'navigation/information_parser/route_information_parser.dart';
import 'navigation/routers/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Navigation Demo',
      routerDelegate: AppRouterDelegate(),
      routeInformationParser: AppRouteInformationParser(),
    );
  }
}
