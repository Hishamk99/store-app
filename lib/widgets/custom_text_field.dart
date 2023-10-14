import 'package:flutter/material.dart';

class CustemFromTextField extends StatelessWidget {
  const CustemFromTextField({this.hinText , this.onChanged , this.obscureText = false});
  final String? hinText;
  final bool? obscureText;
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText!,
      validator: (value){
        if(value!.isEmpty) return 'Field is required!';
      },
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