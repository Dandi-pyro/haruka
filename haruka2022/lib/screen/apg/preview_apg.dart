import 'package:flutter/material.dart';
import 'package:haruka2022/provider/delete_apg_provider.dart';
import 'package:haruka2022/screen/apg%20respon/create_apg_respon.dart';
import 'package:haruka2022/screen/apg/edit_apg.dart';
import 'package:haruka2022/screen/splash_screen.dart';
import 'package:provider/provider.dart';

class PreviewApgScreen extends StatelessWidget {
  final String alokasi;
  final String agendaItem;
  final String dokumen;
  final String namaDokumen;
  final String sourceDokumen;
  final String summaryDokumen;
  final String tanggalDokumen;
  final String picStakeholder;
  final String picKominfo;
  final String file;
  final String id;
  const PreviewApgScreen({
    super.key,
    required this.alokasi,
    required this.agendaItem,
    required this.dokumen,
    required this.namaDokumen,
    required this.sourceDokumen,
    required this.summaryDokumen,
    required this.tanggalDokumen,
    required this.picStakeholder,
    required this.picKominfo,
    required this.file,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final deleteApgProvider = Provider.of<DeleteApgProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail APG'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditApgScreen(
                    alokasi: alokasi,
                    agendaItem: agendaItem,
                    dokumen: dokumen,
                    namaDokumen: namaDokumen,
                    sourceDokumen: sourceDokumen,
                    summaryDokumen: summaryDokumen,
                    tanggalDokumen: tanggalDokumen,
                    picStakeholder: picStakeholder,
                    picKominfo: picKominfo,
                    file: file,
                    id: id,
                  ),
                ),
              );
            },
            icon: const Icon(Icons.edit),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CreateApgRespon(
                    id: id,
                    alokasi: alokasi,
                    agendaItem: agendaItem,
                    judul: namaDokumen,
                    dokumen: dokumen,
                  ),
                ),
              );
            },
            icon: const Icon(Icons.message),
          ),
          IconButton(
            onPressed: () async {
              showDialog<void>(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Apakah anda yakin?'),
                    content: SingleChildScrollView(
                      child: ListBody(
                        children: const <Widget>[
                          Text(
                              'Setelah dihapus item tidak bisa dipulihkan kembali'),
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('Tidak'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: const Text('Ya'),
                        onPressed: () async {
                          bool isAvailable =
                              await deleteApgProvider.deleteApg(id);
                          if (isAvailable) {
                            Navigator.pushAndRemoveUntil(
                                (context),
                                MaterialPageRoute(
                                    builder: (context) => const SplashScreen()),
                                (route) => false);
                          }
                        },
                      ),
                    ],
                  );
                },
              );
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.02,
              ),
              _rowData(context, 'Alokasi : ', alokasi),
              SizedBox(
                height: size.height * 0.02,
              ),
              _rowData(context, 'Agenda Item : ', agendaItem),
              SizedBox(
                height: size.height * 0.02,
              ),
              _rowData(context, 'dokumen : ', dokumen),
              SizedBox(
                height: size.height * 0.02,
              ),
              _rowData(context, 'nama dokumen : ', namaDokumen),
              SizedBox(
                height: size.height * 0.02,
              ),
              _rowData(context, 'source dokumen : ', sourceDokumen),
              SizedBox(
                height: size.height * 0.02,
              ),
              _rowData(context, 'summary dokumen : ', summaryDokumen),
              SizedBox(
                height: size.height * 0.02,
              ),
              _rowData(context, 'tanggal dokumen : ', tanggalDokumen),
              SizedBox(
                height: size.height * 0.02,
              ),
              _rowData(context, 'pic stakeholder : ', picStakeholder),
              SizedBox(
                height: size.height * 0.02,
              ),
              _rowData(context, 'pic kominfo : ', picKominfo),
              SizedBox(
                height: size.height * 0.02,
              ),
              _rowData(context, 'file : ', file),
              SizedBox(
                height: size.height * 0.02,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _rowData(BuildContext context, String judul, String data) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          judul,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 1.8,
          child: Text(
            data,
            style: const TextStyle(
              fontSize: 16,
            ),
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }
}
