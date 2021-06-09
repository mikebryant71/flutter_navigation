import 'package:flutter/material.dart';
import 'package:navigation/navigation/route_paths/app_route_paths.dart';
import 'package:navigation/screens/screen.dart';
import 'package:navigation/screens/account_screen.dart';
import 'package:provider/provider.dart';

import 'page_manager.dart';

class AccountPageManager extends PageManager {
  AccountPageManager() {
    addPage(const MaterialPage(
      child: AccountScreen(),
      key: ValueKey('AccountScreen'),
      name: '/account',
    ));
  }

  @override
  Future<void> setNewRoutePath(AppRoutePath configuration) async {
    if (configuration is AccountDetailPath) {
      addPage(
        MaterialPage(
          child: const Screen(title: 'AccountDetail'),
          key: UniqueKey(),
          name: '/detail',
        ),
      );
    } else if (configuration is AccountRootPath) {
      removePagesWhere(
        (element) => element.key != const Key('AccountScreen'),
      );
    }

    notifyListeners();
  }

  void goToAccountDetail() {
    setNewRoutePath(AccountDetailPath());
  }

  static AccountPageManager of(BuildContext context) {
    return Provider.of<AccountPageManager>(context, listen: false);
  }
}
