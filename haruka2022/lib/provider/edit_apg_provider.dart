import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:haruka2022/model/api/services_api.dart';
import 'package:haruka2022/model/create_apg.dart';
import 'package:haruka2022/model/edit_apg_model.dart';

class EditApgProvider with ChangeNotifier {
  EditApgModel _apg = EditApgModel();
  EditApgModel get apg => _apg;
  ServicesApi service = ServicesApi();

  Future putApg(
    String id,
    String alokasi,
    String agendaItem,
    String dokumen,
    String namaDokumen,
    String sourceDokumen,
    String summaryDokumen,
    String tanggalDokumen,
    String picStakeholder,
    String picKominfo,
    String file,
  ) async {
    try {
      final data = await service.putEditApg(
        id,
        alokasi,
        agendaItem,
        dokumen,
        namaDokumen,
        sourceDokumen,
        summaryDokumen,
        tanggalDokumen,
        picStakeholder,
        picKominfo,
        file,
      );
      if (data.message == 'Success update apg!') {
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
