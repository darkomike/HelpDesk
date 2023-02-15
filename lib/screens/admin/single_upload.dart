import 'index.dart';

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
  final _indexNumberController = TextEditingController();
  final _studentNumberController = TextEditingController();
  final _roles = ["Choose", "Admin", "Agent", "Lecturer", "Student"];
  final _years = [
    "Choose",
    "PhD(Extension/Grace Period/Old System/ 2-years Period Exceeded)",
    "PhD Continuous",
    "PhD Year 1",
    "Masters (Extension/Grace Period/Old System/ 2-years Period Exceeded)",
    "Masters Year 2",
    "Masters Year 1",
    "Undergraduate-Level 400",
    "Undergraduate-Level 300",
    "Undergraduate-Level 200",
    "Undergraduate-Level 100",
  ];
  String _role = "Choose";
  String _year = "Choose";

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await AppUtils.showWarning(
            context, "Do you want to decline add user process?");
        return shouldPop ?? false;
      },
      child: Scaffold(
        appBar: const CustomAppBar(
          title: "Add User",
          backgroundColor: whiteColor,
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  AppUtils.getSpaceH(height: 20),
                  Row(
                    children: [
                      const Expanded(
                          child: CustomText(
                        label: "Select Role: ",
                        fontWeight: FontWeight.bold,
                      )),
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
                  AppUtils.getSpaceH(height: 20),
                  _role == "Student"
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CustomText(
                              label: "Select your year ",
                              fontWeight: FontWeight.bold,
                            ),
                            AppUtils.getSpaceH(height: 10),
                            Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: DropdownButton(
                                  underline: const SizedBox(),
                                  value: _year,
                                  isExpanded: true,
                                  items: _years
                                      .map<DropdownMenuItem<String>>(
                                          (value) => DropdownMenuItem(
                                              value: value,
                                              child: CustomText(
                                                label: value,
                                                overflow: TextOverflow.visible,
                                              )))
                                      .toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      _year = value!;
                                    });
                                  }),
                            ),
                          ],
                        )
                      : const SizedBox(),
                  AppUtils.getSpaceH(height: 10),
                  _role == "Student"
                      ? CustomTextField(
                          controller: _indexNumberController,
                          hintText: "0000000",
                          labelText: "Index Number",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter User Index Number';
                            }
                            return null;
                          },
                        )
                      : const SizedBox(),
                  _role == "Student"
                      ? AppUtils.getSpaceH(height: 20)
                      : AppUtils.getSpaceH(height: 5),
                  _role == "Student"
                      ? CustomTextField(
                          controller: _studentNumberController,
                          hintText: "0000000",
                          labelText: "Student Ref",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter User Student Ref';
                            }
                            return null;
                          },
                        )
                      : const SizedBox(),
                  _role == "Student"
                      ? AppUtils.getSpaceH(height: 20)
                      : AppUtils.getSpaceH(height: 5),
                  CustomTextField(
                    controller: _surnameController,
                    hintText: "Addo",
                    labelText: "Surname",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter User Surname';
                      }
                      return null;
                    },
                  ),
                  AppUtils.getSpaceH(height: 20),
                  CustomTextField(
                    controller: _otherNamesController,
                    hintText: "Michael",
                    labelText: "Other Names",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter User Other Names';
                      }
                      return null;
                    },
                  ),
                  AppUtils.getSpaceH(height: 20),
                  CustomTextField(
                    controller: _telephoneController,
                    hintText: "0551167889",
                    labelText: "Telephone",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter User Phone Number';
                      }
                      return null;
                    },
                  ),
                  AppUtils.getSpaceH(height: 20),
                  CustomTextField(
                    controller: _emailController,
                    hintText: "maddo@gmail.com",
                    labelText: "Email",
                    validator: InputValidation().emailValidation,
                  ),
                  AppUtils.getSpaceH(height: 40),
                  CustomElevatedButton(
                      borderRadius: BorderRadius.circular(20),
                      width: AppUtils.getMySize(context: context).height / 2,
                      onPressed: () async {
                        if (_role == 'Choose') {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            backgroundColor: Colors.red,
                            content: Text('Please select User Role'),
                          ));
                          return;
                        }

                        switch (_role) {
                          case 'Student':
                            if (_year == "Choose") {
                              AppUtils.showErrorDialog(
                                title: 'Required Field',
                                errorMessage: 'Please select student year',
                                context: context,
                              );

                              return;
                            }
                            if (!_formKey.currentState!.validate()) {
                              return;
                            }

                            setState(() {
                              _isLoading = true;
                            });

                            final studentModel = StudentModel(
                              surname: _surnameController.text.trim(),
                              otherNames: _otherNamesController.text.trim(),
                              email: _emailController.text.trim(),
                              telephone: _telephoneController.text.trim(),
                              studentID: AppUtils.randomString(15),
                              createdAt: DateTime.now().toIso8601String(),
                              indexNumber: _indexNumberController.text.trim(),
                              studentReference:
                                  _studentNumberController.text.trim(),
                              studentYear: _year,
                            );

                            try {
                              User? user;
                              await FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(
                                email: _emailController.text.trim(),
                                password: _studentNumberController.text.trim(),
                              )
                                  .then((value) {
                                user = value.user;
                                studentModel.studentID = user!.uid;
                              });

                              await FirebaseFirestore.instance
                                  .collection('students')
                                  .doc(studentModel.studentID)
                                  .set(studentModel.toJson());
                              NavUtils.pushReplace(
                                context: context,
                                destination: const CreateUser(),
                              );
                            } catch (onError) {
                              AppUtils.showErrorDialog(
                                title: 'User Upload Error',
                                errorMessage:
                                    "Oops, something went wrong.\n${onError.toString()}",
                                context: context,
                              );
                            } finally {
                              setState(() {
                                _isLoading = false;
                              });
                            }
                            break;

                          case 'Admin':
                            if (!_formKey.currentState!.validate()) {
                              return;
                            }

                            setState(() {
                              _isLoading = true;
                            });

                            final adminModel = AdminModel(
                              surname: _surnameController.text.trim(),
                              otherNames: _otherNamesController.text.trim(),
                              email: _emailController.text.trim(),
                              createdAt: DateTime.now().toIso8601String(),
                              telephone: _telephoneController.text.trim(),
                              userID: AppUtils.randomString(15),
                            );

                            User? user;

                            try {
                              await FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(
                                email: _emailController.text.trim(),
                                password: _studentNumberController.text.trim(),
                              )
                                  .then((value) {
                                user = value.user;
                                adminModel.userID = user!.uid;
                              });

                              await FirebaseFirestore.instance
                                  .collection('admin')
                                  .doc(adminModel.userID)
                                  .set(adminModel.toJson());

                              NavUtils.pushReplace(
                                context: context,
                                destination: const CreateUser(),
                              );
                            } catch (onError) {
                              AppUtils.showErrorDialog(
                                title: 'User Upload Error',
                                errorMessage:
                                    "Oops, something went wrong.\n${onError.toString()}",
                                context: context,
                              );
                            } finally {
                              setState(() {
                                _isLoading = false;
                              });
                            }
                            break;

                          case 'Lecturer':
                            if (!_formKey.currentState!.validate()) {
                              return;
                            }
                            // TODO: Implement Lecturer user creation logic
                            break;

                          case 'Agent':
                            if (!_formKey.currentState!.validate()) {
                              return;
                            }
                            // TODO: Implement Agent user creation logic
                            break;

                          default:
                            break;
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            label:
                                _isLoading ? "Processing request..." : "Create",
                            color: whiteColor,
                          ),
                          _isLoading
                              ? const CircularProgressIndicator()
                              : const SizedBox(),
                        ],
                      )),
                  AppUtils.getSpaceH(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
