import 'package:flutter/material.dart';
import 'package:helpdesk/constants/index.dart';
import 'package:helpdesk/screens/index.dart';
import 'package:helpdesk/utils/index.dart';
import 'package:helpdesk/widgets/index.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: whiteColor,
      appBar: const CustomAppBar(
        title: "Login",
        backgroundColor: whiteColor,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              getSpaceH(height: 20),
              Container(
                height: 100,
                width: 100,
                color: Colors.red,
              ),
              getSpaceH(height: 20),
              CustomTextField(
                controller: _emailController,
                hintText: 'admin@gmail.com',
                labelText: 'User ID',
              ),
              getSpaceH(height: 20),
              CustomTextField(
                controller: _passwordController,
                hintText: '*************',
                labelText: 'Password',
              ),
              getSpaceH(height: 20),
              CustomElevatedButton(
                  width: double.infinity,
                  height: 50,
                  borderRadius: BorderRadius.circular(20),
                  onPressed: () {
                    pushReplace(context: context, destination: const AdminHome());
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(color: whiteColor),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
