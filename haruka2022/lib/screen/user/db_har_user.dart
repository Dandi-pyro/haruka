import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:haruka2022/provider/dbhar_provider.dart';
import 'package:haruka2022/screen/dbhar/dbhar_admin.dart';
import 'package:provider/provider.dart';

class DbHarUser extends StatefulWidget {
  const DbHarUser({super.key});

  @override
  State<DbHarUser> createState() => _DbHarUserState();
}

class _DbHarUserState extends State<DbHarUser> {
  final List<Tab> myTabs = <Tab>[
    const Tab(text: 'View Data'),
    const Tab(text: 'Add Data'),
    const Tab(text: 'Chart'),
  ];

  @override
  Widget build(BuildContext context) {
    final dbHarProvider = Provider.of<DbHarProvider>(context);
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
            Center(),
            Center(),
          ],
        ),
      ),
    );
  }
}
