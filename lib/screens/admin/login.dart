import 'index.dart';

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
                  pushReplace(
                    context: context,
                    destination: const LandingPage(),
                  );
                },
                child: const CustomText(
                  label: "Login",
                  color: whiteColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
