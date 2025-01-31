import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_project/firebase_service/data_model.dart';

class FirebaseService {
  // database instance
  static FirebaseFirestore db = FirebaseFirestore.instance;

  // create a collection called users
  static CollectionReference users = db.collection('users');

  // Add user document to the collection users in database
  static Future<void> addUser({
    required User user,
  }) {
    // Call the user's CollectionReference to add a new user
    return users.add(user.toFirestore());
  }
}
