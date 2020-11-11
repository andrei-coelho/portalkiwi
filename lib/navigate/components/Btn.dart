import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Btn extends StatelessWidget {

  String _text;
  Function _callback;
  bool outline = false;

  Btn(this._text, this._callback, {bool border:false}){
    outline = border;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(5),
      child: Container(
        width: 240,
        child: RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                side: outline ? BorderSide(color: Color.fromRGBO(11, 66, 37, 1)) : BorderSide(color: Color.fromRGBO(255, 255, 255, 0)),
            ),
            onPressed: (){
              _callback();
            },
            textColor: outline ? Color.fromRGBO(11, 66, 37, 1)  : Colors.white,
            color:
              outline ?
              Color.fromRGBO(255, 255, 255, 1):
              Color.fromRGBO(11, 66, 37, 1),
            padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: Padding(
                padding: EdgeInsets.fromLTRB(0,0,0,0),
                child: Center(
                  child: Text(_text),
                )
            )
        ),
      ),);

  }

}

// ignore: must_be_immutable
class BtnLink extends StatelessWidget {

  String _text;
  Function _callback;

  BtnLink(this._text, this._callback);

  @override
  Widget build(BuildContext context) {

    return Padding(padding: EdgeInsets.all(5),
      child: Container(
        width: 240,
        child: FlatButton(
            onPressed: (){
              _callback();
            },
            textColor: Color.fromRGBO(11, 66, 37, 1),
            color: Color.fromRGBO(255, 255, 255, 0),
            padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: Padding(
                padding: EdgeInsets.fromLTRB(0,0,0,0),
                child: Center(
                  child: Text(_text),
                )
            )
        ),
      ),);
      
  }

}

// ignore: must_be_immutable
class BtnBackLogin extends StatelessWidget {

  Function _callback;

  BtnBackLogin(this._callback);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(5),

      child: FlatButton(
          onPressed: (){
            _callback();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.keyboard_backspace),
                color: Colors.blue,
              ),
              Text("Voltar")
            ],
          )
      ),
    );
  }

}