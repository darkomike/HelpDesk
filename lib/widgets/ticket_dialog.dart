import 'index.dart';

const TextStyle customTextStyle =
    TextStyle(fontSize: 16, color: Colors.black, letterSpacing: 2);
Widget ticketDetailsDialog({required BuildContext context}) {
  return AlertDialog(
    backgroundColor: Colors.transparent,
    content: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color.fromARGB(255, 255, 255, 255).withOpacity(0.7),
              const Color.fromARGB(255, 240, 240, 240).withOpacity(0.7)
            ]),
      ),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Ticket Details',
              style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 25,
                  letterSpacing: 3),
            ),
          ),
          Divider(
            height: 5,
            thickness: 1.1,
            color: blackColor.withOpacity(0.7),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.45,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 60,
                    child: Image.asset(
                      'assets/images/profile.png',
                      height: 100,
                    ),
                  ),
                  detailsTile(title: 'Ticket ID:', value: 'TC898212X'),
                  detailsTile(title: 'Date Created:', value: '17-01-2023'),
                  detailsTile(title: 'Name: ', value: 'Kwame Antwi'),
                  detailsTile(title: 'Phone: ', value: '0598322102'),
                  detailsTile(title: 'E-mail: ', value: 'Kwame@mail.com'),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: CustomElevatedButton(
                borderRadius: BorderRadius.circular(20),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'OK',
                  style: TextStyle(fontSize: 30, letterSpacing: 3),
                )),
          )
        ],
      ),
    ),
  );
}

Widget detailsTile({required String title, required String value}) {
  return Container(
    margin: const EdgeInsets.all(10),
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color.fromARGB(255, 79, 153, 82).withOpacity(0.4),
            const Color.fromARGB(255, 4, 186, 7).withOpacity(0.4)
          ]),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 5,
          child: Text(
            title,
            style: customTextStyle,
          ),
        ),
        Expanded(
          flex: 5,
          child: Text(
            value,
            style: customTextStyle,
          ),
        ),
      ],
    ),
  );
}
