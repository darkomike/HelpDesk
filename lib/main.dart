import 'index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SharedPreferencesHelper().init();

  SharedPreferencesHelper().getValue(key: isLoggedInKey) ??
      SharedPreferencesHelper().saveValue(key: isLoggedInKey, value: false);

  SharedPreferencesHelper().saveValue(
    key: userRole,
    value: SharedPreferencesHelper().getValue(key: userRole) ?? 'Admin',
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppState()),
        ChangeNotifierProvider(create: (_) => UserState()),
      ],
      child: const CsHelpDeskApp(),
    ),
  );
}

class CsHelpDeskApp extends StatelessWidget {
  const CsHelpDeskApp({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint(
        "User Role Provider: ${Provider.of<UserState>(context).userRolee}");
    debugPrint(
        "User Role SharedPrefer: ${SharedPreferencesHelper().getValue(key: userRole)}");
    return MaterialApp(
      title: 'CS Help Desk',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
        primarySwatch: Colors.green,
      ),
      home: SharedPreferencesHelper().getValue(key: isLoggedInKey)
          ?  NavUtils.checkUserLoginMode(
              userRole: SharedPreferencesHelper().getValue(key: userRole),
            )
          : const Login(),
    );
  }
}
