import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:haruka2022/model/apg_model.dart';
import 'package:haruka2022/model/api/services_api.dart';
import 'package:haruka2022/model/create_apg.dart';

class CreateApgProvider with ChangeNotifier {
  CreateApgModel _apg = CreateApgModel();
  CreateApgModel get apg => _apg;
  ServicesApi service = ServicesApi();

  Future postApg(
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
    String user,
  ) async {
    try {
      final data = await service.postCreateApg(
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
          user);
      if (data.message == 'Success create APG!') {
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
