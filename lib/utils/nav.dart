import 'package:flutter/material.dart';
import 'package:helpdesk/widgets/custom_page_route.dart';

Size getSize(BuildContext context) {
  return MediaQuery.of(context).size;
}

pushReplace(
    {required BuildContext context,
    required Widget destination,
    AxisDirection direction = AxisDirection.right}) {
  Navigator.pushReplacement(
    context,
    CustomPageRoute(child: destination, direction: direction),
  );
}

push({
  required BuildContext context,
  required Widget destination,
  AxisDirection direction = AxisDirection.right,
}) {
  Navigator.push(
    context,
    CustomPageRoute(child: destination, direction: direction),
  );
}

getImagePathPng({required String name}) {
  return "assets/images/$name.png";
}

getImagePathJpg({required String name}) {
  return "assets/images/$name.jpg";
}
