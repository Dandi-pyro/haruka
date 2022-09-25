import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:haruka2022/model/api/services_api.dart';
import 'package:haruka2022/model/edit_dbhar_model.dart';

class EditDbHarProvider with ChangeNotifier {
  EditDbHarModel _dbhar = EditDbHarModel();
  EditDbHarModel get dbhar => _dbhar;
  ServicesApi service = ServicesApi();

  Future<bool> putEditDbHar(
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
    String id,
  ) async {
    try {
      final data = await service.putEditDbHar(
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
        id,
      );
      if (data.message == 'Success update data!') {
        _dbhar = data;
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
