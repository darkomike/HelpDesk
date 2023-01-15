import 'package:flutter/material.dart';
import 'package:helpdesk/constants/index.dart';
import 'package:helpdesk/screens/users.dart';
import 'package:helpdesk/utils/gaps.dart';
import 'package:helpdesk/widgets/index.dart';

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
      appBar: CustomAppBar(
        title: "Update User",
        backgroundColor: whiteColor,
      ),
      body: Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: getMySize(context: context).width,
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
                  getSpaceH(height: 30),
                  CustomTextField(
                      controller: _surnameController,
                      hintText: "Addo",
                      labelText: "Surname"),
                  getSpaceH(height: 20),
                  CustomTextField(
                      controller: _otherNamesController,
                      hintText: "Michael",
                      labelText: "Other Names"),
                  getSpaceH(height: 20),
                  CustomTextField(
                      controller: _telephoneController,
                      hintText: "0551167889",
                      labelText: "Telephone"),
                  getSpaceH(height: 20),
                  CustomTextField(
                      controller: _emailController,
                      hintText: "maddo@gmail.com",
                      labelText: "Email"),
                  getSpaceH(height: 40),
                  CustomElevatedButton(
                      borderRadius: BorderRadius.circular(20),
                      width: getMySize(context: context).height / 2,
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return CustomDialog(
                                body: Column(
                                  children: [
                                    CustomText(label: "Confirm changes?"),
                                    getSpaceH(height: 20),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        CustomElevatedButton(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            gradient: LinearGradient(colors: [
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
                                            gradient: LinearGradient(colors: [
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
                      child: CustomText(
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
