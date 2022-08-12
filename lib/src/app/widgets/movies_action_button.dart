import 'package:flutter/material.dart';
import 'package:movies/src/app/utils/components_app_theme.dart';

class MoviesActionButton extends StatelessWidget {
  final IconData icon;
  final Color splashColor;
  final Color iconColor;
  final void Function() function;

 const  MoviesActionButton({
    Key? key,
    required this.icon,
    required this.function,
    this.iconColor = Colors.grey,
    this.splashColor = Colors.transparent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
      ),
      child: IconButton(
        splashRadius: 20,
        onPressed: function,
        icon: Icon(icon),
        color: iconColor,
        splashColor: splashColor,
      ),
    );
  }
}
