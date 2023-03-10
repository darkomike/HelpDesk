import 'index.dart';

class CustomShaderMask extends StatelessWidget {
  final Widget child;
  final Gradient gradient;
  final BlendMode blendMode;
  const CustomShaderMask(
      {Key? key,
      required this.child,
      required this.gradient,
      required this.blendMode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ShaderMask(
        blendMode: blendMode,
        shaderCallback: (rect) => gradient.createShader(rect),
        child: child,
      ),
    );
  }
}
