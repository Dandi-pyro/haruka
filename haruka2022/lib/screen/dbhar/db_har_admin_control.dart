import 'package:flutter/material.dart';
import 'package:haruka2022/screen/dbhar/create_dbhar.dart';
import 'package:haruka2022/screen/dbhar/dbhar_admin.dart';

class DbHarAdminControl extends StatefulWidget {
  const DbHarAdminControl({super.key});

  @override
  State<DbHarAdminControl> createState() => _DbHarAdminControlState();
}

class _DbHarAdminControlState extends State<DbHarAdminControl> {
  final List<Tab> myTabs = <Tab>[
    const Tab(text: 'View Data'),
    const Tab(text: 'Add Data'),
    const Tab(text: 'Chart'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            unselectedLabelColor: Colors.black,
            tabs: myTabs,
          ),
          title: const Text('Harmonization Data'),
          centerTitle: true,
        ),
        body: TabBarView(
          children: [
            DbHarAdmin(),
            CreateDbHarScreen(),
            Center(),
          ],
        ),
      ),
    );
  }
}
