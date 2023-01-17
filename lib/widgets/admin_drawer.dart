import 'index.dart';

class AdminDrawer extends StatelessWidget {
  const AdminDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.transparent,
      width: MediaQuery.of(context).size.width * 0.8,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                const Color.fromARGB(255, 244, 255, 244).withOpacity(0.7),
                const Color.fromARGB(255, 4, 186, 7).withOpacity(0.7)
              ]),
        ),
        child: Column(
          children: [
            DrawerHeader(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.all(20),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.transparent,
                      child: Image.asset(
                        'assets/images/profile.png',
                        height: 100,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        color: Colors.transparent,
                        padding: const EdgeInsets.all(10.0),
                        child: const Text(
                          'Admin',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        child: const Text(
                          'admin@mail.com',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              height: 5,
              thickness: 1.1,
              color: blackColor.withOpacity(0.4),
            ),
            const Center(
              child: CustomText(
                label: 'STATUSES',
                fontSize: 25,
                letterSpacing: 3,
              ),
            ),
            drawerMenuItem(label: 'Open', value: '4', onTap: () {}),
            drawerMenuItem(label: 'Pending', value: '0', onTap: () {}),
            drawerMenuItem(label: 'Closed', value: '0', onTap: () {}),
            drawerMenuItem(label: 'On Hold', value: '0', onTap: () {}),
          ],
        ),
      ),
    );
  }
}

Widget drawerMenuItem({
  required String label,
  required String value,
  required onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Column(
      children: [
        ListTile(
          title: CustomText(
            label: label,
            fontSize: 20,
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
          trailing: Card(
            shape: const CircleBorder(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomText(
                label: value,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
        ),
        Divider(
          height: 5,
          thickness: 1.1,
          color: blackColor.withOpacity(0.4),
        ),
      ],
    ),
  );
}
