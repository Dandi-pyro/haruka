import 'package:flutter/material.dart';
import 'package:haruka2022/provider/list_user_provider.dart';
import 'package:haruka2022/screen/super%20admin/preview_user.dart';
import 'package:provider/provider.dart';

class SearchUserBySuperAdminScreen extends StatefulWidget {
  const SearchUserBySuperAdminScreen({super.key});

  @override
  State<SearchUserBySuperAdminScreen> createState() =>
      _SearchUserBySuperAdminScreenState();
}

class _SearchUserBySuperAdminScreenState
    extends State<SearchUserBySuperAdminScreen> {
  final _searchController = TextEditingController();
  List? users;

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  @override
  void initState() {
    super.initState();
    users = Provider.of<ListUserProvider>(context, listen: false).user.data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search User'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search_rounded),
                hintText: 'User',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    color: Colors.black,
                  ),
                ),
              ),
              onChanged: searchUser,
            ),
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  final user = users![index];
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text(user.id.toString()),
                    ),
                    title: Text(user.username),
                    subtitle: Text(user.name),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PreviewUserBySuperAdminScreen(
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
                itemCount: users!.length),
          ),
        ],
      ),
    );
  }

  void searchUser(String query) {
    final suggestions = Provider.of<ListUserProvider>(context, listen: false)
        .user
        .data!
        .where((user) {
      final userName = user.name!.toLowerCase();
      final input = query.toLowerCase();

      return userName.contains(input);
    }).toList();

    setState(() => users = suggestions);
  }
}
