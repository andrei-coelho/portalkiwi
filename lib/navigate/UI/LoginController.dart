import 'package:flutter/material.dart';
import 'package:portalkiwi/navigate/UI/login/Forget.dart';
import 'package:portalkiwi/navigate/UI/login/LoginForm.dart';
import 'package:portalkiwi/navigate/UI/login/NewUserForm.dart';
import 'package:portalkiwi/navigate/UI/login/Options.dart';

class LoginController extends StatefulWidget {

  final _LoginControllerState __loginState = _LoginControllerState();

  LoginController(Function call, {Key key}):super(key:key){
    __loginState.setCallBack(call);
  }

  @override
  _LoginControllerState createState() => __loginState;

}

class _LoginControllerState extends State<LoginController> {

  Function _callback;
  Widget _widget;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _changeState("options");

  }

  void _changeState(type){
    switch(type){
      // aqui ele altera o widget conforte o tipo
      case "options":
        setState(() {
          _widget = Options((type){
            _changeState(type);
          });
        });
        break;

      case "forget":
        setState(() {
          _widget = Forget((type){
            _changeState(type);
          });
        });
        break;

      case "newUserForm":
        setState(() {
          _widget = NewUserForm((type){
            _changeState(type);
          }, _callback);
        });
        break;

      case "login":
        setState(() {
          _widget = LoginForm((type){
            _changeState(type);
          }, _callback);
        });
        break;
    }
  }

  void setCallBack(Function call){
      this._callback = call;
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        body:  Padding(padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
          child: Column(
            children: [

              Padding(
                padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: Container(
                  child: Center(child: Image.asset(
                    "assets/portalkiwilogo.png",
                    scale: 1.6,
                  ),),
                ),
              ),
              _widget
            ],
          ),
        ),
      )
    );

  }




}
