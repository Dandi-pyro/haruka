import 'package:flutter/material.dart';
import 'package:haruka2022/provider/list_user_provider.dart';
import 'package:haruka2022/screen/super%20admin/preview_user.dart';
import 'package:haruka2022/screen/super%20admin/search_user.dart';
import 'package:provider/provider.dart';

class HomeScreenSuperAdmin extends StatefulWidget {
  const HomeScreenSuperAdmin({super.key});

  @override
  State<HomeScreenSuperAdmin> createState() => _HomeScreenSuperAdminState();
}

class _HomeScreenSuperAdminState extends State<HomeScreenSuperAdmin> {
  @override
  Widget build(BuildContext context) {
    final listUserProvider = Provider.of<ListUserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchUserBySuperAdminScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.search_rounded))
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: listUserProvider.user.data == null
                ? const CircularProgressIndicator()
                : ListView.separated(
                    itemBuilder: (context, index) {
                      var user = listUserProvider.user.data![index];
                      return ListTile(
                        leading: CircleAvatar(
                          child: Text(user.id!.toString()),
                        ),
                        title: Text(user.username!),
                        subtitle: Text(user.name!),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  PreviewUserBySuperAdminScreen(
                                name: user.name!,
                                username: user.username!,
                                email: user.email!,
                                instansi: user.instansi!,
                                level: user.level!.toString(),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    separatorBuilder: (context, index) => const Divider(
                          color: Colors.black,
                        ),
                    itemCount: listUserProvider.user.data!.length),
          ),
        ],
      ),
    );
  }
}
