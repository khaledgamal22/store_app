import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({required this.text,required this.onpressed});

  String text;
  VoidCallback onpressed;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Center(child: Text(text,style: TextStyle(color: Colors.white),)),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(8),
        ),
        height: 50,
        width: 100,
      ),
      onTap: onpressed,
      );
 }


}