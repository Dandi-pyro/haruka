import 'package:flutter/material.dart';
import 'package:haruka2022/screen/admin/home_admin.dart';
import 'package:haruka2022/screen/account_screen.dart';
import 'package:haruka2022/screen/apg/apg_admin.dart';
import 'package:haruka2022/screen/awg/awg_screen.dart';
import 'package:haruka2022/screen/dbhar/db_har_admin_control.dart';
import 'package:haruka2022/screen/dbhar/dbhar_admin.dart';
import 'package:haruka2022/screen/dbhar/db_har_user.dart';

class TabControlScreenAdmin extends StatefulWidget {
  const TabControlScreenAdmin({super.key});

  @override
  State<TabControlScreenAdmin> createState() => _TabControlScreenAdminState();
}

class _TabControlScreenAdminState extends State<TabControlScreenAdmin> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.assignment), label: 'DB Har.'),
          BottomNavigationBarItem(icon: Icon(Icons.science), label: 'AWG'),
          BottomNavigationBarItem(icon: Icon(Icons.policy), label: 'APG'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Account'),
        ],
      ),
      body: currentIndex == 0
          ? HomeScreenAdmin()
          : currentIndex == 1
              ? DbHarAdminControl()
              : currentIndex == 2
                  ? AwgScreen()
                  : currentIndex == 3
                      ? ApgAdmin()
                      : AccountScreen(),
    );
  }
}
