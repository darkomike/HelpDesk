import 'index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesHelper().init();

  SharedPreferencesHelper().getValue(key: isLoggedInKey) ??
      SharedPreferencesHelper().saveValue(key: isLoggedInKey, value: false);

      SharedPreferencesHelper().getValue(key: userRole) ??
  SharedPreferencesHelper().saveValue(key: userRole, value: 'Admin');

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
    return MaterialApp(
      title: 'CS Help Desk',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
        primarySwatch: Colors.green,
      ),
      home: SharedPreferencesHelper().getValue(key: isLoggedInKey)
          ? checkUserLoginMode(userRole: Provider.of<UserState>(context).userRolee)
          : const Login(),
    );
  }
}
