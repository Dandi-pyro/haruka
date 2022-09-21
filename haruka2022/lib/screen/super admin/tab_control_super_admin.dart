import 'package:flutter/material.dart';
import 'package:haruka2022/screen/super%20admin/home_super_admin.dart';
import 'package:haruka2022/screen/account_screen.dart';
import 'package:haruka2022/screen/user/db_har_user.dart';

class TabControlScreenSuperAdmin extends StatefulWidget {
  const TabControlScreenSuperAdmin({super.key});

  @override
  State<TabControlScreenSuperAdmin> createState() =>
      _TabControlScreenSuperAdminState();
}

class _TabControlScreenSuperAdminState
    extends State<TabControlScreenSuperAdmin> {
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
          ? HomeScreenSuperAdmin()
          : currentIndex == 1
              ? DbHarUser()
              : currentIndex == 2
                  ? Center()
                  : currentIndex == 3
                      ? Center()
                      : AccountScreen(),
    );
  }
}
