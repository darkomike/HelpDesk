import 'package:flutter/cupertino.dart';

SizedBox getSpaceH({required double height}) {
  return SizedBox(
    height: height,
  );
}

SizedBox getSpaceW({required double width}) {
  return SizedBox(
    width: width,
  );
}

Size getMySize({required BuildContext context}) => MediaQuery.of(context).size;
