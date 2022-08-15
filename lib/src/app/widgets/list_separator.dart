import 'package:flutter/material.dart';
import 'package:movies/src/app/utils/components_app_theme.dart';

class ListSeparator extends StatelessWidget {
  final EdgeInsetsGeometry margin;

  const ListSeparator({
    Key? key,
    this.margin = const EdgeInsets.symmetric(vertical: 20),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration:  BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 0.5, color: greyColor),
        ),
      ),
    );
  }
}
