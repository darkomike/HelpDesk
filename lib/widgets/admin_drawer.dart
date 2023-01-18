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
          color: whiteColor,
        ),
        child: Column(
          children: [
            DrawerHeader(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: const EdgeInsets.all(20),
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: greenColor.withOpacity(0.3),
                        child: Icon(Icons.person_outlined)
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
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
                  ),
                ],
              ),
            ),
            const Center(
              child: CustomText(
                label: 'STATUSES',
                fontSize: 20,
                letterSpacing: 1,
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
    highlightColor: greenColor.withOpacity(.7),
    onTap: onTap,
    child: Column(
      children: [
        ListTile(
          title: CustomText(
            label: label,
            fontSize: 18 ,
            color: blackColor
          ),
          trailing: Card(
            color: greenColor.withOpacity(0.2),
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
          thickness: 0.5,
          color: blackColor.withOpacity(0.6),
        ),
      ],
    ),
  );
}
