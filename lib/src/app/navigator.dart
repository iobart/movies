import 'package:flutter/material.dart';

import 'features/presentation/pages/navigator_page.dart';

class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final routesMap = {
      '/home': MaterialPageRoute(
        builder: (_) =>  const NavigatorPage(),
      ),
    };

    return routesMap[settings.name!] ?? routesMap['/']!;
  }
}
