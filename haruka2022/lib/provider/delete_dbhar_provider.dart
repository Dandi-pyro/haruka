import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:haruka2022/model/api/services_api.dart';
import 'package:haruka2022/model/delete_dbhar_model.dart';

class DeleteDbHarProvider with ChangeNotifier {
  DeleteDbHarModel _dbHar = DeleteDbHarModel();
  DeleteDbHarModel get dbHar => _dbHar;
  ServicesApi service = ServicesApi();

  Future deleteDbHar(String id) async {
    try {
      final data = await service.deleteDbHar(id);
      if (data.message == 'Success update data!') {
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
