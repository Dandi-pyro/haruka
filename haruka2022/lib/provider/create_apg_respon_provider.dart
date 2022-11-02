import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:haruka2022/model/api/services_api.dart';
import 'package:haruka2022/model/create_apg_respon_model.dart';

class CreateApgResponProvider with ChangeNotifier {
  CreateApgResponModel _apg = CreateApgResponModel();
  CreateApgResponModel get apg => _apg;
  ServicesApi service = ServicesApi();

  Future postApgRespon(
    String id,
    String alokasi,
    String agendaItem,
    String judul,
    String dokumen,
    String negara,
    String respon,
    String note,
    String user,
  ) async {
    try {
      final data = await service.postCreateApgRespon(
          id, alokasi, agendaItem, judul, dokumen, negara, respon, note, user);
      if (data.message == 'Success create APG!') {
        _apg = data;
        notifyListeners();
        Fluttertoast.showToast(msg: 'Apg Respon Created');
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
