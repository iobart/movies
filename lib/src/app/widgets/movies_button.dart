import 'package:flutter/material.dart';
import 'package:movies/src/app/utils/components_app_theme.dart';
class MoviesButton extends StatelessWidget {
  final String text;
  final bool normalButton; // Normal button is one with white background and black text.
  final double width;
  final bool hasMargin;
  final void Function()? onPressed;

  const MoviesButton({
    Key? key,
    required this.text,
    this.normalButton = false,
    this.onPressed,
    this.width = 180,
    this.hasMargin = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: hasMargin ? 10 : 0),
      child: MaterialButton(
        splashColor: Colors.white70,
        height: 40,
        minWidth: width,
        color: normalButton ? whiteColor : yellowColor,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        onPressed: onPressed,
        child: Text(
          text,
          style:  TextStyle(
            color: blackColor,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
