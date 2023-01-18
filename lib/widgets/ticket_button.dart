import 'index.dart';

class TicketButton extends StatefulWidget {
  const TicketButton({
    Key? key,
    required this.subject,
    required this.isSigned,
    required this.priority,
    required this.onTap,
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
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(flex: 4, child: CustomText(label: widget.subject)),
            Expanded(
                flex: 2,
                child: CustomText(label: widget.status, color: blackColor)),
            Expanded(
                flex: 2,
                child:
                    CustomText(label: widget.priority, color: blackColor)),
          ],
        ),
      ),
    );
  }
}
