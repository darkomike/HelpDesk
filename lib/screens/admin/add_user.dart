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
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
        final shouldPop = await showWarning(
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
                  getSpaceH(height: 20),
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
                  getSpaceH(height: 20),
                  _role == "Student"
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CustomText(
                              label: "Select your year ",
                              fontWeight: FontWeight.bold,
                            ),
                            getSpaceH(height: 10),
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
                  getSpaceH(height: 10),
                  _role == "Student"
                      ? CustomTextField(
                          controller: _surnameController,
                          hintText: "0000000",
                          labelText: "Index Number")
                      : const SizedBox(),
                  _role == "Student"
                      ? getSpaceH(height: 20)
                      : getSpaceH(height: 5),
                  _role == "Student"
                      ? CustomTextField(
                          controller: _surnameController,
                          hintText: "0000000",
                          labelText: "Student Ref")
                      : const SizedBox(),
                  _role == "Student"
                      ? getSpaceH(height: 20)
                      : getSpaceH(height: 5),
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
                      onPressed: () {},
                      child: const CustomText(
                        label: "Create",
                        color: whiteColor,
                      )),
                  getSpaceH(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
