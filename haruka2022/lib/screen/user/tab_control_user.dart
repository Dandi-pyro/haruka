import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:haruka2022/screen/account_screen.dart';
import 'package:haruka2022/screen/apg/apg_user.dart';
import 'package:haruka2022/screen/awg/awg_screen.dart';
import 'package:haruka2022/screen/dbhar/db_har_user.dart';
import 'package:haruka2022/screen/user/home_user.dart';

class TabControlScreen extends StatefulWidget {
  const TabControlScreen({super.key});

  @override
  State<TabControlScreen> createState() => _TabControlScreenState();
}

class _TabControlScreenState extends State<TabControlScreen> {
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
          ? HomeScreenUser()
          : currentIndex == 1
              ? DbHarUser()
              : currentIndex == 2
                  ? AwgScreen()
                  : currentIndex == 3
                      ? ApgUser()
                      : AccountScreen(),
    );
  }
}
