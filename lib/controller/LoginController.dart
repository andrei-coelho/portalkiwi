import 'package:flutter/material.dart';
import 'package:portalkiwi/model/User.dart';
import 'package:portalkiwi/navigate/UI/login/Forget.dart';
import 'package:portalkiwi/navigate/UI/login/LoginForm.dart';
import 'package:portalkiwi/navigate/UI/login/NewUserForm.dart';
import 'package:portalkiwi/navigate/UI/login/Options.dart';
import 'package:portalkiwi/providers/LoginProvider.dart';

// ignore: must_be_immutable
class LoginController extends StatefulWidget {

  _LoginControllerState __loginState;

  LoginController(VoidCallback call, {Key key}):super(key:key) {
    __loginState = _LoginControllerState(call);
  }

  @override
  _LoginControllerState createState() => __loginState;

}

class _LoginControllerState extends State<LoginController> {

  VoidCallback _callbackuser;
  Widget _widget;

  LoginProvider provider;


  _LoginControllerState(this._callbackuser);

  @override
  void initState() {
    super.initState();
    _widget = LoginProvider(
      child: Options(),
      callbackAlterarView: (view){
        changeView(view);
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        body:  Padding(
          padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
          child: Container(
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
            )
          ),
        ),
      );

  }

  void changeView(String view){
    switch(view){

      case "login": setState(() {
        _widget = LoginProvider(
          child: LoginForm(),
          callbackAlterarView: (view){
            changeView(view);
          },
          callbackSaveUser: (){
            _callbackuser();
          },
        );
      }); break;

      case "nova_conta": setState(() {
        _widget = LoginProvider(
          child: NewUserForm(),
          callbackAlterarView: (view){
            changeView(view);
          },
        );
      }); break;

      case "options": setState(() {
        _widget = LoginProvider(
          child: Options(),
          callbackAlterarView: (view){
            changeView(view);
          },
        );
      }); break;

    }
  }


}
