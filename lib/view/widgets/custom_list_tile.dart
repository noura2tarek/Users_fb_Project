import 'package:firebase_project/firebase_service/data_model.dart';
import 'package:firebase_project/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      //focusColor: Colors.purpleAccent,
      tileColor: Colors.grey.shade200,
      splashColor: Colors.grey.shade300,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      leading: CircleAvatar(
        radius: 24.0,
        backgroundColor: AppColors.grey300,
        child: const Icon(Icons.person),
      ),
      title: Text(user.name ?? ""),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '${user.age} years old',
            style: TextStyle(fontSize: 12.0),
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            user.hobby ?? "",
            style: TextStyle(fontSize: 12.0),
          ),
        ],
      ),
    );
  }
}
