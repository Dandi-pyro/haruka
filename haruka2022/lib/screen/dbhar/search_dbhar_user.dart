import 'package:flutter/material.dart';
import 'package:haruka2022/model/dbhar_model.dart';
import 'package:haruka2022/provider/delete_dbhar_provider.dart';
import 'package:haruka2022/provider/search_dbhar_provider.dart';
import 'package:haruka2022/screen/dbhar/preview_dbhar.dart';
import 'package:haruka2022/screen/dbhar/preview_dbhar_user.dart';
import 'package:haruka2022/screen/splash_screen.dart';
import 'package:provider/provider.dart';

class SearchDbHarUserScreen extends StatefulWidget {
  const SearchDbHarUserScreen({super.key});

  @override
  State<SearchDbHarUserScreen> createState() => _SearchDbHarUserScreenState();
}

class _SearchDbHarUserScreenState extends State<SearchDbHarUserScreen> {
  final _formKey = GlobalKey<FormState>();

  final _searchController = TextEditingController();

  DbHarModel? listDbhar;

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dbHarSearchingProvider = Provider.of<DbHarSearchProvider>(context);
    final deleteDbHarProvider = Provider.of<DeleteDbHarProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search DbHar'),
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
                  hintText: 'DbHar',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return ("Masukkan data DbHar yang ingin dicari");
                  }
                  return null;
                },
                onFieldSubmitted: (value) {
                  dbHarSearchingProvider.getDbHar(value).then(
                      (value) => listDbhar = dbHarSearchingProvider.dbHar);
                  setState(() {});
                },
              ),
            ),
            listDbhar == null
                ? const Center(
                    child: Text('No Data'),
                  )
                : Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          final dbhar = listDbhar!.data![index];
                          return ListTile(
                            leading: CircleAvatar(
                              child: Text(dbhar.no.toString()),
                            ),
                            title: Text(dbhar.document!),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PreviewDbharUserScreen(
                                    minFreq: dbhar.minFrekuensi!,
                                    maxFreq: dbhar.maxFrekuensi!,
                                    bandwidth: dbhar.bandwidth!,
                                    band: dbhar.band!,
                                    jenisBand: dbhar.jenisBand!,
                                    wp: dbhar.wp!,
                                    techWorld: dbhar.techWorld!,
                                    techIndonesia: dbhar.techIndonesia!,
                                    license: dbhar.license!,
                                    assignment: dbhar.assignment!,
                                    document: dbhar.document!,
                                    ide: dbhar.ide!,
                                    isuLain: dbhar.isuLain!,
                                    isuTeknis: dbhar.isuTeknis!,
                                    ket: dbhar.ket!,
                                    ref: dbhar.ref!,
                                    id: dbhar.no!,
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        separatorBuilder: (context, index) => const Divider(
                              color: Colors.black,
                            ),
                        itemCount: listDbhar!.data!.length),
                  ),
          ],
        ),
      ),
    );
  }
}
