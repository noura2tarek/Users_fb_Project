# Firebase Project

# Connect App to Firebase

**Project configuration with firebase** --> done using the flutterfire CLI and flutterfire configure
command.

After the project is configured, firebase options file is added to lib folder.
Then, we add firebase core and cloud_firestore packages to the pubspec.yaml file.

And i initialize firebase in main.dart file.

#  Firebase Distribution
To apply beta testing to my flutter application and test the pre-release version. i have to follow some steps:

- Get the release version using `flutter build apk` command.
- Upload the app apk release in Firebase App Distribution.
- Send it to some testers using emails. 

-------------------------
## How to Run the App

1. Clone the repository.
2. Run `flutter pub get` to install dependencies.
3. Run `flutter run` to start the app.

----------------

# Structure
The firebase service logic in lib/firebase_service folder.
The view in lib/view folder.
Other App components is stored in lib/utils folder.

---------------------------------------

# Packages used:

firebase_core: to use the Firebase CoreAPI --> https://pub.dev/packages/firebase_core                                                                                             
cloud_firestore: to use the Cloud Firestore API. ---> https://pub.dev/packages/cloud_firestore
