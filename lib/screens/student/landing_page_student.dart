import 'index.dart';

class LandingPageStudent extends StatefulWidget {
  const LandingPageStudent({super.key});

  @override
  State<LandingPageStudent> createState() => _LandingPageStudentState();
}

class _LandingPageStudentState extends State<LandingPageStudent> {
  int _selectedIndex = 0;

  final List<Widget> _children = [
    const StudentSupport(),
    const StudentThesis(),
    const StudentMiniProject()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }



  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showWarning(context, "Do you want to exit app?");
        return shouldPop ?? false;
      },child: Scaffold(
        body: _children[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(

          iconSize: 25,
          selectedFontSize: 16,
          unselectedFontSize: 14,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.support),
              label: 'Support',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.file_copy_sharp),
              label: 'Thesis',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.work_outline,
              ),
              label: 'Mini Project',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
