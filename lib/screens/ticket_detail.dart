import 'package:flutter/material.dart';
import 'package:helpdesk/constants/index.dart';
import 'package:helpdesk/constants/texts.dart';
import 'package:helpdesk/main.dart';
import 'package:helpdesk/utils/gaps.dart';
import 'package:helpdesk/widgets/index.dart';

class TicketDetail extends StatefulWidget {
  const TicketDetail({super.key});

  @override
  State<TicketDetail> createState() => _TicketDetailState();
}

class _TicketDetailState extends State<TicketDetail> {
  String _status = "Open";
  String _priority = "High";
  final statuses = ["Closed", "Open"];
  final priorities = ["High", "Medium", "Low"];
  final _message = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Details",
        backgroundColor: whiteColor,
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return _ticketDetialsDialog();
                  },
                );
              },
              icon: const Icon(
                Icons.info_outline,
                color: blackColor,
              ))
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 1),
                      blurRadius: 0.0)
                ],
                gradient: LinearGradient(colors: [
                  Colors.yellow.withOpacity(0.4),
                  blackColor.withOpacity(0.1)
                ])),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                CustomText(label: "HelpDesk"),
                CustomText(label: "Wed, 11 Jan 2023, 03:43 pm")
              ],
            ),
          ),
          Container(
              // height: (5/ 6) * getMySize(context: context).height,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.symmetric(vertical: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Scrollbar(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const CustomText(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          overflow: TextOverflow.visible,
                          label: dummyText),
                      getSpaceH(
                          height: (1 / 6) * getMySize(context: context).height)
                    ],
                  ),
                ),
              ))
        ]),
      ),
      bottomSheet: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextField(
                minLines: 3,
                maxLines: 5,
                controller: _message,
                hintText: "Type a message",
                labelText: 'Type a message'),
            getSpaceH(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Container(
                height: 40,
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: DropdownButton(
                    underline: const SizedBox(),
                    value: _status,
                    items: statuses
                        .map<DropdownMenuItem<String>>(
                            (value) => DropdownMenuItem(
                                value: value,
                                child: CustomText(
                                  label: value,
                                )))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _status = value!;
                      });
                    }),
              ),
              Container(
                height: 40,
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: DropdownButton(
                    underline: const SizedBox(),
                    value: _priority,
                    items: priorities
                        .map<DropdownMenuItem<String>>(
                            (value) => DropdownMenuItem(
                                value: value,
                                child: CustomText(
                                  label: value,
                                )))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _priority = value!;
                      });
                    }),
              ),
              CustomElevatedButton(
                  onPressed: () {},
                  borderRadius: BorderRadius.circular(15),
                  width: getMySize(context: context).width * (2 / 5),
                  child: const Text("Submit"))
            ]),
          ],
        ),
      ),
    );
  }

  Dialog _ticketDetialsDialog() {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(colors: [greenColor, greenColor])),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CustomText(
              label: "Ticket Details",
              fontWeight: FontWeight.w600,
            ),
            const Divider(
              height: 10,
              thickness: 2,
            ),
            Card(
              color: whiteColor.withOpacity(.4),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    CustomText(label: "Ticket ID:"),
                    CustomText(label: "E90FSO"),
                  ],
                ),
              ),
            ),
            Card(
              color: whiteColor.withOpacity(.4),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    CustomText(label: "Created: "),
                    CustomText(label: "10 Jan, 2023"),
                  ],
                ),
              ),
            ),
            Card(
              color: whiteColor.withOpacity(.4),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    CustomText(label: "Status:"),
                    CustomText(label: "Open"),
                  ],
                ),
              ),
            ),
            Card(
              color: whiteColor.withOpacity(.4),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    CustomText(label: "Priority:"),
                    CustomText(label: "High"),
                  ],
                ),
              ),
            ),
            Card(
              color: whiteColor.withOpacity(.4),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CustomText(
                      label: "Responsibility",
                      fontWeight: FontWeight.w600,
                    ),
                    const Divider(
                      height: 10,
                      thickness: 2,
                    ),
                    Card(
                      color: whiteColor.withOpacity(.6),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                CustomText(label: "Agent:"),
                                CustomText(label: "No agent assigned"),
                              ],
                            ),
                            const Divider(
                              height: 10,
                              thickness: 2,
                            ),
                            CustomElevatedButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Dialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              gradient: const LinearGradient(
                                                  colors: [
                                                    greenColor,
                                                    greenColor
                                                  ])),
                                          child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                const CustomText(
                                                  label: "Assign Agent",
                                                  fontWeight: FontWeight.w600,
                                                ),
                                                const Divider(
                                                  height: 10,
                                                  thickness: 2,
                                                ),
                                                Card(
                                                  color: whiteColor
                                                      .withOpacity(.4),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        const CustomText(
                                                          label: "Unassigned",
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                        const Divider(
                                                          height: 10,
                                                          thickness: 2,
                                                        ),
                                                         UnassignedAgentButton(name: "Jamsime Osei", onPressed: (){},),
                                                          UnassignedAgentButton(name: "Vivian Antwi", onPressed: (){},),

                                                      
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ]),
                                        ),
                                      );
                                    },
                                  );
                                },
                                borderRadius: BorderRadius.circular(15),
                                child: const CustomText(
                                  label: "Assign",
                                  color: whiteColor,
                                ))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class UnassignedAgentButton extends StatelessWidget {
  const UnassignedAgentButton({
    Key? key,required this.name, required this.onPressed,
  }) : super(key: key);

  final String name;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Icon(Icons.account_circle),
           CustomText(label: name),
          CustomElevatedButton(
              borderRadius: BorderRadius.circular(10),
              onPressed: onPressed,
              child: const CustomText(label: "Assign"))
        ],
      ),
    );
  }
}
