import 'package:flutter/material.dart';
import 'package:helpdesk/constants/constants.dart';
import 'package:helpdesk/screens/admin_home.dart';
import 'package:helpdesk/utils/gaps.dart';
import 'package:helpdesk/utils/nav.dart';
import 'package:helpdesk/widgets/custom_appbar.dart';
import 'package:helpdesk/widgets/custom_elevated_button.dart';

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
                    push(context: context, destination: const AdminHome());
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

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      required TextEditingController controller,
      required String hintText,
      required String labelText})
      : _controller = controller,
        _hintText = hintText,
        _labelText = labelText,
        super(key: key);

  final TextEditingController _controller;
  final String _hintText;
  final String _labelText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      decoration: InputDecoration(
          label: Text(_labelText),
          hintText: _hintText,
          border: const OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: blackColor),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(20))),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: blackColor),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(20))),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 1.5, color: greenColor),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(20)))),
    );
  }
}
