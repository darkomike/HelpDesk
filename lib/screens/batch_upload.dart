import 'package:flutter/material.dart';
import 'package:helpdesk/constants/index.dart';
import 'package:helpdesk/screens/new_users.dart';
import 'package:helpdesk/utils/index.dart';
import 'package:helpdesk/widgets/index.dart';

class BatchUpload extends StatefulWidget {
  const BatchUpload({super.key});

  @override
  State<BatchUpload> createState() => _BatchUploadState();
}

class _BatchUploadState extends State<BatchUpload> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Batch Upload",
        backgroundColor: whiteColor,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.file_present),
                  getSpaceH(height: 10),
                  const CustomText(label: "filename.exe")
                ],
              ),
            ),
          ),
          getSpaceH(height: 20),
          CustomElevatedButton(
              width: getMySize(context: context).width / 2,
              borderRadius: BorderRadius.circular(20),
              onPressed: () {
                push(context: context, destination: NewUsers());
              },
              child: CustomText(
                color: whiteColor,
                label: "Submit",
              ))
        ],
      )),
    );
  }
}
