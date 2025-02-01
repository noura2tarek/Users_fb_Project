import 'package:firebase_project/firebase_service/data_model.dart';
import 'package:firebase_project/firebase_service/firebase_service.dart';
import 'package:firebase_project/utils/app_strings.dart';
import 'package:firebase_project/view/screens/users_page.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_from_field.dart';
import '../widgets/custom_snack_bar.dart';

class InputFormPage extends StatefulWidget {
  const InputFormPage({super.key});

  @override
  State<InputFormPage> createState() => _InputFormPageState();
}

class _InputFormPageState extends State<InputFormPage> {
  late final TextEditingController _nameController;
  late final TextEditingController _ageController;
  late final TextEditingController _hobbyController;
  late final GlobalKey<FormState> _formKey;
  bool _addLoading = false;

  @override
  void initState() {
    _nameController = TextEditingController();
    _ageController = TextEditingController();
    _hobbyController = TextEditingController();
    _formKey = GlobalKey<FormState>();
    super.initState();
  }

  // Add user to firestore method
  // Calling (add user) method from firebase service file
  _addUser() async {
    setState(() {
      _addLoading = true;
    });
    User user = User(
      name: _nameController.text,
      age: _ageController.text,
      hobby: _hobbyController.text,
    );
    await FirebaseService.addUser(
      user: user,
    ).then((value) {
      ScaffoldMessenger.of(context).showSnackBar(
        customSnackBar(text: AppStrings.userAdded),
      );
      // Clear text fields
      _nameController.clear();
      _ageController.clear();
      _hobbyController.clear();
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        customSnackBar(text: "${AppStrings.failedToAdd} $error"),
      );
    });
    setState(() {
      _addLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // title text
                    Text(
                      AppStrings.addNewUser,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                      ),
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    /*------------ Name Text Field ------------*/
                    CustomFromField(
                      controller: _nameController,
                      keyboardType: TextInputType.name,
                      hintText: AppStrings.enterYourName,
                      prefixWidget: Icon(Icons.person_outline),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return AppStrings.pleaseEnterYourName;
                        } else {
                          return null;
                        }
                      },
                    ),
                    /*------------ age Text Field ------------*/
                    CustomFromField(
                      controller: _ageController,
                      keyboardType: TextInputType.number,
                      hintText: AppStrings.enterYourAge,
                      prefixWidget: Icon(Icons.calendar_month_outlined),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return AppStrings.pleaseEnterYourAge;
                        } else {
                          return null;
                        }
                      },
                    ),
                    /*---------- favourite hobby Text Field ----------*/
                    CustomFromField(
                      controller: _hobbyController,
                      keyboardType: TextInputType.name,
                      hintText: AppStrings.enterYourHobby,
                      prefixWidget: Icon(Icons.sports_esports_outlined),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return AppStrings.pleaseEnterYourHobby;
                        } else {
                          return null;
                        }
                      },
                    ),
                    /*---------- Save & view data Buttons ----------*/
                    // Add button //
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 15.0, top: 5.0),
                        child: CustomButton(
                          buttonText: AppStrings.save,
                          isLoading: _addLoading,
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              _addUser();
                            }
                          },
                        ),
                      ),
                    ),
                    //-- View data button --//
                    Center(
                      child: CustomButton(
                        buttonText: AppStrings.viewData,
                        onPressed: () {
                          // Navigate to users screen to view data
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => UsersPage(),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // dispose all the controllers
  @override
  dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _hobbyController.dispose();
    super.dispose();
  }
}
/*---------- End of the input form page widget -------------*/
