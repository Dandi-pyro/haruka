import 'package:flutter/material.dart';
import 'package:haruka2022/provider/apg3_provider.dart';
import 'package:haruka2022/provider/apg4_provider.dart';
import 'package:haruka2022/provider/dbhar_provider.dart';
import 'package:haruka2022/provider/list_user_provider.dart';
import 'package:haruka2022/screen/admin/tab_control_admin.dart';
import 'package:haruka2022/screen/login.dart';
import 'package:haruka2022/screen/super%20admin/tab_control_super_admin.dart';
import 'package:haruka2022/screen/user/tab_control_user.dart';
import 'package:haruka2022/utils/constant/preferences_key.dart';
import 'package:haruka2022/utils/decode/jwt_decode.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? _token;

  Future getPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _token = prefs.getString(PreferencesKeys.token);
    // prefs.remove(PreferencesKeys.token);
    if (_token != null) {
      if (user == '1') {
        return Navigator.pushAndRemoveUntil(
            (context),
            MaterialPageRoute(
                builder: (context) => const TabControlScreenSuperAdmin()),
            (route) => false);
      } else if (user == '2') {
        return Navigator.pushAndRemoveUntil(
            (context),
            MaterialPageRoute(
                builder: (context) => const TabControlScreenAdmin()),
            (route) => false);
      } else {
        return Navigator.pushAndRemoveUntil(
            (context),
            MaterialPageRoute(builder: (context) => const TabControlScreen()),
            (route) => false);
      }
    } else {
      Navigator.pushAndRemoveUntil(
          (context),
          MaterialPageRoute(builder: (context) => const LoginScreen()),
          (route) => false);
    }
  }

  String? user;

  Future getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final JwtDecode jwtDecode = JwtDecode();
    final String data = prefs.get(PreferencesKeys.token).toString();
    if (data.isEmpty) {
      getPrefs();
    }
    final datas = jwtDecode.parseJwt(data);
    print(datas);
    user = datas.values.elementAt(3).toString();
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      Provider.of<ListUserProvider>(context, listen: false).getListUser();
      Provider.of<DbHarProvider>(context, listen: false).getDbHar();
      Provider.of<Apg3Provider>(context, listen: false).getApg('3');
      Provider.of<Apg4Provider>(context, listen: false).getApg('4');
    });
    getUser();
    getPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
