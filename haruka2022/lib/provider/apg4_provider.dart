import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:haruka2022/model/apg_model.dart';
import 'package:haruka2022/model/api/services_api.dart';

class Apg4Provider with ChangeNotifier {
  ApgModel _apg = ApgModel();
  ApgModel get apg => _apg;
  ServicesApi service = ServicesApi();

  Future getApg(String apg) async {
    try {
      final data = await service.getApg(apg);
      if (data.message == 'Success get data!') {
        _apg = data;
        notifyListeners();
      } else {
        Fluttertoast.showToast(msg: data.message!);
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Server Error, Tolong Tunggu Sebentar');
    }
  }
}
