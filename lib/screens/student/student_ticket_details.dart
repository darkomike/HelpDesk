import 'index.dart';

class StudentTicketDetails extends StatefulWidget {
  const StudentTicketDetails({super.key});

  @override
  State<StudentTicketDetails> createState() => _StudentTicketDetailsState();
}

class _StudentTicketDetailsState extends State<StudentTicketDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Details'),
      body: SingleChildScrollView(
        child: Container(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const CustomText(
                    textAlign: TextAlign.start,
                    label: "Status:",
                    fontWeight: FontWeight.bold,
                  ),
                     AppUtils.getSpaceW(width: 10),
                  const CustomText(
                    textAlign: TextAlign.start,
                    label: "Open",
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              const CustomText(
                textAlign: TextAlign.start,
                label: "Ticket Info",
                fontSize: 20,
                fontWeight: FontWeight.bold,
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
              const CustomText(
                textAlign: TextAlign.start,
                label: "Feedback",
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              Container(
                padding: const EdgeInsets.all(5),
                height: MediaQuery.of(context).size.height * 0.2,
                margin: const EdgeInsets.symmetric(vertical: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const SingleChildScrollView(
                  child: CustomText(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    overflow: TextOverflow.visible,
                    label: dummyText,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: CustomElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  borderRadius: BorderRadius.circular(15),
                  width:   AppUtils. getMySize(context: context).width * (2 / 5),
                  child: const Text(
                    "OK",
                    style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 3,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
