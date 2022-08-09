import 'package:flutter/material.dart';

class GenericButton extends StatelessWidget {
  const GenericButton({
    Key? key,
    required this.colorButton,
    this.imageRoute,
    required this.text,
    this.height,
    this.width,
    this.borderColor,
    this.onPressed,
    this.textStyle,
  }) : super(key: key);
  final Color colorButton;
  final Widget? imageRoute;
  final String text;
  final double? height;
  final double? width;
  final Color? borderColor;
  final TextStyle? textStyle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.transparent,
          primary: colorButton,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          side: borderColor != null ? BorderSide(color: borderColor!) : null,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: imageRoute != null
              ? MainAxisAlignment.start
              : MainAxisAlignment.center,
          children: <Widget>[
            if (imageRoute != null) imageRoute!,
            if (imageRoute != null) const SizedBox(width: 20),
            Text(text, style: textStyle),
          ],
        ),
        onPressed: () {
          onPressed?.call();
        },
      ),
    );
  }
}
