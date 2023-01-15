import 'package:flutter/material.dart';
import 'package:helpdesk/constants/colors.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {Key? key,
      required this.label,
      this.color = blackColor,
      this.fontSize = 16,
      this.overflow = TextOverflow.ellipsis, this.textAlign,
      this.fontWeight = FontWeight.w500})
      : super(key: key);

  final String label;
  final Color? color;
  final double fontSize;
  final TextOverflow? overflow;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(label,
        overflow: overflow,
        textAlign: textAlign,
        style: TextStyle(
            color: color, fontSize: fontSize, fontWeight: fontWeight));
  }
}
