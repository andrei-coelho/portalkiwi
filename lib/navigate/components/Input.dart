import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Input extends StatefulWidget {

  _InputState __inputState;

  Input(String nameText, {Icon icon, textInputType, TextEditingController  textEditingController}){
    __inputState = _InputState(
        nameText,
        icon: icon,
        textInputType:
        textInputType,
        textEditingController: textEditingController);
  }

  @override
  _InputState createState() => __inputState;

}

class _InputState extends State<Input> {

  String _nameText;
  Icon icon;
  var textInputType;
  TextEditingController textEditingController;

  _InputState(this._nameText, {this.icon, this.textInputType, this.textEditingController});

  @override
  Widget build(BuildContext context) {

    return Theme(

      data: ThemeData(
          primaryColor: Color.fromRGBO(28, 174, 129, 1),
          primaryColorDark: Colors.grey[800]
      ),

      child: TextField(
        controller: textEditingController,
        keyboardType: textInputType != null ? textInputType : TextInputType.text,
        obscureText: textInputType != null && textInputType == TextInputType.visiblePassword,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 5.0),
            prefixIcon: icon,
            border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(40.0),
              ),
            ),
            filled: true,
            hintStyle: TextStyle(color: Colors.grey[800]),
            hintText: _nameText,
            fillColor: Colors.white70),
      ),

    );

  }

}
