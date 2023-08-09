import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({required this.hinttext,required this.onchange,this.obscure=false,this.inputType,this.valid=false});

  String hinttext;
  Function(String) onchange;
  bool obscure;
  TextInputType? inputType;
  bool valid;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: valid==true?(data){
        return 'field required';
      }:(value)=>null,
      keyboardType: inputType,
      obscureText: obscure,
      onChanged: onchange,
      decoration: InputDecoration(
        hintText: hinttext,
        hintStyle: TextStyle(color: Colors.blue),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue,),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}