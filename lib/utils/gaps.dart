import 'package:helpdesk/constants/index.dart';

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

getDelayed({required int duration, required VoidCallback callback}) async {
    return Timer(Duration(seconds: duration), callback);
  }


  Future<bool?> showWarning(BuildContext context, String title) async => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            backgroundColor: whiteColor,
            title:  CustomText(
              overflow: TextOverflow.visible,
              label: title,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            actions: [
              MaterialButton(
                  child: const CustomText(label: "No", fontSize: 14),
                  onPressed: () => Navigator.pop(context, false)),
              MaterialButton(
                  child: const CustomText(label: "Yes", fontSize: 14),
                  onPressed: () => Navigator.pop(context, true))
            ],
          ));
