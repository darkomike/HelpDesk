import 'index.dart';

class AppState with ChangeNotifier {
  var _isUserLoggedIn = SharedPreferencesHelper().getValue(key: isLoggedInKey);

  get isUserLoggedIn => _isUserLoggedIn;

   setIsUserLoggedIn({ required bool value}) {
    SharedPreferencesHelper().saveValue(value: value, key: isLoggedInKey);

    _isUserLoggedIn = value;

    notifyListeners();
  }
}
