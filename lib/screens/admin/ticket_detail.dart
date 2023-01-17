import 'index.dart';

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
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: IconButton(
              iconSize: 35,
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return ticketDetailsDialog(context: context);
                    });
              },
              icon: const Icon(
                Icons.person,
                color: blackColor,
              ),
            ),
          )
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
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
              padding: const EdgeInsets.all(5),
              height: MediaQuery.of(context).size.height * 0.3,
              margin: const EdgeInsets.symmetric(vertical: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(10),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CustomText(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      overflow: TextOverflow.visible,
                      label: dummyText,
                    ),
                    Center(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: OutlinedButton(
                          onPressed: () {},
                          child: Column(
                            children: const [
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Icon(Icons.upload_file),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Text('File Name'),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            getSpaceH(
              height: 50,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomTextField(
                    minLines: 5,
                    maxLines: 10,
                    controller: _message,
                    hintText: "Type a message ...",
                    labelText: 'Type a Message',
                  ),
                  getSpaceH(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Status'),
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
                              value: _status,
                              items: statuses
                                  .map<DropdownMenuItem<String>>(
                                    (value) => DropdownMenuItem(
                                      value: value,
                                      child: CustomText(
                                        label: value,
                                      ),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  _status = value!;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Priority'),
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
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: CustomElevatedButton(
                          onPressed: () {},
                          borderRadius: BorderRadius.circular(15),
                          width: getMySize(context: context).width * (2 / 5),
                          child: const Text(
                            "Submit",
                            style: TextStyle(
                              fontSize: 20,
                              letterSpacing: 3,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
