import 'index.dart';

class NavUtils {
  static pushReplace(
      {required BuildContext context,
      required Widget destination,
      AxisDirection direction = AxisDirection.right}) {
    Navigator.pushReplacement(
      context,
      CustomPageRoute(child: destination, direction: direction),
    );
  }

  static pop(BuildContext context) => Navigator.pop(context);

  static pushAndRemove(
      {required BuildContext context,
      required Widget destination,
      AxisDirection direction = AxisDirection.right}) {
    Navigator.pushAndRemoveUntil(
        context,
        CustomPageRoute(child: destination, direction: direction),
        (route) => false);
  }

  static push({
    required BuildContext context,
    required Widget destination,
    AxisDirection direction = AxisDirection.right,
  }) {
    Navigator.push(
      context,
      CustomPageRoute(child: destination, direction: direction),
    );
  }

  static checkUserLoginMode({required String userRole}) {
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
}
