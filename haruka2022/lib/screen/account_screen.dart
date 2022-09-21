import 'package:flutter/material.dart';
import 'package:haruka2022/screen/edit_profile.dart';
import 'package:haruka2022/screen/login.dart';
import 'package:haruka2022/utils/constant/preferences_key.dart';
import 'package:haruka2022/utils/decode/jwt_decode.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  Map<String, dynamic>? user;

  Future getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final JwtDecode jwtDecode = JwtDecode();
    final String data = prefs.get(PreferencesKeys.token).toString();
    user = jwtDecode.parseJwt(data);
  }

  @override
  void initState() {
    super.initState();
    getUser().then((value) {
      print(user);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return user == null
        ? const Center(child: CircularProgressIndicator())
        : Scaffold(
            appBar: AppBar(
              title: const Text('Account'),
              centerTitle: true,
            ),
            body: Column(
              children: [
                SizedBox(height: size.height * 0.25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Username : ',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      user!.values.elementAt(2).toString(),
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Email : ',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      user!.values.elementAt(4).toString(),
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.05),
                Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditProfileScreen()),
                      );
                    },
                    child: const Text('Edit Profile'),
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.remove(PreferencesKeys.token);
                      Navigator.pushAndRemoveUntil(
                          (context),
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()),
                          (route) => false);
                    },
                    child: const Text('LogOut'),
                  ),
                ),
              ],
            ),
          );
  }
}
