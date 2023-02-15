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
              FileUtils.pickAnyFile().then((value) {
                _attachFile = value!.files.first;
                FileUtils.readFileContent(path: _attachFile!.path!)
                    .then((value) {
                  List<List<dynamic>> rows =
                      const CsvToListConverter().convert(value);
                  List<Map> jsonData = rows
                      .map((row) => Map.fromIterables(rows[0], row))
                      .toList();
                  debugPrint(json.encode(jsonData));
                });
                debugPrint(
                    "Attach file ${FileUtils.readFileContent(path: _attachFile!.path!)}");
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
                  AppUtils.getSpaceH(height: 10),
                  CustomText(label: _filename)
                ],
              ),
            ),
          ),
          AppUtils.getSpaceH(height: 20),
          CustomElevatedButton(
              width: AppUtils.getMySize(context: context).width / 2,
              borderRadius: BorderRadius.circular(20),
              onPressed: () {},
              child: const CustomText(
                color: whiteColor,
                label: "Submit",
              ))
        ],
      )),
    );
  }
}
