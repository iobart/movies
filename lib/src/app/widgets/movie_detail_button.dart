import 'package:flutter/material.dart';
import 'package:movies/src/app/utils/components_app_theme.dart';

class MovieDetailButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;

  const MovieDetailButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: GestureDetector(
        onTap: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              text,
              style:  TextStyle(color: yellowColor, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              width: 10,
            ),
             Icon(
              Icons.arrow_forward_ios,
              size: 15,
              color: yellowColor,
            ),
          ],
        ),
      ),
    );
  }
}
