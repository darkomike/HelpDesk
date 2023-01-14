import 'package:flutter/material.dart';
import 'package:helpdesk/constants/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.bottom = const PreferredSize(
        preferredSize: Size.fromHeight(1.5),
        child: Divider(
          height: 1,
          thickness: 1.5,
          color: greenColor,
          indent: 10,
          endIndent: 10,
        )),
    required this.title, this.leading,
    this.backgroundColor,
    this.actions,
  }) : super(key: key);

  final Color? backgroundColor;
  final PreferredSize? bottom;
  final List<Widget>? actions;
  final String title;
  final Widget? leading;
  

  @override
  Size get preferredSize => const Size.fromHeight(60);

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
        title: Text(
          title,
          style: const TextStyle(
              color: blackColor, fontSize: 25, fontWeight: FontWeight.w500),
        ));
  }
}
