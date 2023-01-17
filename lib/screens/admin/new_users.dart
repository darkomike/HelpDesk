import 'index.dart';

class NewUsers extends StatefulWidget {
  const NewUsers({super.key});

  @override
  State<NewUsers> createState() => _NewUsersState();
}

class _NewUsersState extends State<NewUsers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "New Users",
        backgroundColor: whiteColor,
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(
                                colors: [greenColor, greenColor])),
                        child:
                            Column(mainAxisSize: MainAxisSize.min, children: [
                          const CustomText(
                            label: "Confirm",
                            fontWeight: FontWeight.w600,
                          ),
                          const Divider(
                            height: 10,
                            thickness: 2,
                          ),
                          const CustomText(
                              textAlign: TextAlign.center,
                              label: "Confirm addition of '2' Users?"),
                          getSpaceH(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CustomElevatedButton(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: const LinearGradient(colors: [
                                    Colors.greenAccent,
                                    Colors.teal
                                  ]),
                                  onPressed: () {},
                                  child: const CustomText(
                                    label: "Yes",
                                    color: whiteColor,
                                  )),
                              CustomElevatedButton(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: const LinearGradient(
                                      colors: [Colors.red, Colors.redAccent]),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const CustomText(
                                    label: "No",
                                    color: whiteColor,
                                  ))
                            ],
                          )
                        ]),
                      ),
                    );
                  },
                );
              },
              icon: const Icon(
                Icons.done,
                color: greenColor,
                size: 25,
              ))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("2 Users",
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
                    getSpaceW(width: 10),
                    const Expanded(
                        flex: 2,
                        child: Text("UserID ",
                            style: TextStyle(
                                color: blackColor,
                                fontWeight: FontWeight.bold))),
                    getSpaceW(width: 10),
                    const Expanded(
                        flex: 2,
                        child: Text("Username",
                            style: TextStyle(
                                color: blackColor,
                                fontWeight: FontWeight.bold))),
                    getSpaceW(width: 10),
                    const Expanded(
                        flex: 2,
                        child: Text("Role",
                            style: TextStyle(
                                color: blackColor,
                                fontWeight: FontWeight.bold))),
                    const Expanded(child: SizedBox()),
                    getSpaceW(width: 10),
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
                  NewUserButton(
                    onCancel: () {},
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: const LinearGradient(
                                      colors: [greenColor, greenColor])),
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const CustomText(
                                      label: "View",
                                      fontWeight: FontWeight.w600,
                                    ),
                                    const Divider(
                                      height: 10,
                                      thickness: 2,
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
                                            CustomText(label: "Role: "),
                                            CustomText(label: "Student"),
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
                                  ]),
                            ),
                          );
                        },
                      );
                    },
                    role: "Student",
                    userID: "kwantwi12",
                    username: "Kwame Antwi",
                  ),
                  NewUserButton(
                    onCancel: () {},
                    onTap: () {},
                    role: "Student",
                    userID: "miagyekum",
                    username: "Michael Agyekum",
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
