import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:haruka2022/model/api/services_api.dart';
import 'package:haruka2022/model/delete_apg_model.dart';

class DeleteApgProvider with ChangeNotifier {
  DeleteApgModel _apg = DeleteApgModel();
  DeleteApgModel get apg => _apg;
  ServicesApi service = ServicesApi();

  Future deleteApg(
    String id,
  ) async {
    try {
      final data = await service.deleteApg(
        id,
      );
      if (data.message == 'Success delete apg!') {
        _apg = data;
        notifyListeners();
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
