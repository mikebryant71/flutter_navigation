import 'package:flutter/material.dart';
import 'package:navigation/navigation/page_managers/account_page_manager.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation'),
      ),
      body: Center(
        child: OutlinedButton(
            onPressed: () {
              AccountPageManager.of(context).goToAccountDetail();
            },
            child: const Text('Go to Account detail')),
      ),
    );
  }
}
