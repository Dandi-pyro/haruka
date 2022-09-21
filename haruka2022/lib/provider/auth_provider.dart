import 'package:flutter/cupertino.dart';
import 'package:haruka2022/utils/constant/preferences_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  SharedPreferences? _prefs;
  String? _token;

  Future getToken() async {
    _prefs = await SharedPreferences.getInstance();
    _token = _prefs!.getString(PreferencesKeys.token)!;
    notifyListeners();
    return _token;
  }

  Future setToken(String token) async {
    _prefs = await SharedPreferences.getInstance();
    await _prefs!.setString(PreferencesKeys.token, token);
    notifyListeners();
  }

  checkToken() async {}
}
