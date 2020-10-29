import 'package:flutter/material.dart';

// RESOURCES AND MODEL
import 'package:portalkiwi/model/User.dart';
import 'package:portalkiwi/navigate/UI/App.dart';
import 'package:portalkiwi/resources/SQLi.dart';
import 'package:portalkiwi/resources/API.dart';

// UI
import 'package:portalkiwi/navigate/UI/Load.dart';
import 'package:portalkiwi/navigate/UI/Login.dart';



class Controller extends StatefulWidget {
  @override
  _ControllerState createState() => _ControllerState();
}

class _ControllerState extends State<Controller> {

  User user;
  bool userChecked = false;
  Widget UI = Load();

  @override
  Widget build(BuildContext context) {
    if(user == null) {
      verifyUserDB();
    }
    if(!userChecked && user != null){
      verifyUserAPI();
    }
    return UI;
  }

  void verifyUserAPI(){
    UI = Load();
    setState(() {
      API.getData(user.token + "/getUser", (response){
        if(!response['error']){
          setState(() {
            userChecked = true;
            UI = App();
          });
        } else {
          if(response['response'] <= 499){
            // erro ao validar, solicite que o usuário faça o login novamente
            print("erro ao validar o usuário");
          } else {
            // problema no servidor, inform o usuário e feche o app
            print("erro no servidor");
          }
        }
      });
    });

  }

  void verifyUserDB(){
    setState(() {
      SQLi.getUser((userDB){
        if(userDB == null){
          UI = Login((userLogin){
            setState(() {
              this.user = userLogin;
            });
          });
        } else {
          setState(() {
            this.user = userDB;
          });
        }
      });
    });
  }



}
