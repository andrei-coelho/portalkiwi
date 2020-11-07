import 'package:flutter/material.dart';

// RESOURCES AND MODEL
import 'package:portalkiwi/model/User.dart';
import 'package:portalkiwi/navigate/UI/AppController.dart';
import 'package:portalkiwi/resources/SQLi.dart';
import 'package:portalkiwi/resources/API.dart';

// UI
import 'package:portalkiwi/navigate/UI/Load.dart';
import 'package:portalkiwi/navigate/UI/LoginController.dart';



class MainController extends StatefulWidget {
  @override
  _MainControllerState createState() => _MainControllerState();
}

class _MainControllerState extends State<MainController> {

  User _user;
  bool _userChecked = false;
  Widget _UI = Load();

  @override
  void initState() {
    super.initState();
    _verifyUserDB();
  }

  @override
  Widget build(BuildContext context) {
    if(!_userChecked && _user != null){
      _verifyUserAPI();
    }
    return _UI;
  }

  void _verifyUserAPI(){
    _UI = Load();
    API.getData(_user.token + "/getUser", (response){
      if(!response['error']){
        setState(() {
          _userChecked = true;
          _UI = AppController();
        });
      } else {
        if(response['response'] <= 499){
          // erro ao validar, solicite que o usuário faça o login novamente
          print("erro ao validar o usuário");
        } else {
          // problema no servidor, informe o usuário e feche o app
          print("erro no servidor");
        }
      }
    });

  }

  void _verifyUserDB(){
    SQLi.getUser((userDB){
      if(userDB == null){
        setState(() {
          _UI = LoginController((userLogin){
            setState(() {
              this._user = userLogin;
            });
          });
        });
      } else {
        setState(() {
          this._user = userDB;
        });
      }
    });
  }



}
