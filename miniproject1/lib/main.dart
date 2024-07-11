import 'package:flutter/material.dart';
import 'package:miniproject1/router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Hello World App',
      routerConfig: router,
    );
  }
}
