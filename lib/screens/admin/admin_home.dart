import 'index.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _searchTicket = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const AdminDrawer(),
      appBar: CustomAppBar(
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
          icon: const Icon(
            Icons.menu,
            color: blackColor,
          ),
        ),
        title: "All Tickets",
        backgroundColor: whiteColor,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: CustomTextField(
                  onChanged: (value) {},
                  topLeft: 5,
                  topRight: 20,
                  bottomLeft: 10,
                  bottomRight: 20,
                  prefix: const Icon(
                    Icons.search,
                    size: 19,
                  ),
                  controller: _searchTicket,
                  hintText: 'Type user ID',
                  labelText: 'User ID'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "4 Tickets",
                    style: TextStyle(
                      color: blackColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 5,
              thickness: 1.1,
              color: blackColor.withOpacity(0.4),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  const Expanded(
                      flex: 6,
                      child: CustomText(
                          textAlign: TextAlign.center,
                          label: "SUBJECTS",
                          color: blackColor,
                          fontWeight: FontWeight.bold)),
                  getSpaceW(width: 20),
                  const Expanded(
                      flex: 3,
                      child: CustomText(
                          textAlign: TextAlign.center,
                          label: "STATUS",
                          color: blackColor,
                          fontWeight: FontWeight.bold)),
                  getSpaceW(width: 10),
                  const Expanded(
                      flex: 4,
                      child: CustomText(
                          label: "PRIORITY",
                          color: blackColor,
                          textAlign: TextAlign.center,
                          fontWeight: FontWeight.bold)),
                  getSpaceW(width: 10),
                ],
              ),
            ),
            Divider(
              height: 5,
              thickness: 1.1,
              color: blackColor.withOpacity(0.4),
            ),
            Flexible(
              child: ListView.separated(
                separatorBuilder: (context, index) => Divider(
                  height: 5,
                  thickness: 1.1,
                  color: blackColor.withOpacity(0.4),
                ),
                itemCount: 4,
                itemBuilder: (BuildContext context, index) {
                  return TicketButton(
                    isSigned: false,
                    priority: "High",
                    status: 'Open',
                    subject:
                        'Great to have you onboard,The next step is crucial, yet simple! To see messages',
                    onTap: () {
                      push(context: context, destination: const TicketDetail());
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NoTicket extends StatelessWidget {
  const NoTicket({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("No Tickets"));
  }
}
