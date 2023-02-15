import 'index.dart';

class FileUtils {
  static Future<FilePickerResult?> pickFile(
      {required List<String> allowedExtensions,
      required bool allowMultiple}) async {
    return await FilePicker.platform.pickFiles(
      allowedExtensions: allowedExtensions,
      type: FileType.custom,
      allowMultiple: allowMultiple,
    );
  }

  static Future<FilePickerResult?> pickAnyFile() async {
    return await FilePicker.platform.pickFiles();
  }

  static Future<String> readFileContent({required String path}) =>
      File(path).readAsString();

  static convertCsvToJson({required String path}) async {
    final value = await File(path).readAsString();

    List<List<dynamic>> rows = const CsvToListConverter().convert(value);
    List<Map> jsonData =
        rows.map((row) => Map.fromIterables(rows[0], row)).toList();
    debugPrint(json.encode(jsonData.sublist(1, jsonData.length)));
  }
}
