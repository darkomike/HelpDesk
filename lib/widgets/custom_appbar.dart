import 'index.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.bottom = const PreferredSize(
        preferredSize: Size.fromHeight(1.5),
        child: Divider(
          height: 1,
          thickness: 1.5,
          color: greenColor,
          indent: 45,
          endIndent: 45,
        )),
    required this.title, this.height=60,
    this.leading,
    this.backgroundColor = whiteColor,
    this.actions,
  }) : super(key: key);

  final Color? backgroundColor;
  final PreferredSize? bottom;
  final List<Widget>? actions;
  final String title;
  final Widget? leading;
  final double height;

  @override
  Size get preferredSize =>  Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        iconTheme: const IconThemeData(color: blackColor),
        leading: leading,
        centerTitle: true,
        elevation: 0.0,
        bottom: bottom,
        backgroundColor: backgroundColor,
        actions: actions,
        title: CustomText(
          label: title,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ));
  }
}
