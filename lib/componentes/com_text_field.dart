import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';

class ComponenteTextField extends StatelessWidget {
  final Color textColor;
  final Color backgroundColor;
  final Color borderColor;
  final String text;
  double fontSize;
  double width;
  double height;
  final VoidCallback funcion;
  TextEditingController? controller;
  bool isNumber;

  ComponenteTextField(
      {Key? key,
      required this.textColor,
      required this.backgroundColor,
      required this.borderColor,
      required this.text,
      required this.fontSize,
      required this.width,
      required this.height,
      required this.funcion,
      required this.isNumber,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(0),
      padding: const EdgeInsets.all(5),
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        // borderRadius: BorderRadius.circular(20),

        border: Border.all(
          color: borderColor,
          style: BorderStyle.solid,
          width: 1.0,
        ),
      ),
      child: TextField(
        keyboardType: (isNumber)?TextInputType.number:TextInputType.multiline,
        onChanged: (value) {
                    print(value);
                  },
        style: TextStyle(
          fontSize: fontSize,
          height: 1,
          // fontWeight: FontWeight.bold,
          color: textColor,
        ),
        // decoration: InputDecoration(hintText: text, contentPadding: EdgeInsets.symmetric(horizontal: 20)), 
        decoration: InputDecoration(hintText: text,),
        controller: controller,
      ),
      // child: TextButton(
      //   onPressed: funcion,
      //   child: Center(
      //     child: Text(
      //       text,
      //       style: TextStyle(
      //           color: textColor,
      //           fontSize: fontSize,
      //           fontWeight: FontWeight.bold),
      //     ),
      //   ),
      // ),
    );
  }
}
