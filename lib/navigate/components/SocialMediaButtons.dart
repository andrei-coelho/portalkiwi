

import 'package:flutter/material.dart';

class SocialMediaButtons {

  static List<Widget> get(){
    return [
      // BOTÕES VIA REDES SOCIAIS
      // Google
      Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Container(
          width: 240,
          child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))
              ),
              onPressed: (){

              },
              textColor: Colors.white,
              color:  Color.fromRGBO(66, 134, 245, 1),
              padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: Padding(
                  padding: EdgeInsets.fromLTRB(0,0,0,0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(4, 0, 10, 0),
                        child: Image.asset("assets/ic-google.jpg"),
                      ),
                      Container(
                        color:  Color.fromRGBO(66, 134, 245, 1),
                        padding: EdgeInsets.fromLTRB(10, 4, 4, 4),
                        child: Text('Entre via Google',
                          style: TextStyle(color: Colors.white),),
                      ),
                    ],
                  ))
          ),
        ),),

      // Facebook
      Padding(padding: EdgeInsets.all(5),
        child: Container(
          width: 240,
          child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              onPressed: (){ print('Button Clicked.'); },
              textColor: Colors.white,
              color:  Color.fromRGBO(59, 89, 153, 1),
              padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: Padding(
                  padding: EdgeInsets.fromLTRB(0,0,0,0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(4, 0, 10, 0),
                        child: Image.asset("assets/ic-facebook.jpg"),
                      ),
                      Container(
                        color:  Color.fromRGBO(59, 89, 153, 1),
                        padding: EdgeInsets.fromLTRB(10, 4, 4, 4),
                        child: Text('Entre via Facebook',
                          style: TextStyle(color: Colors.white),),
                      ),
                    ],
                  ))
          ),
        ),),
      // Twitter
      Padding(padding: EdgeInsets.all(5),
        child: Container(
          width: 240,
          child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              onPressed: (){ print('Button Clicked.'); },
              textColor: Colors.white,
              color:  Color.fromRGBO(0, 172, 237, 1),
              padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: Padding(
                  padding: EdgeInsets.fromLTRB(0,0,0,0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(4, 0, 10, 0),
                        child: Image.asset("assets/ic-twitter.jpg"),
                      ),
                      Container(
                        color:  Color.fromRGBO(0, 172, 237, 1),
                        padding: EdgeInsets.fromLTRB(10, 4, 4, 4),
                        child: Text('Entre via Twitter',
                          style: TextStyle(color: Colors.white),),
                      ),
                    ],
                  ))
          ),
        ),),
    ];
  }

}