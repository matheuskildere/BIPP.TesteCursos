import 'package:Bipp/app/pages/home/home_page.dart';
import 'package:Bipp/app/utils/routes/routes.dart';
import 'package:Bipp/app/utils/theme/theme.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      initialRoute: "/",
      routes: routes,
      debugShowCheckedModeBanner: false,
    );
  }
}