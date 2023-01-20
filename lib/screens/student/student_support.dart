import "index.dart";

class StudentSupport extends StatefulWidget {
  const StudentSupport({super.key});

  @override
  State<StudentSupport> createState() => _StudentSupportState();
}

class _StudentSupportState extends State<StudentSupport> {
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
                gradient: const LinearGradient(colors: bgColorGradient),
                blendMode: BlendMode.srcIn,
                child: IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) => CustomDialog(
                                body: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Card(
                                        color: whiteColor.withOpacity(.4),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
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
                                          padding: const EdgeInsets.all(10.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: const [
                                              CustomText(label: "Username: "),
                                              CustomText(label: "Kwame Antwi"),
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
                                          padding: const EdgeInsets.all(10.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: const [
                                              CustomText(label: "Telephone: "),
                                              CustomText(label: "0551167889"),
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
                                          padding: const EdgeInsets.all(10.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: const [
                                              CustomText(label: "Email: "),
                                              CustomText(
                                                  label: "kwantwi@gmail.com"),
                                            ],
                                          ),
                                        ),
                                      ),
                                      getSpaceH(height: 10),
                                      CustomElevatedButton(
                                          width: double.infinity,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          onPressed: () {
                                            getDelayed(
                                                duration: 3,
                                                callback: () {
                                                  push(
                                                      context: context,
                                                      destination:
                                                          const Login());
                                                });
                                          },
                                          child: const CustomText(
                                            color: whiteColor,
                                            label: "Sign Out",
                                          ))
                                    ]),
                                title: 'Student',
                              ));
                    },
                    icon: const Icon(Icons.person)),
              ),
            ),
          )
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
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
                      push(
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
                          getSpaceW(width: 10),
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
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const StudentSupportForm(),
            ),
          );
        },
        child: const Icon(Icons.message),
      ),
    );
  }
}
