import 'package:flutter/material.dart';

class InputGeneric extends StatefulWidget {
  final void Function()? onTap;
  final String? hintText;
  final bool? borderNone;
  final Color labelColor;
  final String? labelText;
  final bool obscureText;
  final Color borderColor;
  final TextAlign? textAlign;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final int? maxLenght;
  final void Function(String)? onFieldSubmitted;
  final double? inptBorderRadius;
  final double? height;
  final Widget? prefixIcon;
  final Color? hintTextColor;
  final bool readOnly;

  const InputGeneric({
    Key? key,
    this.onTap,
    this.hintText,
    this.textAlign,
    this.labelText,
    this.borderNone,
    this.suffixIcon,
    this.height = 55,
    required this.keyboardType,
    this.obscureText = false,
    this.labelColor = Colors.white,
    this.borderColor = Colors.white,
    this.maxLenght,
    required this.controller,
    this.onFieldSubmitted,
    this.inptBorderRadius,
    this.prefixIcon,
    this.hintTextColor,
    this.readOnly = false,
  }) : super(key: key);

  @override
  _TextInputSuffixState createState() => _TextInputSuffixState();
}

class _TextInputSuffixState extends State<InputGeneric> {
  bool _obscureText = false;

  OutlineInputBorder borderStyle() => OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(widget.inptBorderRadius ?? 20),
        ),
        borderSide: BorderSide(color: widget.borderColor, width: 1.0),
      );

  TextStyle labelStyle() => TextStyle(color: widget.labelColor);

  TextStyle hintStyle() =>
      TextStyle(color: widget.hintTextColor ?? Colors.grey[300]);

  final OutlineInputBorder errorBorderStyle = const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide(color: Colors.red, width: 1.0),
  );

  @override
  void initState() {
    _obscureText = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        textAlign: widget.textAlign ?? TextAlign.start,
        onTap: widget.onTap,
        controller: widget.controller,
        obscureText: _obscureText,
        readOnly: widget.readOnly,
        keyboardType: widget.keyboardType,
        style: labelStyle(),
        maxLength: widget.maxLenght,
        decoration: InputDecoration(
          counterText: '',
          filled: true,
          hintText: widget.hintText,
          hintStyle: hintStyle(),
          labelText: widget.labelText,
          labelStyle: labelStyle(),
        ),
        onSubmitted: widget.onFieldSubmitted,
      ),
    );
  }
}
