import 'package:flutter/material.dart';
import 'package:haruka2022/model/apg_model.dart';
import 'package:haruka2022/provider/apg4_searching_provider.dart';
import 'package:haruka2022/provider/search_dbhar_provider.dart';
import 'package:haruka2022/screen/apg/preview_apg.dart';
import 'package:haruka2022/screen/apg/preview_apg_user.dart';
import 'package:haruka2022/screen/dbhar/preview_dbhar.dart';
import 'package:provider/provider.dart';

class SearchApg4UserScreen extends StatefulWidget {
  const SearchApg4UserScreen({super.key});

  @override
  State<SearchApg4UserScreen> createState() => _SearchApg4UserScreenState();
}

class _SearchApg4UserScreenState extends State<SearchApg4UserScreen> {
  final _formKey = GlobalKey<FormState>();

  final _searchController = TextEditingController();

  ApgModel? listApg;

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final apgSearchingProvider = Provider.of<Apg4SearchingProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search APG'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(16),
              child: TextFormField(
                controller: _searchController,
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search_rounded),
                  hintText: 'APG',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return ("Masukkan data APG yang ingin dicari");
                  }
                  return null;
                },
                onFieldSubmitted: (value) {
                  apgSearchingProvider
                      .getApg('4', value)
                      .then((value) => listApg = apgSearchingProvider.apg);
                  setState(() {});
                },
              ),
            ),
            listApg == null
                ? const Center(
                    child: Text('No Data'),
                  )
                : Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          final apg = listApg!.data![index];
                          return ListTile(
                            leading: CircleAvatar(
                              child: Text(apg.idApgAi.toString()),
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
                        separatorBuilder: (context, index) => const Divider(
                              color: Colors.black,
                            ),
                        itemCount: listApg!.data!.length),
                  ),
          ],
        ),
      ),
    );
  }
}
