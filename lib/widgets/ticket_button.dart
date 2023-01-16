import 'package:flutter/material.dart';
import 'package:helpdesk/constants/index.dart';
import 'package:helpdesk/screens/index.dart';
import 'package:helpdesk/utils/index.dart';
import 'package:helpdesk/widgets/index.dart';

class TicketButton extends StatefulWidget {
  const TicketButton({
    Key? key,
    required this.subject,
    required this.isSigned,
    required this.priority, required this.onTap,
    required this.status,
  }) : super(key: key);

  final String subject;
  final String status;
  final String priority;
  final bool isSigned;
  final VoidCallback onTap;

  @override
  State<TicketButton> createState() => _TicketButtonState();
}

class _TicketButtonState extends State<TicketButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      highlightColor: greenColor.withOpacity(0.3),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: Column(
          children: [
            Row(
              children: [
                getSpaceW(width: 10),
                Expanded(
                  flex: 4,
                  child: CustomText(label: widget.subject),
                ),
                Expanded(
                  flex: 2,
                  child: CustomText(label: widget.status, color: blackColor),
                ),
                Expanded(
                  flex: 2,
                  child: CustomText(label: widget.priority, color: blackColor),
                ),
                getSpaceW(width: 10),
              ],
            ),
            getSpaceH(height: 10),
            Divider(
              indent: 10,
              endIndent: 10,
              height: 5,
              thickness: 1.1,
              color: blackColor.withOpacity(0.4),),
            getSpaceW(width: 10),
            Expanded(
              flex: 4,
              child: TextButton(
                style: TextButton.styleFrom(padding: EdgeInsets.zero),
                onPressed: () {
                  push(context: context, destination: const TicketDetail());
                },
                child: CustomText(label: widget.subject),
              ),
            ),
            Expanded(
              flex: 2,
              child: TextButton(
                style: TextButton.styleFrom(
                    alignment: Alignment.centerLeft, padding: EdgeInsets.zero),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: const LinearGradient(
                                  colors: [greenColor, greenColor])),
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Column(
                              children: [
                                const CustomText(
                                  label: "Status",
                                  fontWeight: FontWeight.w600,
                                ),
                                ListTile(
                                  title: const CustomText(label: "Set as Open"),
                                  trailing: Checkbox(
                                      onChanged: (value) {}, value: false),
                                ),
                                getSpaceH(height: 10),
                                ListTile(
                                  title:
                                      const CustomText(label: "Set as Close"),
                                  trailing: Checkbox(
                                      onChanged: (value) {}, value: false),
                                ),
                                getSpaceH(height: 10),
                                ListTile(
                                  title:
                                      const CustomText(label: "Set as Pending"),
                                  trailing: Checkbox(
                                      onChanged: (value) {}, value: false),
                                ),
                                getSpaceH(height: 10),
                                const Divider(
                                  height: 30,
                                  thickness: 2,
                                ),
                                const CustomText(
                                  label: "Priority",
                                  fontWeight: FontWeight.w600,
                                ),
                                ListTile(
                                  title: const CustomText(label: "Set as High"),
                                  trailing: Checkbox(
                                      onChanged: (value) {}, value: false),
                                ),
                                getSpaceH(height: 10),
                                ListTile(
                                  title:
                                      const CustomText(label: "Set as Medium"),
                                  trailing: Checkbox(
                                      onChanged: (value) {}, value: false),
                                ),
                                getSpaceH(height: 10),
                                ListTile(
                                  title: const CustomText(label: "Set as Low"),
                                  trailing: Checkbox(
                                      onChanged: (value) {}, value: false),
                                ),
                                getSpaceH(height: 10),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Text(widget.status,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      color: blackColor,
                    )),
              ),
            ),
            getSpaceW(width: 10),
            Expanded(
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_horiz_outlined)),
            )
          ],
        ),
      ),
    );
  }
}
