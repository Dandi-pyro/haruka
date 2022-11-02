import 'package:flutter/material.dart';
import 'package:haruka2022/model/apg_model.dart';
import 'package:haruka2022/provider/apg4_filter_provider.dart';
import 'package:haruka2022/provider/apg4_provider.dart';
import 'package:haruka2022/provider/apg4_sorting_provider.dart';
import 'package:haruka2022/screen/apg/create_apg4.dart';
import 'package:haruka2022/screen/apg/preview_apg.dart';
import 'package:haruka2022/screen/apg/preview_apg_user.dart';
import 'package:haruka2022/screen/apg/search_apg4.dart';
import 'package:haruka2022/screen/apg/search_apg4_user.dart';
import 'package:provider/provider.dart';

const List<String> listWP = <String>[
  'WP1',
  'WP1/WP2',
  'WP1/WP3',
  'WP1/WP4',
  'WP2',
  'WP2/WP3',
  'WP2/WP5',
  'WP3',
  'WP3/WP4',
  'WP4',
  'WP4/WP1',
  'WP4/WP2',
  'WP5'
];

const List<String> listSort = <String>['Ascending', 'Descending'];

class Apg4UserScreen extends StatefulWidget {
  const Apg4UserScreen({super.key});

  @override
  State<Apg4UserScreen> createState() => _Apg4UserScreenState();
}

class _Apg4UserScreenState extends State<Apg4UserScreen> {
  String dropdownValueWP = 'WP1';
  String dropdownValueSort = 'Ascending';
  String sorting = 'asc';

  ApgModel? listApg;

  @override
  void initState() {
    super.initState();
    listApg = Provider.of<Apg4Provider>(context, listen: false).apg;
  }

  @override
  Widget build(BuildContext context) {
    final apgSortingProvider = Provider.of<Apg4SortingProvider>(context);
    final apgFilterProvider = Provider.of<Apg4FilterProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return StatefulBuilder(builder: (context, setState) {
                          return Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                alignment: Alignment.center,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 40),
                                child: DropdownButton<String>(
                                  isExpanded: true,
                                  value: dropdownValueSort,
                                  elevation: 16,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                  underline: Container(
                                    height: 2,
                                    color: Colors.black,
                                  ),
                                  hint: const Text('Sorting'),
                                  onChanged: (String? value) {
                                    setState(() {
                                      dropdownValueSort = value!;
                                      if (dropdownValueSort == 'Ascending') {
                                        sorting = 'asc';
                                      } else {
                                        sorting = 'desc';
                                      }
                                    });
                                  },
                                  items: listSort.map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  apgSortingProvider
                                      .getApg('4', sorting)
                                      .then((value) {
                                    listApg = apgSortingProvider.apg;
                                    Navigator.pop(context);
                                  });
                                },
                                child: const Text('Apply'),
                              ),
                            ],
                          );
                        });
                      },
                    );
                  },
                  child: const Text('Sorting'),
                ),
                const SizedBox(
                  width: 12,
                ),
                ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return StatefulBuilder(builder: (context, setState) {
                          return Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                'Alokasi',
                                style: TextStyle(fontSize: 16),
                              ),
                              Container(
                                alignment: Alignment.center,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 40),
                                child: DropdownButton<String>(
                                  isExpanded: true,
                                  value: dropdownValueWP,
                                  elevation: 16,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                  underline: Container(
                                    height: 2,
                                    color: Colors.black,
                                  ),
                                  hint: const Text('Alokasi'),
                                  onChanged: (String? value) {
                                    setState(() {
                                      dropdownValueWP = value!;
                                    });
                                  },
                                  items: listWP.map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  apgFilterProvider
                                      .getApg('4', dropdownValueWP)
                                      .then((value) {
                                    listApg = apgFilterProvider.apg;
                                    Navigator.pop(context);
                                  });
                                },
                                child: const Text('Apply'),
                              ),
                            ],
                          );
                        });
                      },
                    );
                  },
                  child: const Text('Filter'),
                ),
              ],
            ),
          ),
          Expanded(
            child: listApg!.data == null
                ? const Center()
                : ListView.separated(
                    itemBuilder: (context, index) {
                      final apg = listApg!.data![index];
                      return ListTile(
                        leading: CircleAvatar(
                          child: Text(apg.idApgAi!.toString()),
                        ),
                        title: Text(apg.namaDokumen!),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PreviewApgUserScreen(
                                alokasi: apg.alokasi!,
                                agendaItem: apg.agendaItem!,
                                dokumen: apg.dokumen!,
                                namaDokumen: apg.namaDokumen!,
                                sourceDokumen: apg.sourceDokumen!,
                                summaryDokumen: apg.summaryDokumen!,
                                tanggalDokumen: apg.tanggalDokumen!,
                                picStakeholder: apg.picStakeholder!,
                                picKominfo: apg.picKominfo!,
                                file: apg.file!,
                                id: apg.idApgAi!.toString(),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                    itemCount: listApg!.data!.length,
                  ),
          ),
        ],
      ),
    );
  }
}
