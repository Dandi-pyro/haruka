import 'package:flutter/material.dart';
import 'package:haruka2022/provider/create_apg_provider.dart';
import 'package:haruka2022/screen/splash_screen.dart';
import 'package:haruka2022/utils/constant/preferences_key.dart';
import 'package:haruka2022/utils/decode/jwt_decode.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

const List<String> listAlokasi = <String>[
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

class CreateApg4Screen extends StatefulWidget {
  const CreateApg4Screen({super.key});

  @override
  State<CreateApg4Screen> createState() => _CreateApg4ScreenState();
}

class _CreateApg4ScreenState extends State<CreateApg4Screen> {
  final _formKey = GlobalKey<FormState>();

  final _agendaItemController = TextEditingController();
  final _dokumenController = TextEditingController();
  final _namaDokumenController = TextEditingController();
  final _sourceDokumenController = TextEditingController();
  final _summaryDokumenController = TextEditingController();
  final _tanggalDokumenController = TextEditingController();
  final _picStakeholderController = TextEditingController();
  final _picKominfoController = TextEditingController();
  final _fileController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _agendaItemController.dispose();
    _dokumenController.dispose();
    _namaDokumenController.dispose();
    _sourceDokumenController.dispose();
    _summaryDokumenController.dispose();
    _tanggalDokumenController.dispose();
    _picStakeholderController.dispose();
    _picKominfoController.dispose();
    _fileController.dispose();
  }

  String? user;

  Future getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final JwtDecode jwtDecode = JwtDecode();
    final String data = prefs.get(PreferencesKeys.token).toString();
    final datas = jwtDecode.parseJwt(data);
    user = datas.values.elementAt(2).toString();
  }

  String? dropdownAlokasi;

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
    final createApgProvider = Provider.of<CreateApgProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create APG'),
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
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 40),
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: dropdownAlokasi,
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
                      dropdownAlokasi = value!;
                    });
                  },
                  items:
                      listAlokasi.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              _textFormField(
                _agendaItemController,
                TextInputType.number,
                'Agenda Item',
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Row(
                  children: [
                    const Text(
                      'APG23-4/',
                      style: TextStyle(fontSize: 16),
                    ),
                    Flexible(
                      child: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(right: 40),
                        child: TextFormField(
                          controller: _dokumenController,
                          decoration: const InputDecoration(
                            hintText: 'Dokumen',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return ("Masukkan Dokumen");
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              _textFormField(
                _namaDokumenController,
                TextInputType.multiline,
                'Nama Dokumen',
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              _textFormField(
                _sourceDokumenController,
                TextInputType.multiline,
                'Source Dokumen',
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              _textFormField(
                _summaryDokumenController,
                TextInputType.multiline,
                'Summary Dokumen',
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  controller: _tanggalDokumenController,
                  decoration: const InputDecoration(
                    hintText: 'Tanggal Dokumen',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ("Masukkan Tanggal Dokumen");
                    }
                    return null;
                  },
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1950),
                        lastDate: DateTime(2100));

                    if (pickedDate != null) {
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                      setState(() {
                        _tanggalDokumenController.text = formattedDate;
                      });
                    } else {}
                  },
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              _textFormField(
                _picStakeholderController,
                TextInputType.multiline,
                'Pic Stakeholder',
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              _textFormField(
                _picKominfoController,
                TextInputType.multiline,
                'Pic Kominfo',
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              _textFormField(
                _fileController,
                TextInputType.multiline,
                'File',
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
                        bool isAvailable = await createApgProvider.postApg(
                          dropdownAlokasi!,
                          _agendaItemController.text,
                          "APG23-4/${_dokumenController.text}",
                          _namaDokumenController.text,
                          _sourceDokumenController.text,
                          _summaryDokumenController.text,
                          _tanggalDokumenController.text,
                          _picStakeholderController.text,
                          _picKominfoController.text,
                          _fileController.text,
                          user!,
                        );
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
              SizedBox(
                height: size.height * 0.05,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textFormField(
      TextEditingController controller, TextInputType type, String title) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 40),
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        decoration: InputDecoration(
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
