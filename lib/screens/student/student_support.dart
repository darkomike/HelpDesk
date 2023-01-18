import 'package:helpdesk/widgets/custom_shader_mask.dart';

import "index.dart";

class StudentSupport extends StatefulWidget {
  const StudentSupport({super.key});

  @override
  State<StudentSupport> createState() => _StudentSupportState();
}

class _StudentSupportState extends State<StudentSupport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Support",
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: greenColor.withOpacity(0.2),
              child: CustomShaderMask(
                gradient: const LinearGradient(colors: bgColorGradient),
                blendMode: BlendMode.srcIn,
                child: IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) => CustomDialog(
                                body: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Card(
                                        color: whiteColor.withOpacity(.4),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: const [
                                              CustomText(label: "UserID: "),
                                              CustomText(label: "E90FSO"),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Card(
                                        color: whiteColor.withOpacity(.4),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: const [
                                              CustomText(label: "Username: "),
                                              CustomText(label: "Kwame Antwi"),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Card(
                                        color: whiteColor.withOpacity(.4),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: const [
                                              CustomText(label: "Telephone: "),
                                              CustomText(label: "0551167889"),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Card(
                                        color: whiteColor.withOpacity(.4),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: const [
                                              CustomText(label: "Email: "),
                                              CustomText(
                                                  label: "kwantwi@gmail.com"),
                                            ],
                                          ),
                                        ),
                                      ),
                                      getSpaceH(height: 10),
                                      CustomElevatedButton(
                                          width: double.infinity,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          onPressed: () {
                                            getDelayed(
                                                duration: 3,
                                                callback: () {
                                                  push(
                                                      context: context,
                                                      destination:
                                                          const Login());
                                                });
                                          },
                                          child: const CustomText(
                                            color: whiteColor,
                                            label: "Sign Out",
                                          ))
                                    ]),
                                title: 'Student',
                              ));
                    },
                    icon: const Icon(Icons.person)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
