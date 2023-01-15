import 'package:flutter/material.dart';
import 'package:helpdesk/constants/index.dart';
import 'package:helpdesk/utils/index.dart';
import 'package:helpdesk/widgets/index.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _searchTicket = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: AdminDrawer(),
      appBar: CustomAppBar(
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
          icon: const Icon(
            Icons.menu,
            color: blackColor,
          ),
        ),
        title: "All Tickets",
        backgroundColor: whiteColor,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: CustomTextField(
                onChanged: (value){}, topLeft: 5, topRight: 20, bottomLeft: 10, bottomRight: 20, prefix: Icon(Icons.search, size: 19,),
                controller: _searchTicket,
                hintText: 'Type user ID',
                labelText: 'User ID'),
          ), 
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("4 Tickets",
                  style: TextStyle(
                      color: blackColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.sort))
            ],
          ),
          Divider(
            height: 5,
            thickness: 1.1,
            color: blackColor.withOpacity(0.4),
          ),
          Column(
            children: [
              Row(
                children: [
                  const Expanded(child: SizedBox()),
                  getSpaceW(width: 10),
                  const Expanded(
                      flex: 4,
                      child: Text("SUBJECTS",
                          style: TextStyle(
                              color: blackColor, fontWeight: FontWeight.bold))),
                  getSpaceW(width: 10),
                  const Expanded(
                      flex: 2,
                      child: Text("STATUS",
                          style: TextStyle(
                              color: blackColor, fontWeight: FontWeight.bold))),
                  getSpaceW(width: 10),
                  const Expanded(child: SizedBox())
                ],
              ),
              Divider(
                height: 5,
                thickness: 1.1,
                color: blackColor.withOpacity(0.4),
              ),
            ],
          ),
          Flexible(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children:  [
                const TicketButton(isSigned: false, priority: "high", status: 'Open', subject: 'lipsum tyrue wuw wu wuOK0K0WM '),
               ],
            ),
          ),
        ]),
      ),
    );
  }
}


class NoTicket extends StatelessWidget {
  const NoTicket({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("No Tickets"));
  }
}
