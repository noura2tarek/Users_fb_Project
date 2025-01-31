import 'package:flutter/material.dart';

class CustomFromField extends StatelessWidget {
  const CustomFromField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.keyboardType,
    this.validator,
    this.prefixWidget,
  });

  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final Widget? prefixWidget;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        child: SizedBox(
          height: 48.0,
          width: MediaQuery.of(context).size.width * 0.7,
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(fontSize: 14.0),
              prefixIcon: prefixWidget,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
            validator: validator,
          ),
        ),
      ),
    );
  }
}
