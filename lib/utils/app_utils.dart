import 'package:helpdesk/constants/index.dart';

class AppUtils {
  static SizedBox getSpaceH({required double height}) {
    return SizedBox(
      height: height,
    );
  }

  static SizedBox getSpaceW({required double width}) {
    return SizedBox(
      width: width,
    );
  }

  static Size getMySize({required BuildContext context}) =>
      MediaQuery.of(context).size;

  static getDelayed({required int duration, required VoidCallback callback}) async {
    return Timer(Duration(seconds: duration), callback);
  }

  static Future<bool?> showWarning(BuildContext context, String title) async =>
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                backgroundColor: whiteColor,
                title: CustomText(
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


static String randomString(int length) {
  const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
  final random = Random();
  return String.fromCharCodes(Iterable.generate(
    length,
    (_) => chars.codeUnitAt(random.nextInt(chars.length)),
  )) + Random().nextInt(1000000).toString();
}


static showErrorDialog({required String title, required String errorMessage, required BuildContext context}) =>
                        showDialog(
                          context: context,
                          builder: (context) => CustomDialog(
                              dividerColor: redColor,
                              body: Column(
                                children: [
                                  CustomText(
                                      label:
                                         errorMessage),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const CustomText(
                                          label: 'Okay',
                                          color: blueColor,
                                        )),
                                  )
                                ],
                              ),
                              title: title),
                        );
}
