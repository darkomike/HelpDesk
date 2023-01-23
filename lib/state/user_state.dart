import 'index.dart';

class UserState with ChangeNotifier {
  String _userRole = SharedPreferencesHelper().getValue(key: userRole);

  String get userRolee => _userRole;

   setUserRole({required String value}) {
    SharedPreferencesHelper().saveValue(value: value, key: userRolee);

    _userRole = value;
    notifyListeners();
  }
}
