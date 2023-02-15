import 'index.dart';

class CreateUser extends StatefulWidget {
  const CreateUser({super.key});

  @override
  State<CreateUser> createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: const CustomAppBar(
        title: "Create User",
        backgroundColor: whiteColor,
      ),
      body: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              NavUtils.push(context: context, destination: const BatchUpload());
            },
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.upload_file_sharp),
                  AppUtils.getSpaceH(height: 10),
                  const CustomText(label: "Batch Upload")
                ],
              ),
            ),
          ),
          AppUtils.getSpaceW(width: 10),
          InkWell(
            onTap: () {
              NavUtils.push(context: context, destination: const AddUser());
            },
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.upload_file_sharp),
                  AppUtils.getSpaceH(height: 10),
                  const CustomText(label: "Single Upload")
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
