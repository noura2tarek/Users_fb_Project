import 'package:firebase_project/firebase_service/data_model.dart';
import 'package:flutter/material.dart';
import 'custom_list_tile.dart';

/*-------------- Users list widget ----------------*/

class UsersList extends StatelessWidget {
  const UsersList({
    super.key,
    required this.users,
  });

  final List<User> users;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: users.length,
      itemBuilder: (context, index) {
        User user = users[index];
        return CustomListTile(
          user: user,
        );
      },
      separatorBuilder: (context, index) => SizedBox(
        height: 8.0,
      ),
    );
  }
}
