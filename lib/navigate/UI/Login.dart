import 'package:flutter/material.dart';
import 'package:portalkiwi/model/User.dart';

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
                User user = User("Andrei", "testando_key", "token");
                _call(user);
              },
              child: Text("Entrar no APP"),
            )
          ],
        ),
      )
    );
  }
}
