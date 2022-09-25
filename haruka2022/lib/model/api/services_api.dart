import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:haruka2022/model/create_dbhar_model.dart';
import 'package:haruka2022/model/dbhar_model.dart';
import 'package:haruka2022/model/delete_dbhar_model.dart';
import 'package:haruka2022/model/edit_dbhar_model.dart';
import 'package:haruka2022/model/edit_user_model.dart';
import 'package:haruka2022/model/forgot_password_model.dart';
import 'package:haruka2022/model/list_user_model.dart';
import 'package:haruka2022/model/login_model.dart';
import 'package:haruka2022/model/register_model.dart';
import 'package:haruka2022/screen/login.dart';
import 'package:haruka2022/utils/constant/main_navigator_key.dart';
import 'package:haruka2022/utils/constant/preferences_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ServicesApi {
  final baseUrl = 'http://192.168.1.14:80/haruka/index.php';
  final Dio dio = Dio();

  ServicesApi() {
    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      return handler.next(options);
    }, onResponse: (response, handler) {
      return handler.next(response);
    }, onError: (DioError e, handler) async {
      // if (e.response!.statusCode == 401 || e.response!.statusCode == 403) {
      //   final pref = await SharedPreferences.getInstance();
      //   pref.remove(PreferencesKeys.token);
      //   Navigator.pushAndRemoveUntil(
      //       (MainNavigasiKey.mainNavigatorKey.currentContext!),
      //       MaterialPageRoute(builder: (context) => const LoginScreen()),
      //       (route) => false);
      //   Fluttertoast.showToast(msg: 'Token Expired');
      // }
      return handler.next(e);
    }));
  }

  Future<LoginModel> postLogin(String username, String password) async {
    try {
      final url = '$baseUrl/user/login';
      final response = await dio.post(url, data: {
        "username": username,
        "password": password,
      });
      final data = response.data;
      return LoginModel.fromJson(data);
    } on DioError catch (e) {
      if (e.response!.statusCode! >= 400 && e.response!.statusCode! < 500) {
        return LoginModel.fromJson(e.response!.data);
      } else {
        rethrow;
      }
    }
  }

  Future<RegisterModel> postRegister(String name, String username, String email,
      String instansi, String password, String level) async {
    try {
      final url = '$baseUrl/user/registration';
      final response = await dio.post(url, data: {
        "name": name,
        "username": username,
        "email": email,
        "instansi": instansi,
        "password": password,
        "level": level,
      });
      final data = response.data;
      return RegisterModel.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }

  Future<ForgotPasswordModel> postForgotPassword(String email) async {
    try {
      final url = '$baseUrl/user/forgot';
      final response = await dio.post(url, data: {
        "email": email,
      });
      final data = response.data;
      return ForgotPasswordModel.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }

  Future<ListUserModel> getListUser() async {
    try {
      final url = '$baseUrl/user/list?limit=2000';
      final response = await dio.get(url);
      final data = response.data;
      return ListUserModel.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }

  Future<EditUserModel> putEditUser(String name, String username, String email,
      String instansi, String level) async {
    try {
      final url = '$baseUrl/user/changedata';
      final response = await dio.put(url, data: {
        "name": name,
        "username": username,
        "email": email,
        "instansi": instansi,
        "level": level,
      });
      final data = response.data;
      return EditUserModel.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }

  Future<DbHarModel> getDbHar() async {
    try {
      final url = '$baseUrl/maindata/list?limit=2000';
      final response = await dio.get(url);
      final data = response.data;
      return DbHarModel.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }

  Future<DbHarModel> getDbHarFilter(
      String wp,
      String minOverlap,
      String maxOverlap,
      String minBandwith,
      String maxBandwith,
      String minFrequency,
      String maxFrequency) async {
    try {
      final url =
          '$baseUrl/maindata/list?wp=$wp&minIndexOverlap=$minOverlap&maxIndexOverlap=$maxOverlap&minBandwidth=$minBandwith&maxBandwidth=$maxBandwith&min_frekuensi=$minFrequency&max_frekuensi=$maxFrequency&limit=2000';
      final response = await dio.get(url);
      final data = response.data;
      return DbHarModel.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }

  Future<DbHarModel> getDbHarSorting(String sort, String order) async {
    try {
      final url =
          '$baseUrl/maindata/list?sort=$sort&order_by=$order&limit=2000';
      final response = await dio.get(url);
      final data = response.data;
      return DbHarModel.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }

  Future<CreateDbHarModel> postCreateDbhar(
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
      final url = '$baseUrl/maindata/create';
      final response = await dio.post(url, data: {
        "min_frekuensi": minFrequency,
        "max_frekuensi": maxFrequency,
        "bandwidth": bandwidth,
        "band": band,
        "jenis_band": jenisBand,
        "wp": wp,
        "tech_world": techWorld,
        "tech_indonesia": techIndonesia,
        "license": license,
        "assignment": assignment,
        "document": document,
        "isu_teknis": isuTeknis,
        "isu_lain": isuLain,
        "ref": ref,
        "ket": ket,
        "ide": ide,
        "id_user": idUser,
      });
      final data = response.data;
      return CreateDbHarModel.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }

  Future<EditDbHarModel> putEditDbHar(
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
      final url = '$baseUrl/maindata/update';
      final response = await dio.put(url, data: {
        "id": id,
        "min_frekuensi": minFrequency,
        "max_frekuensi": maxFrequency,
        "bandwidth": bandwidth,
        "band": band,
        "jenis_band": jenisBand,
        "wp": wp,
        "tech_world": techWorld,
        "tech_indonesia": techIndonesia,
        "license": license,
        "assignment": assignment,
        "document": document,
        "isu_teknis": isuTeknis,
        "isu_lain": isuLain,
        "ref": ref,
        "ket": ket,
        "ide": ide,
      });
      final data = response.data;
      return EditDbHarModel.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }

  Future<DeleteDbHarModel> deleteDbHar(String id) async {
    try {
      final url = '$baseUrl/maindata/delete';
      final response = await dio.delete(url, data: {"id": id});
      final data = response.data;
      return DeleteDbHarModel.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }
}
