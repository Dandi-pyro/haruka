import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:haruka2022/model/api/services_api.dart';
import 'package:haruka2022/model/dbhar_model.dart';

class DbHarFilterProvider with ChangeNotifier {
  DbHarModel _dbHar = DbHarModel();
  DbHarModel get dbHar => _dbHar;
  ServicesApi service = ServicesApi();

  Future getDbHar(
      String wp,
      String minOverlap,
      String maxOverlap,
      String minBandwith,
      String maxBandwith,
      String minFrequency,
      String maxFrequency) async {
    try {
      final data = await service.getDbHarFilter(wp, minOverlap, maxOverlap,
          minBandwith, maxBandwith, minFrequency, maxFrequency);
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
