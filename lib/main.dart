import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:movies/src/app/navigator.dart';
import 'package:movies/src/app/utils/app_theme.dart';
import 'package:movies/src/app/utils/components_app_theme.dart';
import 'package:movies/src/app/pages/login/login_page.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget with ComponentsAppTheme {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    FlutterCleanArchitecture.debugModeOn();
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
