class InputValidation {
  String? emailValidation(value) {
    if (value!.isEmpty) {
      return 'Enter E-Mail';
    } else {
      final regExp = RegExp(r'\S+@knust.edu.gh');
      bool isValid = regExp.hasMatch(value!);
      return isValid
          ? null
          : 'Enter a valid E-mail \nexample: "johnDoe@knust.edu.gh"';
    }
  }
}
