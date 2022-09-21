import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:haruka2022/model/api/services_api.dart';
import 'package:haruka2022/model/edit_user_model.dart';

class EditUserProvider with ChangeNotifier {
  EditUserModel _user = EditUserModel();
  EditUserModel get user => _user;
  ServicesApi service = ServicesApi();

  Future<bool> putEditUser(String name, String username, String email,
      String instansi, String level) async {
    try {
      final data =
          await service.putEditUser(name, username, email, instansi, level);
      if (data.message == 'Success change data account!') {
        _user = data;
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
