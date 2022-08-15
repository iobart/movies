import 'package:flutter/material.dart';
import 'package:movies/src/app/features/presentation/pages/recent_page.dart';

import 'features/presentation/pages/details_page.dart';
import 'features/presentation/pages/navigator_page.dart';
import 'features/presentation/pages/poster_detail_page.dart';

class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final routesMap = {
      '/home': MaterialPageRoute(
        builder: (_) =>  const NavigatorPage(),
      ),
      '/detailPoster': MaterialPageRoute(
        builder: (_) =>  const PosterDetailPage(),
      ),
      '/detailRecent': MaterialPageRoute(
        builder: (_) =>  const DetailsPage(),
      ),
      '/recent': MaterialPageRoute(
        builder: (_) =>  const RecentPage(),
      ),
    };

    return routesMap[settings.name!] ?? routesMap['/']!;
  }
}
