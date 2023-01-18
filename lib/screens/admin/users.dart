import 'index.dart';

class Users extends StatefulWidget {
  const Users({super.key});

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {

  final _userIDController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Users",
        backgroundColor: whiteColor,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: CustomTextField(
                  onChanged: (value) {},
                  topLeft: 5,
                  topRight: 20,
                  bottomLeft: 10,
                  bottomRight: 20,
                  prefix: const Icon(
                    Icons.search,
                    size: 19,
                  ),
                  controller: _userIDController,
                  hintText: 'Type user ID',
                  labelText: 'User ID'),
            ),
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
                    onCancel: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return CustomDialog(
                            body: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CustomElevatedButton(
                                      borderRadius: BorderRadius.circular(10),
                                      width:
                                          getMySize(context: context).width / 2,
                                      onPressed: () {
                                        Navigator.pop(context);
                                        push(
                                            context: context,
                                            destination:
                                                const UpdateUserInfo());
                                      },
                                      child: const CustomText(
                                        label: "UPDATE",
                                        color: whiteColor,
                                      )),
                                  getSpaceH(height: 10),
                                  CustomElevatedButton(
                                      gradient: const LinearGradient(colors: [
                                        Colors.red,
                                        Colors.redAccent
                                      ]),
                                      borderRadius: BorderRadius.circular(10),
                                      width:
                                          getMySize(context: context).width / 2,
                                      onPressed: () {
                                        Navigator.pop(context);
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return CustomDialog(
                                                body: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    const CustomText(
                                                      label:
                                                          "Do you want to delete user: 'kwantwi12'?",
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                    getSpaceH(height: 10),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        CustomElevatedButton(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                            gradient:
                                                                const LinearGradient(
                                                                    colors: [
                                                                  Colors
                                                                      .greenAccent,
                                                                  Colors.teal
                                                                ]),
                                                            onPressed: () {},
                                                            child:
                                                                const CustomText(
                                                              label: "Yes",
                                                              color: whiteColor,
                                                            )),
                                                        CustomElevatedButton(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                            gradient:
                                                                const LinearGradient(
                                                                    colors: [
                                                                  Colors.red,
                                                                  Colors
                                                                      .redAccent
                                                                ]),
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child:
                                                                const CustomText(
                                                              label: "No",
                                                              color: whiteColor,
                                                            ))
                                                      ],
                                                    )
                                                  ],
                                                ),
                                                title: "Confirm Deletion");
                                          },
                                        );
                                      },
                                      child: const CustomText(
                                        label: "DELETE",
                                        color: whiteColor,
                                      ))
                                ]),
                            title: "Options",
                          );
                        },
                      );
                    },
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
                                  ),
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
                                              BorderRadius.circular(10)
                                              ),
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

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    Key? key,
    required this.body,
    required this.title,
  }) : super(key: key);

  final Widget body;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: whiteColor
            ),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          CustomText(
            label: title,
            fontWeight: FontWeight.w600,
          ),
          const Divider(
            height: 20,
            thickness: 2,
          ),
          body
        ]),
      ),
    );
  }
}

class NewUserButton extends StatelessWidget {
  const NewUserButton({
    Key? key,
    required this.onCancel,
    required this.onTap,
    required this.role,
    required this.userID,
    required this.username,
  }) : super(key: key);

  final void Function()? onCancel;
  final String userID;
  final String username;
  final String role;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Row(
            children: [
              getSpaceW(width: 10),
              Expanded(
                flex: 2,
                child: CustomText(
                  label: userID,
                ),
              ),
              getSpaceW(width: 10),
              Expanded(
                  flex: 2,
                  child: CustomText(
                    label: username,
                  )),
              getSpaceW(width: 10),
              Expanded(
                  flex: 2,
                  child: CustomText(
                    label: role,
                  )),
              getSpaceW(width: 10),
              Expanded(
                child: IconButton(
                    onPressed: onCancel,
                    icon: const Icon(
                      Icons.more_horiz,
                      color: blackColor,
                    )),
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
      ),
    );
  }
}
