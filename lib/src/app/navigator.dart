import 'package:flutter/material.dart';
import 'features/presentation/pages/home_page.dart';

class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final routesMap = {
      '/home': MaterialPageRoute(
        builder: (_) =>  const HomePage(),
      ),
    };

    return routesMap[settings.name!] ?? routesMap['/']!;
  }
}
