import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:haruka2022/model/api/services_api.dart';
import 'package:haruka2022/model/create_dbhar_model.dart';

class CreateDbHarProvider with ChangeNotifier {
  CreateDbHarModel _dbHar = CreateDbHarModel();
  CreateDbHarModel get dbHar => _dbHar;
  ServicesApi service = ServicesApi();

  Future postDbHar(
    String minFrequency,
    String maxFrequency,
    String bandwidth,
    String band,
    String jenisBand,
    String wp,
    String techWorld,
    String techIndonesia,
    String license,
    String assignment,
    String document,
    String isuTeknis,
    String isuLain,
    String ref,
    String ket,
    String ide,
    String idUser,
  ) async {
    try {
      final data = await service.postCreateDbhar(
          minFrequency,
          maxFrequency,
          bandwidth,
          band,
          jenisBand,
          wp,
          techWorld,
          techIndonesia,
          license,
          assignment,
          document,
          isuTeknis,
          isuLain,
          ref,
          ket,
          ide,
          idUser);
      if (data.message == 'Success create data!') {
        _dbHar = data;
        notifyListeners();
        Fluttertoast.showToast(msg: data.message!);
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
