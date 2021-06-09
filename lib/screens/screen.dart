import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  final String title;

  const Screen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation'),
      ),
      body: Center(
        child: Text(title),
      ),
    );
  }
}
