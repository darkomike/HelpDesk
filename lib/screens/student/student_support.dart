import "index.dart";

class StudentSupport extends StatefulWidget {
  const StudentSupport({super.key});

  @override
  State<StudentSupport> createState() => _StudentSupportState();
}

class _StudentSupportState extends State<StudentSupport> {
  String signOuttextLabel = "Sign Out";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Support",
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: greenColor.withOpacity(0.2),
              child: CustomShaderMask(
                gradient: const LinearGradient(colors: greenColorGradient),
                blendMode: BlendMode.srcIn,
                child: IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) => StatefulBuilder(
                                builder: (context, setState) {
                                  return CustomDialog(
                                    body: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Card(
                                            color: whiteColor.withOpacity(.4),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: const [
                                                  CustomText(label: "UserID: "),
                                                  CustomText(label: "E90FSO"),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Card(
                                            color: whiteColor.withOpacity(.4),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: const [
                                                  CustomText(
                                                      label: "Username: "),
                                                  CustomText(
                                                      label: "Kwame Antwi"),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Card(
                                            color: whiteColor.withOpacity(.4),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: const [
                                                  CustomText(
                                                      label: "Telephone: "),
                                                  CustomText(
                                                      label: "0551167889"),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Card(
                                            color: whiteColor.withOpacity(.4),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: const [
                                                  CustomText(label: "Email: "),
                                                  CustomText(
                                                      label:
                                                          "kwantwi@gmail.com"),
                                                ],
                                              ),
                                            ),
                                          ),
                                          AppUtils.getSpaceH(height: 10),
                                          CustomElevatedButton(
                                              width: double.infinity,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              onPressed: () {
                                                setState(
                                                  () {
                                                    signOuttextLabel =
                                                        "Signing Out";
                                                  },
                                                );
                                                AppUtils.getDelayed(
                                                    duration: 3,
                                                    callback: () {
                                                      Provider.of<AppState>(
                                                              context,
                                                              listen: false)
                                                          .setIsUserLoggedIn(
                                                              value: false);
                                                      Navigator.pop(context);

                                                      NavUtils.pushReplace(
                                                          context: context,
                                                          destination:
                                                              const Login());
                                                    });
                                              },
                                              child: CustomText(
                                                color: whiteColor,
                                                label: signOuttextLabel,
                                              ))
                                        ]),
                                    title: Provider.of<UserState>(context)
                                        .userRolee,
                                  );
                                },
                              ));
                    },
                    icon: const Icon(Icons.person)),
              ),
            ),
          )
        ],
      ),
      body: RefreshIndicator(
        // Callback function to refresh the list
        onRefresh: () async {
          // Fetch new data here
          // ...
          // Once the data is loaded, call setState to refresh the list
          setState(() {});
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: 1 == 1 ? const NoSupportTicket() : const SupportBody(),
        ),
      ),
      floatingActionButton: 1 == 1
          ? const SizedBox()
          : FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const StudentSupportForm(),
                  ),
                );
              },
              child: const Icon(Icons.add),
            ),
    );
  }
}

class DontTouchItLol extends StatelessWidget {
  const DontTouchItLol({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: const [CustomText(label: "4 Tickets")],
        ),
        Flexible(
          child: ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: 6,
            itemBuilder: (context, index) {
              return const ExpansionTile(
                title: CustomText(label: dummyText),
                initiallyExpanded: true,
                children: [],
              );
            },
          ),
        ),
      ],
    );
  }
}

class SupportBody extends StatelessWidget {
  const SupportBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "4 Tickets",
                style: TextStyle(
                  color: blackColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        Divider(
          height: 5,
          thickness: 1.1,
          color: blackColor.withOpacity(0.4),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Expanded(
                flex: 4,
                child: CustomText(
                  textAlign: TextAlign.center,
                  label: "SUBJECT",
                  color: blackColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                flex: 2,
                child: CustomText(
                  label: "STATUS",
                  color: blackColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Divider(
          height: 5,
          thickness: 1.1,
          color: blackColor.withOpacity(0.4),
        ),
        Flexible(
          child: ListView.separated(
            separatorBuilder: (context, index) => Divider(
              height: 5,
              thickness: 1.1,
              color: blackColor.withOpacity(0.4),
            ),
            itemCount: 4,
            itemBuilder: (BuildContext context, index) {
              return InkWell(
                onTap: () {
                  NavUtils.push(
                    context: context,
                    destination: const StudentTicketDetails(),
                  );
                },
                highlightColor: greenColor.withOpacity(0.3),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
                        flex: 4,
                        child: CustomText(
                          label:
                              'Great to have you onboard,The next step is crucial, yet simple! To see messages',
                        ),
                      ),
                      AppUtils.getSpaceW(width: 10),
                      const Expanded(
                        flex: 2,
                        child: CustomText(
                          label: 'Open',
                          color: blackColor,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class NoSupportTicket extends StatelessWidget {
  const NoSupportTicket({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const CustomText(
              label: 'No Ticket Available',
              fontSize: 20,
              fontWeight: FontWeight.bold),
          AppUtils.getSpaceH(height: 10),
          CustomElevatedButton(
            onPressed: () {
              NavUtils.push(
                  context: context, destination: const StudentSupportForm());
            },
            borderRadius: BorderRadius.circular(10),
            child: const CustomText(
              label: "Create Ticket",
              color: whiteColor,
            ),
          )
        ],
      ),
    );
  }
}
