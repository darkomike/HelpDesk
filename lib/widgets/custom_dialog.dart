import 'index.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    Key? key,
    required this.body,
    required this.title,
    this.dividerColor = greenColor,
  }) : super(key: key);

  final Widget body;
  final String title;
  final Color dividerColor;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: whiteColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: whiteColor.withOpacity(0.7),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, 
          children: [
          CustomText(
            label: title,
            fontWeight: FontWeight.w800,
            fontSize: 20,
          ),
          Divider(
            height: 20,
            color: dividerColor,
            thickness: 1.5,
          ),
          body
        ]),
      ),
    );
  }
}
