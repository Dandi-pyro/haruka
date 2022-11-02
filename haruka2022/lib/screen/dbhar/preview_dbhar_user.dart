import 'package:flutter/material.dart';
import 'package:haruka2022/screen/dbhar/edit_dbhar.dart';

class PreviewDbharUserScreen extends StatelessWidget {
  final String minFreq;
  final String maxFreq;
  final String bandwidth;
  final String band;
  final String jenisBand;
  final String wp;
  final String techWorld;
  final String techIndonesia;
  final String license;
  final String assignment;
  final String document;
  final String isuTeknis;
  final String isuLain;
  final String ref;
  final String ket;
  final String ide;
  final String id;
  const PreviewDbharUserScreen({
    super.key,
    required this.minFreq,
    required this.maxFreq,
    required this.bandwidth,
    required this.band,
    required this.jenisBand,
    required this.wp,
    required this.techWorld,
    required this.techIndonesia,
    required this.license,
    required this.assignment,
    required this.document,
    required this.isuTeknis,
    required this.isuLain,
    required this.ref,
    required this.ket,
    required this.ide,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preview'),
        centerTitle: true,
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
              _rowData(context, 'Minimum Frequency', minFreq),
              SizedBox(
                height: size.height * 0.02,
              ),
              _rowData(context, 'Maximum Frequency', maxFreq),
              SizedBox(
                height: size.height * 0.02,
              ),
              _rowData(context, 'Bandwidth', bandwidth),
              SizedBox(
                height: size.height * 0.02,
              ),
              _rowData(context, 'Band', band),
              SizedBox(
                height: size.height * 0.02,
              ),
              _rowData(context, 'Jenis Band', jenisBand),
              SizedBox(
                height: size.height * 0.02,
              ),
              _rowData(context, 'WP', wp),
              SizedBox(
                height: size.height * 0.02,
              ),
              _rowData(context, 'Tech World', techWorld),
              SizedBox(
                height: size.height * 0.02,
              ),
              _rowData(context, 'Tech Indonesia', techIndonesia),
              SizedBox(
                height: size.height * 0.02,
              ),
              _rowData(context, 'License', license),
              SizedBox(
                height: size.height * 0.02,
              ),
              _rowData(context, 'Assignment', assignment),
              SizedBox(
                height: size.height * 0.02,
              ),
              _rowData(context, 'Document', document),
              SizedBox(
                height: size.height * 0.02,
              ),
              _rowData(context, 'Technical Issue', isuTeknis),
              SizedBox(
                height: size.height * 0.02,
              ),
              _rowData(context, 'Other Issue', isuLain),
              SizedBox(
                height: size.height * 0.02,
              ),
              _rowData(context, 'Reference', ref),
              SizedBox(
                height: size.height * 0.02,
              ),
              _rowData(context, 'Remark', ket),
              SizedBox(
                height: size.height * 0.02,
              ),
              _rowData(context, 'Idea', ide),
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
          '$judul : ',
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 1.9,
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
