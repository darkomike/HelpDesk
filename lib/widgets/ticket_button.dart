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
              color: blackColor.withOpacity(0.4),
            )
          ],
        ),
      ),
    );
  }
}
