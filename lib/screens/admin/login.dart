import 'dart:isolate';

import 'package:helpdesk/screens/student/landing_page_student.dart';

import 'index.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _isLoading = false;

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
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                getSpaceH(height: 20),
                const CustomText(
                  label: "Welcome Back",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                getSpaceH(height: 20),
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Image(
                    image: AssetImage(
                      getImagePath(name: 'logo', extension: 'png'),
                    ),
                  ),
                ),
                getSpaceH(height: 20),
                CustomTextField(
                  controller: _emailController,
                  hintText: 'admin@gmail.com',
                  validator: (value) {
                    return value!.isEmpty ? "Invalid Input" : null;
                  },
                  labelText: 'User ID',
                ),
                getSpaceH(height: 20),
                CustomTextField(
                   validator: (value) {
                    return value!.isEmpty ? "Invalid Input" : null;
                  },
                 
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
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        _isLoading = true;
                      });
                      getDelayed(
                          duration: 3,
                          callback: () {
                            pushReplace(
                              context: context,
                              destination: const LandingPageStudent(),
                            );
                          });
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        label: _isLoading ? "Authenticating..." : "Login",
                        color: whiteColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      getSpaceW(width: 10),
                      _isLoading
                          ? const SizedBox(
                              height: 22,
                              width: 22,
                              child: CircularProgressIndicator(
                                color: whiteColor,
                                strokeWidth: 1.4,
                              ))
                          : const SizedBox()
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
