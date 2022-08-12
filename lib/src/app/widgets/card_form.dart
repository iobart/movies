import 'package:flutter/material.dart';
import 'package:movies/src/app/utils/components_app_theme.dart';

class CardForm extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;

  const CardForm({
    Key? key,
    required this.child,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double paddingBottom = MediaQuery.of(context).padding.bottom;
    return Container(
      height: MediaQuery.of(context).size.height*0.5,
      clipBehavior: Clip.hardEdge,
      padding: padding ?? EdgeInsets.fromLTRB(40, 40, 40, (paddingBottom + 6)),
      decoration:  BoxDecoration(
        backgroundBlendMode: BlendMode.hardLight,
        color: blackColor.withOpacity(0.8),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      alignment: Alignment.centerLeft,
      child: child,
    );
  }
}
