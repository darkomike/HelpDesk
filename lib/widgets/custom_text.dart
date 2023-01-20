import 'index.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    Key? key,
    required this.label,
    this.color = blackColor,
    this.fontSize = 16,
    this.overflow = TextOverflow.ellipsis,
    this.textAlign,
    this.letterSpacing = 1,
    this.fontWeight = FontWeight.w500,
  }) : super(key: key);

  final String label;
  final Color? color;
  final double fontSize;
  final double letterSpacing;
  final TextOverflow? overflow;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      overflow: overflow,
      textAlign: textAlign,
      style: TextStyle(
        height: 1.5,
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
          letterSpacing: letterSpacing),
    );
  }
}
