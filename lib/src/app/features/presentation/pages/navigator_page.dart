import 'package:flutter/material.dart';
import 'package:movies/src/app/utils/components_app_theme.dart';
import 'package:movies/src/app/widgets/movies_action_button.dart';

import 'home_page.dart';

class NavigatorPage extends StatefulWidget {
  const NavigatorPage({Key? key}) : super(key: key);

  @override
  State<NavigatorPage> createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  int _selectedIndex = 0;

  /// List of options depends on the selected index
  static final List<Map<String, dynamic>> _widgetPageOptions =
      <Map<String, dynamic>>[
    {
      'title': 'Home',
      "icon": Icons.home_filled,
      "page": const HomePage(),
    },
    {
      'title': 'Favorites',
      "icon": Icons.favorite_border_rounded,
      "page": const HomePage(),
    },
    {
      'title': 'Recent',
      "icon": Icons.settings_backup_restore_rounded,
      "page": const HomePage()
    },
    {'title': 'Search', "icon": Icons.search_rounded, "page": const HomePage()}
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    void _onSettings() {
      Navigator.pop(context);
    }

    return Scaffold(
        backgroundColor: blackColor,
        appBar: AppBar(
          backgroundColor: blackColor,
          elevation: 0,
          title: Text(_widgetPageOptions.elementAt(_selectedIndex)['title']),
          actions: [
            MoviesActionButton(
              icon: Icons.settings_rounded,
              function: _onSettings,
              iconColor: greyColor,
            ),
          ],
        ),
        body: Center(
          child: _widgetPageOptions.elementAt(_selectedIndex)['page'],
        ),
        bottomNavigationBar: _BottomBarNavigation(
          index: _selectedIndex,
          onTap: _onItemTapped,
          items: _widgetPageOptions,
        ));
  }
}

class _BottomBarNavigation extends StatelessWidget {
  final int index;
  final List<Map<String, dynamic>> items;
  final void Function(int) onTap;

  const _BottomBarNavigation({
    Key? key,
    required this.index,
    required this.onTap,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        ...items
            .map(
              (item) => BottomNavigationBarItem(
                icon: Icon(
                  item["icon"],
                  color: whiteColor,
                ),
                label: item["title"],
                activeIcon: Icon(
                  item["icon"],
                  color: yellowColor,
                ),
              ),
            )
            .toList()
      ],
      onTap: onTap,
      currentIndex: index,
      selectedItemColor: yellowColor,
      backgroundColor: Colors.black,
      selectedFontSize: 10,
      unselectedFontSize: 10,
      type: BottomNavigationBarType.fixed,
    );
  }
}
