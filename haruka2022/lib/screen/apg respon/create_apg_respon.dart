import 'package:flutter/material.dart';
import 'package:haruka2022/provider/create_apg_respon_provider.dart';
import 'package:haruka2022/screen/splash_screen.dart';
import 'package:haruka2022/utils/constant/preferences_key.dart';
import 'package:haruka2022/utils/decode/jwt_decode.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateApgRespon extends StatefulWidget {
  final String id;
  final String alokasi;
  final String agendaItem;
  final String judul;
  final String dokumen;
  const CreateApgRespon({
    super.key,
    required this.id,
    required this.alokasi,
    required this.agendaItem,
    required this.judul,
    required this.dokumen,
  });

  @override
  State<CreateApgRespon> createState() => _CreateApgResponState();
}

class _CreateApgResponState extends State<CreateApgRespon> {
  final _formKey = GlobalKey<FormState>();

  final _negaraController = TextEditingController();
  final _responController = TextEditingController();
  final _noteController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _negaraController.dispose();
    _responController.dispose();
    _noteController.dispose();
  }

  String? user;

  Future getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final JwtDecode jwtDecode = JwtDecode();
    final String data = prefs.get(PreferencesKeys.token).toString();
    final datas = jwtDecode.parseJwt(data);
    user = datas.values.elementAt(2).toString();
  }

  @override
  void initState() {
    super.initState();
    getUser().then((value) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final createApgResponProvider =
        Provider.of<CreateApgResponProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Apg Respon'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: _rowData(context, 'Alokasi : ', widget.alokasi),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: _rowData(context, 'Agenda Item : ', widget.agendaItem),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: _rowData(context, 'Judul : ', widget.judul),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: _rowData(context, 'Dokumen : ', widget.dokumen),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              _textFormField(
                _negaraController,
                TextInputType.multiline,
                'Negara',
                1,
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              _textFormField(
                _responController,
                TextInputType.multiline,
                'Respon',
                5,
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              _textFormField(
                _noteController,
                TextInputType.multiline,
                'Note',
                5,
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Center(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 4),
                          blurRadius: 5.0)
                    ],
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromARGB(255, 255, 136, 34),
                        Color.fromARGB(255, 255, 177, 41)
                      ],
                    ),
                    // color: Colors.deepPurple.shade300,
                    borderRadius: BorderRadius.circular(80),
                  ),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(80.0),
                        ),
                      ),
                      minimumSize:
                          MaterialStateProperty.all(Size(size.width * 0.5, 50)),
                      shadowColor:
                          MaterialStateProperty.all(Colors.transparent),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        bool isAvailable =
                            await createApgResponProvider.postApgRespon(
                                widget.id,
                                widget.alokasi,
                                widget.agendaItem,
                                widget.judul,
                                widget.dokumen,
                                _negaraController.text,
                                _responController.text,
                                _noteController.text,
                                user!);
                        if (isAvailable) {
                          if (mounted) {
                            Navigator.pushAndRemoveUntil(
                                (context),
                                MaterialPageRoute(
                                    builder: (context) => const SplashScreen()),
                                (route) => false);
                          }
                        }
                      }
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                        bottom: 10,
                      ),
                      child: Text(
                        "Create",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
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
          width: MediaQuery.of(context).size.width / 1.45,
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

  Widget _textFormField(
    TextEditingController controller,
    TextInputType type,
    String title,
    int lines,
  ) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: TextFormField(
        controller: controller,
        maxLines: lines,
        keyboardType: type,
        decoration: InputDecoration(
          border: title == 'Negara' ? null : const OutlineInputBorder(),
          hintText: title,
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return ("Masukkan $title");
          }
          return null;
        },
      ),
    );
  }
}
