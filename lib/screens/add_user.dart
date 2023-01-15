import 'package:flutter/material.dart';
import 'package:helpdesk/constants/index.dart';
import 'package:helpdesk/screens/users.dart';
import 'package:helpdesk/utils/index.dart';
import 'package:helpdesk/widgets/index.dart';

class AddUser extends StatefulWidget {
  const AddUser({super.key});

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  final _formKey = GlobalKey<FormState>();
  final _surnameController = TextEditingController();
  final _otherNamesController = TextEditingController();
  final _telephoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _roles = ["Admin", "Agent", "Lecturer", "Student"];
  String _role = "Student";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Add User",
        backgroundColor: whiteColor,
      ),
      body: Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  
                  getSpaceH(height: 10),
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
                                        getSpaceH(height: 20),

                      Row(
                        children: [
                          const Expanded(child:  CustomText(label: "Select Role: ")),
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                                          height: 40,
                                          
                                          padding: const EdgeInsets.all(7),
                                          decoration: BoxDecoration(
                                            border: Border.all(),
                                            borderRadius: BorderRadius.circular(15),
                                          ),
                                          child: DropdownButton(
                          
                                              underline: const SizedBox(),
                                              value: _role,
                                              items: _roles
                              .map<DropdownMenuItem<String>>(
                                  (value) => DropdownMenuItem(
                                      value: value,
                                      child: CustomText(
                                        label: value,
                                      )))
                              .toList(),
                                              onChanged: (value) {
                            setState(() {
                              _role = value!;
                            });
                                              }),
                                        ),
                          ),
                        ],
                      ),
                  getSpaceH(height: 40),

                  CustomElevatedButton(
                      borderRadius: BorderRadius.circular(20),
                      width: getMySize(context: context).height / 2,
                      onPressed: () {},
                      child: const CustomText(
                        label: "Create",
                        color: whiteColor,
                      ))
                ],
              ),
            ),
          )),
    );
  }
}
