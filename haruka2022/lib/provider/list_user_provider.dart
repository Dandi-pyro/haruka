import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:haruka2022/model/api/services_api.dart';
import 'package:haruka2022/model/list_user_model.dart';

class ListUserProvider with ChangeNotifier {
  ListUserModel _user = ListUserModel();
  ListUserModel get user => _user;
  ServicesApi service = ServicesApi();

  Future getListUser() async {
    try {
      final data = await service.getListUser();
      if (data.message == 'Success get user!') {
        _user = data;
        notifyListeners();
      } else {
        Fluttertoast.showToast(msg: data.message!);
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Server Error, Tolong Tunggu Sebentar');
    }
  }
}
