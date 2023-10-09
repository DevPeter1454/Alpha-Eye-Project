import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../cores.dart';

class AppText extends StatelessWidget {
  final String text;
  final double? fontSize, letterSpacing, height;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final String? fontFamily;
  final Color? color;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? alignment;
  final TextDecoration? textDecoration;
  const AppText(this.text,
      {Key? key,
      this.fontSize,
      this.fontStyle,
      this.fontWeight,
      this.color,
      this.maxLines,
      this.overflow,
      this.alignment,
      this.fontFamily,
      this.letterSpacing,
      this.textDecoration,
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(text,
        maxLines: maxLines,
        style: TextStyle(
          color: color,
          fontFamily: fontFamily ?? FontFamily.hovesRegular,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
          fontSize: fontSize,
          overflow: overflow,
          letterSpacing: letterSpacing,
          decoration: textDecoration,
          height: height,
        ),
        textAlign: alignment);
    // return Text(text, maxLines: maxLine, style: TextStyle(color: color, fontWeight: fontWeight, fontStyle: fontStyle, fontSize: size, overflow: overflow), textAlign: alignment);
  }
}
