import 'package:flutter/material.dart';
import 'package:helpdesk/constants/index.dart';
import 'package:helpdesk/screens/add_user.dart';
import 'package:helpdesk/screens/batch_upload.dart';
import 'package:helpdesk/utils/index.dart';
import 'package:helpdesk/widgets/index.dart';

class CreateUser extends StatefulWidget {
  const CreateUser({super.key});

  @override
  State<CreateUser> createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar(
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
          icon: const Icon(
            Icons.menu,
            color: blackColor,
          ),
        ),
        title: "Create User",
        backgroundColor: whiteColor,
      ),
      drawer: const AdminDrawer(),
      body: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              push(context: context, destination: BatchUpload());
            },
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.upload_file_sharp),
                  getSpaceH(height: 10),
                  const CustomText(label: "Batch Upload")
                ],
              ),
            ),
          ),
          getSpaceW(width: 10),
          InkWell(
            onTap: () {
              push(context: context, destination: AddUser());
            },
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.upload_file_sharp),
                  getSpaceH(height: 10),
                  const CustomText(label: "Single Upload")
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
