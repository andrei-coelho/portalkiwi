import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Input extends StatelessWidget {

  String _nameText;
  Icon icon;

  Input(this._nameText, {this.icon});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primaryColor: Color.fromRGBO(28, 174, 129, 1),
        primaryColorDark: Colors.grey[800]
      ),
      child: TextField(
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