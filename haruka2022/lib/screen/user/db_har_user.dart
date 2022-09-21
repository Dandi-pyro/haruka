import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

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
          children: myTabs.map((Tab tab) {
            final String label = tab.text!.toLowerCase();
            return Center(
              child: Text(
                'This is the $label tab',
                style: const TextStyle(fontSize: 36),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
