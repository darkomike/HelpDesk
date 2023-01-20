import 'index.dart';

class CustomTextFieldPassword extends StatelessWidget {
  const CustomTextFieldPassword({
    Key? key,
    required TextEditingController controller,
    required String hintText,
    required String labelText,
    required suffixIcon,
    required obscureText,
    this.bottomLeft = 10,
    this.bottomRight = 20,
    this.minLines,
    this.maxLines,
    this.topLeft = 5,
    this.topRight = 20,
    this.borderFocusColor = greenColor,
    this.onChanged,
    this.validator,
    this.prefix,
  })  : _controller = controller,
        _hintText = hintText,
        _suffixIcon = suffixIcon,
        _labelText = labelText,
        _obscureText = obscureText,
        super(key: key);

  final TextEditingController _controller;
  final String _hintText;
  final String _labelText;
  final Widget _suffixIcon;
  final double topLeft;
  final double topRight;
  final double bottomLeft;
  final double bottomRight;
  final Color borderFocusColor;
  final Widget? prefix;
  final bool _obscureText;
  final int? minLines;
  final int? maxLines;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _obscureText,
      controller: _controller,
      onChanged: onChanged,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      decoration: InputDecoration(
        suffixIcon: _suffixIcon,
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
