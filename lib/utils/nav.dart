import 'index.dart';

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

checkUserLoginMode({required String userRole}) {
  switch (userRole) {
    case 'Admin':
      return const LandingPageAdmin();

    case 'Student':
      return const LandingPageStudent();

    case 'Agent':
      return const LandingPageStudent();

    case 'Lecturer':
      return const LandingPageStudent();

    default:
      return const LandingPageStudent();
  }
}
