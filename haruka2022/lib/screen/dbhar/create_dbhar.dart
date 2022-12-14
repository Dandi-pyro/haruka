import 'package:flutter/material.dart';
import 'package:haruka2022/provider/create_dbhar_provider.dart';
import 'package:haruka2022/screen/splash_screen.dart';
import 'package:haruka2022/utils/constant/preferences_key.dart';
import 'package:haruka2022/utils/decode/jwt_decode.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

const List<String> listJenisBand = <String>[
  'C',
  'HF',
  'K',
  'Ka',
  'Ku',
  'L',
  'LF',
  'MF',
  'S',
  'UHF',
  'V',
  'VHF',
  'VLF',
  'W',
  'X'
];
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

class CreateDbHarScreen extends StatefulWidget {
  const CreateDbHarScreen({super.key});

  @override
  State<CreateDbHarScreen> createState() => _CreateDbHarScreenState();
}

class _CreateDbHarScreenState extends State<CreateDbHarScreen> {
  final _formKey = GlobalKey<FormState>();

  final _minFrekuensiController = TextEditingController();
  final _maxFrekuensiController = TextEditingController();
  final _bandwidthController = TextEditingController();
  final _bandController = TextEditingController();
  final _techWorldController = TextEditingController();
  final _techIndonesiaController = TextEditingController();
  final _licenseController = TextEditingController();
  final _assigntmentController = TextEditingController();
  final _documentController = TextEditingController();
  final _isuTeknisController = TextEditingController();
  final _isuLainController = TextEditingController();
  final _refController = TextEditingController();
  final _ketController = TextEditingController();
  final _ideController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _minFrekuensiController.dispose();
    _maxFrekuensiController.dispose();
    _bandwidthController.dispose();
    _bandController.dispose();
    _techWorldController.dispose();
    _techIndonesiaController.dispose();
    _licenseController.dispose();
    _assigntmentController.dispose();
    _documentController.dispose();
    _isuTeknisController.dispose();
    _isuLainController.dispose();
    _refController.dispose();
    _ketController.dispose();
    _ideController.dispose();
  }

  String? user;

  Future getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final JwtDecode jwtDecode = JwtDecode();
    final String data = prefs.get(PreferencesKeys.token).toString();
    final datas = jwtDecode.parseJwt(data);
    user = datas.values.elementAt(1).toString();
  }

  String? dropdownValueJenisBand;
  String? dropdownValueWP;

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
    final createDbHarProvider = Provider.of<CreateDbHarProvider>(context);
    return Form(
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
              child: TextFormField(
                controller: _minFrekuensiController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Minimum Frequency (kHz)',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return ("Masukkan minimum frequency");
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: TextFormField(
                controller: _maxFrekuensiController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Maximum Frequency (kHz)',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return ("Masukkan maximum frequency");
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: TextFormField(
                controller: _bandwidthController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Bandwidth',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return ("Masukkan bandwidth");
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: TextFormField(
                controller: _bandController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  hintText: 'Band',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return ("Masukkan band");
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: DropdownButton<String>(
                isExpanded: true,
                value: dropdownValueJenisBand,
                elevation: 16,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
                underline: Container(
                  height: 2,
                  color: Colors.black,
                ),
                hint: const Text('Jenis Band'),
                onChanged: (String? value) {
                  setState(() {
                    dropdownValueJenisBand = value!;
                  });
                },
                items:
                    listJenisBand.map<DropdownMenuItem<String>>((String value) {
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
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 40),
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
                hint: const Text('Work Package'),
                onChanged: (String? value) {
                  setState(() {
                    dropdownValueWP = value!;
                  });
                },
                items: listWP.map<DropdownMenuItem<String>>((String value) {
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
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: TextFormField(
                controller: _techWorldController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  hintText: 'Tech World',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return ("Masukkan tech world");
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: TextFormField(
                controller: _techIndonesiaController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  hintText: 'Texh Indonesia',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return ("Masukkan tech indonesia");
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: TextFormField(
                controller: _licenseController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  hintText: 'License',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return ("Masukkan license");
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: TextFormField(
                controller: _assigntmentController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  hintText: 'Assignment',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return ("Masukkan assignment");
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: TextFormField(
                controller: _documentController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  hintText: 'Document',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return ("Masukkan document");
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: TextFormField(
                controller: _isuTeknisController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  hintText: 'Technical Issue',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return ("Masukkan isu teknis");
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: TextFormField(
                controller: _isuLainController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  hintText: 'Other Issue',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return ("Masukkan isu lain");
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: TextFormField(
                controller: _refController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  hintText: 'Reference',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return ("Masukkan referensi");
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: TextFormField(
                controller: _ketController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  hintText: 'Remark',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return ("Masukkan keterangan");
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: TextFormField(
                controller: _ideController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  hintText: 'Idea',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return ("Masukkan ide");
                  }
                  return null;
                },
              ),
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
                    shadowColor: MaterialStateProperty.all(Colors.transparent),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      bool isAvailable = await createDbHarProvider.postDbHar(
                        _minFrekuensiController.text,
                        _maxFrekuensiController.text,
                        _bandwidthController.text,
                        _bandController.text,
                        dropdownValueJenisBand!,
                        dropdownValueWP!,
                        _techWorldController.text,
                        _techIndonesiaController.text,
                        _licenseController.text,
                        _assigntmentController.text,
                        _documentController.text,
                        _isuTeknisController.text,
                        _isuLainController.text,
                        _refController.text,
                        _ketController.text,
                        _ideController.text,
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
                      "Add",
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
    );
  }
}
