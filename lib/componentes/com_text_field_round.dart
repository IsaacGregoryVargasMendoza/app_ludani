import 'package:app_ludani/constantes/constantes.dart';
import 'package:flutter/material.dart';

class ComponenteTextFieldRound extends StatelessWidget {
  final Color textColor = Colors.black;
  // final Color backgroundColor = const Color.fromRGBO(217, 217, 217, 1);
  final double fontSize = 18;
  final double height = 45;
  final bool isPassword;
  bool? isEnabled = true;
  bool? isNumber = false;
  double width;
  final VoidCallback funcion;
  TextEditingController? controlador;

  ComponenteTextFieldRound(
      {Key? key,
      required this.width,
      required this.isPassword,
      required this.funcion,
      this.isNumber,
      this.isEnabled,
      this.controlador})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(0),
      padding: const EdgeInsets.all(0),
      width: width,
      // height: height,
      decoration: BoxDecoration(
        // color: backgroundColor,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Constantes.colorAppBar,
        ),
      ),
      child: Scrollbar(
        controller: ScrollController(),
        child: isPassword == true
            ? TextField(
                // onChanged: funcion,
                scrollController: ScrollController(),
                keyboardType: TextInputType.multiline,
                obscureText: true,
                enabled: isEnabled,
                enableSuggestions: false,
                autocorrect: false,
                style: TextStyle(
                  fontSize: fontSize,
                  height: 1,
                  fontWeight: FontWeight.normal,
                  color: textColor,
                ),
                decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                    border: InputBorder.none),
                controller: (controlador != null)
                    ? controlador
                    : TextEditingController(),
              )
            : (isNumber == true)
                ? TextField(
                    // onChanged: (value) {
                    //   funcion();
                    // },
                    scrollController: ScrollController(),
                    keyboardType: TextInputType.number,
                    enableSuggestions: false,
                    autocorrect: false,
                    enabled: isEnabled,
                    style: TextStyle(
                      fontSize: fontSize,
                      height: 1,
                      fontWeight: FontWeight.normal,
                      // backgroundColor: Colors.blue,
                      color: textColor,
                    ),
                    // textAlignVertical: TextAlignVertical.top,
                    decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                        border: InputBorder.none),
                    controller: (controlador != null)
                        ? controlador
                        : TextEditingController(),
                  )
                : TextField(
                    scrollController: ScrollController(),
                    keyboardType: TextInputType.multiline,
                    enableSuggestions: false,
                    autocorrect: false,
                    enabled: isEnabled,
                    style: TextStyle(
                      fontSize: fontSize,
                      height: 1,
                      fontWeight: FontWeight.normal,
                      // backgroundColor: Colors.blue,
                      color: textColor,
                    ),
                    decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                        border: InputBorder.none),
                    controller: (controlador != null)
                        ? controlador
                        : TextEditingController(),
                  ),
      ),
    );
  }
}
