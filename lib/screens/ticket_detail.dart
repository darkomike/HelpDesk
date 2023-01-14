import 'package:flutter/material.dart';
import 'package:helpdesk/constants/colors.dart';
import 'package:helpdesk/widgets/custom_appbar.dart';


class TicketDetail extends StatefulWidget {
  const TicketDetail({super.key});

  @override
  State<TicketDetail> createState() => _TicketDetailState();
}

class _TicketDetailState extends State<TicketDetail> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(
       
          
        
        title: "Details",
        backgroundColor: whiteColor, actions: [
          IconButton(onPressed: () {
            
          }, icon: Icon(Icons.info_outline, color: blackColor,))
        ],
      ),
    );
  }
}