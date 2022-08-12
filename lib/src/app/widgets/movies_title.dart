import 'package:flutter/material.dart';
import 'package:movies/src/app/utils/components_app_theme.dart';

class MoviesTitle extends StatelessWidget {
  final String text;
  final double? fontSize;
  final bool centered;

  const MoviesTitle({Key? key, required this.text, this.fontSize = 18, this.centered = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: centered
          ? const EdgeInsets.all(10)
          : const EdgeInsets.symmetric(
              vertical: 10,
            ),
      alignment: centered ? Alignment.center : Alignment.centerLeft,
      child: Text(text,
          style: TextStyle(
            color: whiteColor,
            fontSize: fontSize,
            decoration: TextDecoration.none,
            fontWeight: FontWeight.bold,
          )),
    );
  }
}
