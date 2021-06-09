import 'package:flutter/material.dart';
import 'package:navigation/navigation/information_parser/route_information_parser.dart';
import 'package:navigation/navigation/route_paths/app_route_paths.dart';

abstract class PageManager extends ChangeNotifier {
  final GlobalKey<NavigatorState> navigatorKey;
  final List<Page> _pages = [];
  List<Page> get pages => List.unmodifiable(_pages);
  Future<void> setNewRoutePath(AppRoutePath configuration);

  void didPop(Page page) {
    _pages.remove(page);
    notifyListeners();
  }

  AppRoutePath get currentPath {
    return parseRoute(Uri.parse(_pages.last.name ?? ''));
  }

  AppRoutePath parseRoute(Uri uri) {
    return AppRouteUriParser.parseRoute(uri);
  }

  void addPage(Page page) {
    _pages.add(page);
  }

  void removePage(Page page) {
    _pages.remove(page);
  }

  void removePagesWhere(bool Function(Page element) test) {
    _pages.removeWhere(test);
  }

  PageManager({GlobalKey<NavigatorState>? key})
      : navigatorKey = key ?? GlobalKey<NavigatorState>();
}
