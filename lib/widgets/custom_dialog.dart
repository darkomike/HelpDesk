import 'index.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    Key? key,
    required this.body,
    required this.title,
  }) : super(key: key);

  final Widget body;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: whiteColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: whiteColor.withOpacity(0.5),
        ),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          CustomText(
            label: title,
            fontWeight: FontWeight.w600,
          ),
          const Divider(
            height: 20,
            color: greenColor,
            thickness: 1.5,
          ),
          body
        ]),
      ),
    );
  }
}
