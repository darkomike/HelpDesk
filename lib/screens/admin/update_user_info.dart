import 'index.dart';

class UpdateUserInfo extends StatefulWidget {
  const UpdateUserInfo({super.key});

  @override
  State<UpdateUserInfo> createState() => _UpdateUserInfoState();
}

class _UpdateUserInfoState extends State<UpdateUserInfo> {
  final _formKey = GlobalKey<FormState>();
  final _surnameController = TextEditingController();
  final _otherNamesController = TextEditingController();
  final _telephoneController = TextEditingController();
  final _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Update User",
        backgroundColor: whiteColor,
      ),
      body: Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width:    AppUtils.getMySize(context: context).width,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.green.withOpacity(0.2),
                              Colors.green
                            ]),
                        borderRadius: BorderRadius.circular(2),
                        border: Border.all()),
                    child: const CustomText(
                      label: "Student",
                      fontSize: 20,
                      textAlign: TextAlign.center,
                    ),
                  ),
                   AppUtils.  getSpaceH(height: 30),
                  CustomTextField(
                      controller: _surnameController,
                      hintText: "Addo",
                      labelText: "Surname"),
                     AppUtils.getSpaceH(height: 20),
                  CustomTextField(
                      controller: _otherNamesController,
                      hintText: "Michael",
                      labelText: "Other Names"),
                    AppUtils. getSpaceH(height: 20),
                  CustomTextField(
                      controller: _telephoneController,
                      hintText: "0551167889",
                      labelText: "Telephone"),
                     AppUtils.getSpaceH(height: 20),
                  CustomTextField(
                      controller: _emailController,
                      hintText: "maddo@gmail.com",
                      labelText: "Email"),
                     AppUtils.getSpaceH(height: 40),
                  CustomElevatedButton(
                      borderRadius: BorderRadius.circular(20),
                      width:    AppUtils. getMySize(context: context).height / 2,
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return CustomDialog(
                                body: Column(
                                  children: [
                                    const CustomText(label: "Confirm changes?"),
                                       AppUtils.getSpaceH(height: 20),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        CustomElevatedButton(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            gradient: const LinearGradient(
                                                colors: [
                                                  Colors.greenAccent,
                                                  Colors.teal
                                                ]),
                                            onPressed: () {},
                                            child: const CustomText(
                                              label: "Yes",
                                              color: whiteColor,
                                            )),
                                        CustomElevatedButton(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            gradient: const LinearGradient(
                                                colors: [
                                                  Colors.red,
                                                  Colors.redAccent
                                                ]),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const CustomText(
                                              label: "No",
                                              color: whiteColor,
                                            ))
                                      ],
                                    )
                                  ],
                                ),
                                title: "Confirm");
                          },
                        );
                      },
                      child: const CustomText(
                        label: "Confirm",
                        color: whiteColor,
                      ))
                ],
              ),
            ),
          )),
    );
  }
}
