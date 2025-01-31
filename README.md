# Firebase Project

# Connect App to Firebase

**Project configuration with firebase** --> done using the flutterfire CLI and flutterfire configure
command.

After the project is configured, firebase options file is added to lib folder.
Then, we add firebase core and cloud_firestore packages to the pubspec.yaml file.

And i initialize firebase in main.dart file.

**Write data in Firestore database**                                             
From Input form page, the user can enter his name, age, and favourite hobby.
Then, press save button to save the data in firestore database in collection 'users'.
After the data is saved successfully, a Snack bar is displayed with the message: User Added
Successfully.

**Read data from Firestore database**
By clicking on 'view data' button in input form page, The app will navigate to the users page, we
can view all the users saved in firestore database.

**Future Builder**
To fetch the future data from firestore database, Future Builder is used to show the users list in users
page. this widget rebuilds itself when the data changes.

The firebase service logic in lib/firebase_service folder.
The view in lib/view folder.
Other App components is stored in lib/utils folder.
The task output images in assets/images folder.

---------------------------------------

# Packages used:

firebase_core: to use the Firebase Core
API --> https://pub.dev/packages/firebase_core                                                                                             
cloud_firestore: to use the Cloud Firestore API. ---> https://pub.dev/packages/cloud_firestore
