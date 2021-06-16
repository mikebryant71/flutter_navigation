import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:navigation/navigation/page_managers/home_page_manager.dart';
import 'package:navigation/navigation/page_managers/page_manager.dart';
import 'package:navigation/navigation/page_managers/account_page_manager.dart';
import 'package:navigation/navigation/page_managers/play_page_manager.dart';
import 'package:provider/provider.dart';

import '../route_paths/app_route_paths.dart';

class AppRouterDelegate extends RouterDelegate<AppRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppRoutePath> {
  final BottomNavigationState bottomNavigationState = BottomNavigationState();
  final HomePageManager homePageManager = HomePageManager();
  final PlayPageManager playPageManager = PlayPageManager();
  final AccountPageManager accountPageManager = AccountPageManager();
  BackButtonDispatcher? backButtonDispatcher;

  AppRouterDelegate() {
    for (var notifier in [
      homePageManager,
      playPageManager,
      accountPageManager,
      bottomNavigationState
    ]) {
      notifier.addListener(notifyListeners);
    }
  }

  @override
  Widget build(BuildContext context) {
    late final navigator;
    if (bottomNavigationState.currentTab.index == 0) {
      navigator = Navigator(
        key: homePageManager.navigatorKey,
        onPopPage: _onPopPage,
        pages: homePageManager.pages,
      );
    } else if (bottomNavigationState.currentTab.index == 0) {
      navigator = Navigator(
        key: playPageManager.navigatorKey,
        onPopPage: _onPopPage,
        pages: playPageManager.pages,
      );
    } else {
      navigator = Navigator(
        key: accountPageManager.navigatorKey,
        onPopPage: _onPopPage,
        pages: accountPageManager.pages,
      );
    }
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: bottomNavigationState),
        ChangeNotifierProvider.value(value: homePageManager),
        ChangeNotifierProvider.value(value: playPageManager),
        ChangeNotifierProvider.value(value: accountPageManager)
      ],
      child: Scaffold(
        bottomNavigationBar: _BottomNavigationBar(),
        body: navigator,
      ),
    );
  }

  bool _onPopPage(Route<dynamic> route, dynamic result) {
    final didPop = route.didPop(result);
    if (!didPop) {
      return false;
    }

    pageManager.didPop(route.settings as Page);

    return true;
  }

  @override
  GlobalKey<NavigatorState> get navigatorKey => pageManager.navigatorKey;

  @override
  AppRoutePath get currentConfiguration => pageManager.currentPath;

  @override
  Future<void> setNewRoutePath(AppRoutePath configuration) async {
    if (configuration is HomePath) {
      bottomNavigationState.currentTab = BottomTab.home;
      await homePageManager.setNewRoutePath(configuration);
    } else if (configuration is PlayPath) {
      bottomNavigationState.currentTab = BottomTab.play;
      await playPageManager.setNewRoutePath(configuration);
    } else if (configuration is AccountPath) {
      bottomNavigationState.currentTab = BottomTab.account;
      await accountPageManager.setNewRoutePath(configuration);
    }
  }

  PageManager get pageManager {
    switch (bottomNavigationState.currentTab) {
      case BottomTab.home:
        return homePageManager;
      case BottomTab.play:
        return playPageManager;
      case BottomTab.account:
        return accountPageManager;
    }
  }
}

class _BottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabBar(
        items: [
          _createItem(title: 'Home'),
          _createItem(title: 'Play'),
          _createItem(title: 'Account')
        ],
        activeColor: Colors.green,
        backgroundColor: Colors.white,
        currentIndex: BottomNavigationState.of(context).currentTab.index,
        onTap: (newIndex) {
          BottomNavigationState.of(context).currentTabIndex = newIndex;
        });
  }

  BottomNavigationBarItem _createItem({required String title}) {
    String iconPath = 'lib/resources/images/tab_bar_${title.toLowerCase()}.png';
    var icon = Image.asset(iconPath);
    var activeIcon = Image.asset(iconPath, color: Colors.green);
    return BottomNavigationBarItem(
        icon: icon, activeIcon: activeIcon, label: title);
  }
}

class BottomNavigationState extends ChangeNotifier {
  BackButtonDispatcher? backButtonDispatcher;
  var _currentTab = BottomTab.home;

  BottomTab get currentTab {
    return _currentTab;
  }

  set currentTab(BottomTab tab) {
    _currentTab = tab;
    notifyListeners();
  }

  set currentTabIndex(int index) {
    currentTab = BottomTab.values[index];
  }

  static BottomNavigationState of(BuildContext context) {
    return Provider.of<BottomNavigationState>(context, listen: false);
  }
}

enum BottomTab { home, play, account }
