import 'package:helpdesk/widgets/custom_text_field_password.dart';

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

  String _text = 'Student';

  bool _passwordObscure = true;
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
                CustomText(
                  label: "Welcome Back \n$_text",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.center,
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
                CustomTextFieldPassword(
                  obscureText: _passwordObscure,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _passwordObscure = !_passwordObscure;
                      });
                    },
                    icon: const Icon(Icons.visibility),
                  ),
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
                      switch (_text) {
                        case "Student":
                          getDelayed(
                            duration: 3,
                            callback: () {
                              pushReplace(
                                context: context,
                                destination: const LandingPageStudent(),
                              );
                            },
                          );
                          break;
                        case "Admin":
                          getDelayed(
                              duration: 3,
                              callback: () {
                                pushReplace(
                                  context: context,
                                  destination: const LandingPageAdmin(),
                                );
                              });
                          break;
                        case "Lecturer":
                          setState(() {
                            _isLoading = false;
                          });
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: CustomText(
                              label: 'Coming Soon ...',
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ));
                          break;
                        case "Agent":
                          setState(() {
                            _isLoading = false;
                          });
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: CustomText(
                              label: 'Coming Soon ...',
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ));
                          break;
                        default:
                          break;
                      }
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
                getSpaceH(height: 20),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CustomText(
                        label: 'Not $_text ?',
                        fontSize: 18,
                      ),
                      getSpaceW(width: 20),
                      TextButton(
                        child: const Text('Change Login'),
                        onPressed: () {
                          // display bottom sheet
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return SizedBox(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    TextButton(
                                      child: const CustomText(
                                        label: 'Login as Admin',
                                        fontSize: 18,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _text = 'Admin';
                                        });
                                        Navigator.pop(context);
                                      },
                                    ),
                                    TextButton(
                                      child: const CustomText(
                                        label: 'Login as Lecturer',
                                        fontSize: 18,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _text = 'Lecturer';
                                        });
                                        Navigator.pop(context);
                                      },
                                    ),
                                    TextButton(
                                      child: const CustomText(
                                        label: 'Login as Agent',
                                        fontSize: 18,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _text = 'Agent';
                                        });
                                        Navigator.pop(context);
                                      },
                                    ),
                                    TextButton(
                                      child: const CustomText(
                                        label: 'Login as Student',
                                        fontSize: 18,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _text = 'Student';
                                        });
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ),
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
