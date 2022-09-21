import 'package:flutter/material.dart';
import 'package:haruka2022/screen/super%20admin/edit_user_by_super_admin.dart';

class PreviewUserBySuperAdminScreen extends StatelessWidget {
  final String name;
  final String username;
  final String email;
  final String instansi;
  final String level;
  const PreviewUserBySuperAdminScreen(
      {super.key,
      required this.name,
      required this.username,
      required this.email,
      required this.instansi,
      required this.level});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile User'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size.height * 0.28),
            Row(
              children: [
                const Text(
                  'Nama : ',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.02),
            Row(
              children: [
                const Text(
                  'Username : ',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(
                  username,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.02),
            Row(
              children: [
                const Text(
                  'Email : ',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(
                  email,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.02),
            Row(
              children: [
                const Text(
                  'Level : ',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(
                  level,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditUserBySuperAdminScreen(
                          name: name,
                          username: username,
                          email: email,
                          instansi: instansi,
                          level: level,
                        ),
                      ),
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(
                      top: 10,
                      bottom: 10,
                    ),
                    child: Text(
                      "Edit Level User",
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
