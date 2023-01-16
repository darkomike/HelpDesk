import 'package:flutter/material.dart';
import 'package:helpdesk/constants/index.dart';
import 'package:helpdesk/screens/admin_home.dart';
import 'package:helpdesk/screens/create_user.dart';
import 'package:helpdesk/screens/login.dart';
import 'package:helpdesk/screens/users.dart';
import 'package:helpdesk/utils/index.dart';
import 'package:helpdesk/widgets/index.dart';

class AdminDrawer extends StatelessWidget {
  const AdminDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [greenColor, greenColor])),
        child: Column(
          children: [
            DrawerHeader(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 40,
                    ),
                    getSpaceW(width: 20),
                    Card(
                      color: whiteColor.withOpacity(.4),
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: CustomText(label: "Administrator"),
                      ),
                    )
                  ],
                ),
                Card(
                  color: whiteColor.withOpacity(.4),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: CustomText(label: "administrator@email.com"),
                  ),
                )
              ],
            )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  CustomElevatedButton(
                    onPressed: () {
                      pushReplace(
                          context: context, destination: const AdminHome());
                    },
                    width: double.infinity,
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(colors: [
                      whiteColor.withOpacity(0.4),
                      whiteColor.withOpacity(0.4)
                    ]),
                    child: const CustomText(
                      label: "Tickets",
                    ),
                  ),
                  getSpaceH(height: 40),
                  CustomElevatedButton(
                    onPressed: () {
                      pushReplace(context: context, destination: const Users());
                    },
                    width: double.infinity,
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(colors: [
                      whiteColor.withOpacity(0.4),
                      whiteColor.withOpacity(0.4)
                    ]),
                    child: const CustomText(
                      label: "Users",
                    ),
                  ),
                  getSpaceH(height: 40),
                  CustomElevatedButton(
                    onPressed: () {
                      pushReplace(
                          context: context, destination: const CreateUser());
                    },
                    width: double.infinity,
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(colors: [
                      whiteColor.withOpacity(0.4),
                      whiteColor.withOpacity(0.4)
                    ]),
                    child: const CustomText(
                      label: "Create Users",
                    ),
                  ),
                  getSpaceH(height: 40),
                  CustomElevatedButton(
                    onPressed: () {
                      pushReplace(context: context, destination: const Login());
                    },
                    width: double.infinity,
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(colors: [
                      whiteColor.withOpacity(0.4),
                      whiteColor.withOpacity(0.4)
                    ]),
                    child: const CustomText(
                      label: "Sign Out",
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
