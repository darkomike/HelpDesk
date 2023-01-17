import 'index.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      required TextEditingController controller,
      required String hintText,
      required String labelText,
      this.bottomLeft = 10,
      this.bottomRight = 20,
      this.minLines,
      this.maxLines,
      this.topLeft = 5,
      this.topRight = 20,
      this.borderFocusColor = greenColor,
      this.onChanged,
      this.obscureText = false,
      this.prefix})
      : _controller = controller,
        _hintText = hintText,
        _labelText = labelText,
        super(key: key);

  final TextEditingController _controller;
  final String _hintText;
  final String _labelText;
  final double topLeft;
  final double topRight;
  final double bottomLeft;
  final double bottomRight;
  final Color borderFocusColor;
  final Widget? prefix;
  final bool obscureText;
  final int? minLines;
  final int? maxLines;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: _controller,
      onChanged: onChanged,
      minLines: minLines,
      maxLines: maxLines,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(10),
        label: Text(_labelText),
        hintText: _hintText,
        prefixIcon: prefix,
        border: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: blackColor),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(topLeft),
                topRight: Radius.circular(topRight),
                bottomLeft: Radius.circular(bottomLeft),
                bottomRight: Radius.circular(bottomRight))),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: blackColor),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(topLeft),
                topRight: Radius.circular(topRight),
                bottomLeft: Radius.circular(bottomLeft),
                bottomRight: Radius.circular(bottomRight))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1.5, color: borderFocusColor),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(topLeft),
                topRight: Radius.circular(topRight),
                bottomLeft: Radius.circular(bottomLeft),
                bottomRight: Radius.circular(bottomRight))),
      ),
    );
  }
}
