import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_project/firebase_service/data_model.dart';
import 'package:firebase_project/firebase_service/firebase_service.dart';
import 'package:firebase_project/utils/app_strings.dart';
import 'package:firebase_project/view/widgets/users_list.dart';
import 'package:flutter/material.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  final Future<QuerySnapshot> _usersFuture = FirebaseService.users.get();
  List<User> users = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.users),
      ),
      // Show all users using future builder.
      body: FutureBuilder<QuerySnapshot>(
        // fetch all documents from users collection
        future: _usersFuture,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text(AppStrings.error);
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (users.isNotEmpty) {
            users.clear();
          }
          for (var docSnapshot in snapshot.data!.docs) {
            // convert document map data to user object
            users.add(
                User.fromFirestore(docSnapshot.data() as Map<String, dynamic>));
          }
          // Show users list view
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: UsersList(users: users),
          );
        },
      ),
    );
  }
}
