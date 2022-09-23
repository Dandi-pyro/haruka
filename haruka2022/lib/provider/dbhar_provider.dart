import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:haruka2022/model/api/services_api.dart';
import 'package:haruka2022/model/dbhar_model.dart';

class DbHarProvider with ChangeNotifier {
  DbHarModel _dbHar = DbHarModel();
  DbHarModel get dbHar => _dbHar;
  ServicesApi service = ServicesApi();

  Future getDbHar() async {
    try {
      final data = await service.getDbHar();
      if (data.message == 'Success get data!') {
        _dbHar = data;
        notifyListeners();
      } else {
        Fluttertoast.showToast(msg: data.message!);
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Server Error, Tolong Tunggu Sebentar');
    }
  }
}
