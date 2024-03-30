import 'package:flutter/material.dart';

class ComponenteText extends StatelessWidget {
  final String text;
  Color fontColor;
  double width;

  ComponenteText({
    Key? key,
    required this.text,
    required this.fontColor,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(0),
      padding: const EdgeInsets.all(0),
      width: width,
      height: 20,
      child: Text(
        text,
        style: TextStyle(fontSize: 14, color: fontColor),
      ),
    );
  }
}