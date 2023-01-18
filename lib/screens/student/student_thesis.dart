import 'index.dart';

class StudentThesis extends StatefulWidget {
  const StudentThesis({super.key});

  @override
  State<StudentThesis> createState() => _StudentThesisState();
}

class _StudentThesisState extends State<StudentThesis> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Thesis"),
    );
  }
}