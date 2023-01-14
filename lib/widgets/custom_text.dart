import 'package:flutter/material.dart';
import 'package:helpdesk/constants/colors.dart';



class CustomText extends StatelessWidget {
  const CustomText({Key? key, required this.label, this.color = blackColor, this.fontWeight = FontWeight.w500}) : super(key: key);

  final String label;
  final Color? color;
  final FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    return Text(label, 
        overflow: TextOverflow.ellipsis,
        style: TextStyle(color: color, fontWeight: fontWeight));
  }
}
