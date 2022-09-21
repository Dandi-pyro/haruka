import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:haruka2022/model/api/services_api.dart';
import 'package:haruka2022/model/forgot_password_model.dart';

class ForgotPasswordProvider with ChangeNotifier {
  ForgotPasswordModel _pass = ForgotPasswordModel();
  ForgotPasswordModel get pass => _pass;
  ServicesApi service = ServicesApi();

  Future<bool> getPassword(String email) async {
    try {
      final data = await service.postForgotPassword(email);
      if (data.message == 'Success create new password, check email please!') {
        _pass = data;
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
    }
  }
}
