import 'package:flutter/material.dart';
import 'package:movies/src/app/features/presentation/pages/login/login_page.dart';
import 'package:movies/src/app/navigator.dart';
import 'package:movies/src/app/utils/app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouterGenerator.generateRoute,
      theme: AppTheme.dark(),
      themeMode: ThemeMode.dark,
      home:  LoginPage(),
    );
  }
}
