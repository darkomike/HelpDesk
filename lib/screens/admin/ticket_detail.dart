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
        height: 120,
        title: "Details",
        backgroundColor: whiteColor,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: CustomShaderMask(
              gradient: const LinearGradient(colors: greenColorGradient),
              blendMode: BlendMode.srcIn,
              child: IconButton(
                iconSize: 24,
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
            ),
          )
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(90),
          child: Column(
            children: [
              const Divider(
                height: 1,
                thickness: 1.5,
                color: greenColor,
                indent: 45,
                endIndent: 45,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
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
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const CustomText(
                          label: "Status: ",
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        Container(
                          height: 30,
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10),
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
                    Row(
                      children: [
                        const CustomText(
                          label: "Priority: ",
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        Container(
                          height: 30,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10),
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
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
             AppUtils.  getSpaceH(
              height: 50,
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
            AppUtils. getSpaceH(height: 10),
        ],
      ),
      bottomSheet: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextField(
              suffixIcon:
                  IconButton(onPressed: () {}, icon: const Icon(Icons.send)),
              minLines: 3,
              maxLines: 7,
              controller: _message,
              hintText: "Type a message ...",
              labelText: 'Message',
            ),
          ],
        ),
      ),
    );
  }
}
