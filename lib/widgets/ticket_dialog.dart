import 'index.dart';


Widget ticketDetailsDialog({required BuildContext context}) {
  return CustomDialog(
    title: 'Ticket Detail',
    body: Column(
        children: [
          
          SizedBox(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  const Icon(Icons.shield_moon_outlined , size: 80,),
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
            padding: const EdgeInsets.all(5.0),
            child: CustomElevatedButton(
                borderRadius: BorderRadius.circular(10),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const  CustomText(
                  label:'OK',color: whiteColor,
          fontSize: 16             )),
          )
        ], )
  );
}

Widget detailsTile({required String title, required String value}) {
  return Container(
    margin: const EdgeInsets.all(10),
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      gradient: LinearGradient(colors: getBackgroundGradientOpacity(opacity: 0.2) )
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
         label: title,
        ),
        CustomText(
          label: value,
        ),
      ],
    ),
  );
}
