import "index.dart";


class StudentMiniProject extends StatefulWidget {
  const StudentMiniProject({super.key});

  @override
  State<StudentMiniProject> createState() => _StudentMiniProjectState();
}

class _StudentMiniProjectState extends State<StudentMiniProject> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Mini Project"),
    );
  }
}