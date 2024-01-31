
import 'package:flutter/material.dart';

class customTextForm extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isVisible;
  final String? Function(String?)? validator;
  
 
 customTextForm({
  required this.hintText,
  required this.controller,
  required this.isVisible,
  this.validator
 });
  
  @override
  Widget build(BuildContext context) {
       return TextFormField(
        validator: validator,
      obscureText: isVisible,
      controller: controller,
      key: key,
      decoration: InputDecoration(
        hintStyle: TextStyle(
          color: Colors.white,
        ),
        filled: true,
        fillColor: Colors.blue.shade300,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
        )
      ),
    );
  }
}