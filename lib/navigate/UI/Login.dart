import 'package:flutter/material.dart';

class Login extends StatefulWidget {

  final _LoginState __loginState = _LoginState();

  Login(Function call, {Key key}):super(key:key){
    __loginState.setCallBack(call);
  }

  @override
  _LoginState createState() => __loginState;
}

class _LoginState extends State<Login> {

  Function _call;

  void setCallBack(Function call){
      this._call = call;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Text("Ola mundo"),
            RaisedButton(
              onPressed: (){
                print("clicou!");
                _call();
              },
              child: Text("Entrar no APP"),
            )
          ],
        ),
      )
    );
  }
}
