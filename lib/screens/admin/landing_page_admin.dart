import 'index.dart';

class LandingPageAdmin extends StatefulWidget {
  const LandingPageAdmin({super.key});

  @override
  State<LandingPageAdmin> createState() => _LandingPageAdminState();
}

class _LandingPageAdminState extends State<LandingPageAdmin> {
  int _selectedIndex = 0;

  final List<Widget> _children = [
    const AdminHome(),
    const Users(),
    const CreateUser()
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
        final shouldPop = await    AppUtils. showWarning(context, "Do you want to exit app?");
        return shouldPop ?? false;
      },
      child: Scaffold(
        body: _children[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 25,
          selectedFontSize: 16,
          unselectedFontSize: 14,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: 'Tickets',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.group),
              label: 'Users',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_add,
              ),
              label: 'Create User',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
