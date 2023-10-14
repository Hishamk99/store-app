import 'package:flutter/material.dart';

class CustemTextField extends StatelessWidget {
  const CustemTextField({this.hinText , this.onChanged, this.inputType = TextInputType.text , this.obscureText = false});
  final String? hinText;
  final bool? obscureText;
  final Function(String)? onChanged;
  final TextInputType inputType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText!,
      keyboardType: inputType,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hinText,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(),
          borderRadius: BorderRadius.circular(8),
        ),
        border:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}