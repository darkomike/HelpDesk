import 'package:flutter/material.dart';
import 'package:helpdesk/constants/constants.dart';
import 'package:helpdesk/screens/login.dart';
import 'package:helpdesk/screens/ticket_detail.dart';
import 'package:helpdesk/utils/gaps.dart';
import 'package:helpdesk/utils/nav.dart';
import 'package:helpdesk/widgets/custom_appbar.dart';
import 'package:helpdesk/widgets/custom_elevated_button.dart';
import 'package:helpdesk/widgets/custom_text.dart';

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
      drawer: Drawer(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [greenColor, greenColor])),
          child: Column(
            children: [
              DrawerHeader(
                  child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 40,
                        ),
                        getSpaceW(width: 20),
                        Card(
                          color: whiteColor.withOpacity(.4),
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: CustomText(label: "Administrator"),
                          ),
                        )
                      ],
                    ),
                    Card(
                      color: whiteColor.withOpacity(.4),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: CustomText(label: "administrator@email.com"),
                      ),
                    )
                  ],
                ),
              )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    CustomElevatedButton(
                      onPressed: () {},
                      width: double.infinity,
                      child:  CustomText(
                        label: "Tickets",
                      ),
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(colors: [
                        whiteColor.withOpacity(0.4),
                        whiteColor.withOpacity(0.4)
                      ]),
                    ),
                    getSpaceH(height: 40),
                     CustomElevatedButton(
                      onPressed: () {},
                      width: double.infinity,
                      child:  CustomText(
                        label: "Users",
                      ),
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(colors: [
                        whiteColor.withOpacity(0.4),
                        whiteColor.withOpacity(0.4)
                      ]),
                    ), getSpaceH(height: 40),
                     CustomElevatedButton(
                      onPressed: () {},
                      width: double.infinity,
                      child:  CustomText(
                        label: "Create Users",
                      ),
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(colors: [
                        whiteColor.withOpacity(0.4),
                        whiteColor.withOpacity(0.4)
                      ]),
                    ), getSpaceH(height: 40),
                     CustomElevatedButton(
                      onPressed: () {},
                      width: double.infinity,
                      child:  CustomText(
                        label: "Sign Out",
                      ),
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(colors: [
                        whiteColor.withOpacity(0.4),
                        whiteColor.withOpacity(0.4)
                      ]),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: CustomTextField(
                controller: _searchTicket,
                hintText: 'User ID',
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
              children: [
                const TicketButton(),
                const TicketButton(),
                const TicketButton(),
                const TicketButton(),
                const TicketButton(),
                const TicketButton(),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class TicketButton extends StatelessWidget {
  const TicketButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Checkbox(
                value: true,
                onChanged: (value) {},
              ),
            ),
            getSpaceW(width: 10),
            Expanded(
              flex: 4,
              child: TextButton(
                style: TextButton.styleFrom(padding: EdgeInsets.zero),
                onPressed: () {
                  push(context: context, destination: const TicketDetail());
                },
                child: const CustomText(
                    label: "lipsum pe dri erte t tir eooe eofffff"),
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
                child: const Text("Open",
                    textAlign: TextAlign.left,
                    style: TextStyle(
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
        Divider(
          indent: 10,
          endIndent: 10,
          height: 5,
          thickness: 1.1,
          color: blackColor.withOpacity(0.4),
        )
      ],
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
