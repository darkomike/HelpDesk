import 'dart:convert';

import 'package:helpdesk/utils/files_utils.dart';

import 'index.dart';

class BatchUpload extends StatefulWidget {
  const BatchUpload({super.key});

  @override
  State<BatchUpload> createState() => _BatchUploadState();
}

class _BatchUploadState extends State<BatchUpload> {
  PlatformFile? _attachFile;
  String _filename = "filename.exe";

  @override
  Widget build(BuildContext context) {
    stdout.writeln("This is a message");

    return Scaffold(
      appBar: const CustomAppBar(
        title: "Batch Upload",
        backgroundColor: whiteColor,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              pickAnyFile().then((value) {
                _attachFile = value!.files.first;
                readFileContent(path: _attachFile!.path!).then((value) {

                  List<List<dynamic>> rows = const CsvToListConverter().convert(value);
                  List<Map> jsonData = rows.map((row) => Map.fromIterables(rows[0], row)).toList();
                  debugPrint(json.encode(jsonData));


                });
                debugPrint("Attach file ${readFileContent(path: _attachFile!.path!)}");
                setState(() {
                  _filename =
                      "${shortenPath(value: _attachFile!.name)}${_attachFile!.extension!}";
                });
              });

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
                  const Icon(Icons.file_present),
                  getSpaceH(height: 10),
                  CustomText(label: _filename)
                ],
              ),
            ),
          ),
          getSpaceH(height: 20),
          CustomElevatedButton(
              width: getMySize(context: context).width / 2,
              borderRadius: BorderRadius.circular(20),
              onPressed: () {
                push(context: context, destination: const NewUsers());
              },
              child: const CustomText(
                color: whiteColor,
                label: "Submit",
              ))
        ],
      )),
    );
  }
}
