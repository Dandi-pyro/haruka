import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:haruka2022/model/api/services_api.dart';
import 'package:haruka2022/model/login_model.dart';

class LoginProvider with ChangeNotifier {
  LoginModel _login = LoginModel();
  LoginModel get login => _login;
  ServicesApi service = ServicesApi();

  Future<bool> getLogin(String nik, String password) async {
    try {
      final data = await service.postLogin(nik, password);
      if (data.data != null) {
        _login = data;
        notifyListeners();
        return true;
      } else if (data.data == null) {
        Fluttertoast.showToast(msg: 'Username/Password Salah');
        return false;
      } else {
        return false;
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Server Error, Tolong Tunggu Sebentar');
      return false;
    }
  }
}
