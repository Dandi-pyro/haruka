import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:haruka2022/provider/edit_user_provider.dart';
import 'package:haruka2022/screen/splash_screen.dart';
import 'package:provider/provider.dart';

const List<String> list = <String>['1', '2', '3'];

class EditUserBySuperAdminScreen extends StatefulWidget {
  final String name;
  final String username;
  final String email;
  final String instansi;
  final String level;
  const EditUserBySuperAdminScreen(
      {super.key,
      required this.name,
      required this.username,
      required this.email,
      required this.instansi,
      required this.level});

  @override
  State<EditUserBySuperAdminScreen> createState() =>
      _EditUserBySuperAdminScreenState();
}

class _EditUserBySuperAdminScreenState
    extends State<EditUserBySuperAdminScreen> {
  @override
  void initState() {
    super.initState();
    dropdownValue = widget.level;
  }

  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final editUserProvider = Provider.of<EditUserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Level User'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: size.height * 0.3),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Level : ',
                style: TextStyle(fontSize: 20),
              ),
              DropdownButton<String>(
                value: dropdownValue,
                elevation: 16,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
                underline: Container(
                  height: 2,
                  color: Colors.black,
                ),
                onChanged: (String? value) {
                  setState(() {
                    dropdownValue = value!;
                  });
                },
                items: list.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ],
          ),
          SizedBox(height: size.height * 0.05),
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
                  bool isAvailable = await editUserProvider.putEditUser(
                      widget.name,
                      widget.username,
                      widget.email,
                      ' ',
                      dropdownValue!);
                  if (isAvailable) {
                    if (mounted) {
                      Navigator.pushAndRemoveUntil(
                          (context),
                          MaterialPageRoute(
                              builder: (context) => const SplashScreen()),
                          (route) => false);
                    }
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                  ),
                  child: Text(
                    "Update",
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
    );
  }
}
