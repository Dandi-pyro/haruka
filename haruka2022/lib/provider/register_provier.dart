import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:haruka2022/model/api/services_api.dart';
import 'package:haruka2022/model/register_model.dart';

class RegisterProvider with ChangeNotifier {
  RegisterModel _login = RegisterModel();
  RegisterModel get login => _login;
  ServicesApi service = ServicesApi();

  Future<bool> getRegister(String name, String username, String email,
      String instansi, String password, String level) async {
    try {
      final data = await service.postRegister(
          name, username, email, instansi, password, level);
      if (data.message == "Success login user!") {
        _login = data;
        notifyListeners();
        Fluttertoast.showToast(msg: data.message!);
        return true;
      } else {
        Fluttertoast.showToast(msg: data.message!);
        return false;
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Server Error, Tolong Tunggu Sebentar');
      return false;
      // print(e);
    }
  }
}
