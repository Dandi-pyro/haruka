import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:haruka2022/model/api/services_api.dart';
import 'package:haruka2022/model/dbhar_model.dart';

class DbHarSearchProvider with ChangeNotifier {
  DbHarModel _dbHar = DbHarModel();
  DbHarModel get dbHar => _dbHar;
  ServicesApi service = ServicesApi();

  Future getDbHar(
    String search,
  ) async {
    try {
      final data = await service.getDbHarSearch(search);
      if (data.message == 'Success get data!') {
        _dbHar = data;
        notifyListeners();
      } else {
        Fluttertoast.showToast(msg: data.message!);
      }
    } catch (e) {
      print(e);
      Fluttertoast.showToast(msg: 'Server Error, Tolong Tunggu Sebentar');
    }
  }
}
