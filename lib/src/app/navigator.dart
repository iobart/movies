import 'package:flutter/material.dart';
import 'package:movies/src/app/pages/home/home.dart';

class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final routesMap = {
      '/home': MaterialPageRoute(
        builder: (_) => const HomePage(),
      ),
    };

    return routesMap[settings.name!] ?? routesMap['/']!;
  }
}
