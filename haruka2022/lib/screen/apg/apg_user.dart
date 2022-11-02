import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:haruka2022/screen/apg/apg3.dart';
import 'package:haruka2022/screen/apg/apg3_user.dart';
import 'package:haruka2022/screen/apg/apg4.dart';
import 'package:haruka2022/screen/apg/apg4_user.dart';
import 'package:haruka2022/screen/apg/search_apg4_user.dart';

class ApgUser extends StatefulWidget {
  const ApgUser({super.key});

  @override
  State<ApgUser> createState() => _ApgUserState();
}

class _ApgUserState extends State<ApgUser> {
  final List<Tab> myTabs = <Tab>[
    const Tab(text: 'APG23-3'),
    const Tab(text: 'APG23-4'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            unselectedLabelColor: Colors.black,
            tabs: myTabs,
          ),
          title: const Text('APG'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchApg4UserScreen(),
                    ),
                  );
                },
                icon: Icon(Icons.search_rounded)),
          ],
        ),
        body: TabBarView(
          children: [
            Apg3UserScreen(),
            Apg4UserScreen(),
          ],
        ),
      ),
    );
  }
}
