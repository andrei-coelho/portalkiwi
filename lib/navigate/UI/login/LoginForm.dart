import 'package:flutter/material.dart';
import 'package:portalkiwi/model/User.dart';
import 'package:portalkiwi/navigate/components/Btn.dart';
import 'package:portalkiwi/navigate/components/Input.dart';

class LoginForm extends StatefulWidget {

  final _LoginFormState _state = _LoginFormState();

  LoginForm(Function call, Function callUser, {Key key}):super(key:key){
    _state.setCallBacks(call, callUser);
  }

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  Function _call, _callUser;

  void setCallBacks(Function call, Function callUser){
    _call = call;
    _callUser = callUser;
  }

  @override
  Widget build(BuildContext context) {

    TextEditingController emailController  =  TextEditingController();
    TextEditingController senhaController  =  TextEditingController();

    Input email = Input("E-mail", icon: Icon(Icons.email),
      textEditingController: emailController,
      textInputType: TextInputType.emailAddress,
    );

    Input senha = Input("senha", icon: Icon(Icons.lock),
      textEditingController: senhaController,
      textInputType: TextInputType.visiblePassword,
    );

    return ListView(
      children: [

        Padding(
          padding: EdgeInsets.all(10),
          child: Center(
            child: Text(
              "Digite os dados abaixo:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.all(10),
          child: email,
        ),

        Padding(
          padding: EdgeInsets.all(10),
          child: senha,
        ),

        Btn("Entrar", (){
          if(emailController.text != "" && senhaController.text != ""){
            print("Está ok!");
          } else {
            print("nao esta  ok");
          }
          _callUser(User("Andrei", "_device_key", "_token"));
        }),

        BtnLink("Esqueci minha senha", (){
          _call("forget");
        }),

        BtnBackLogin((){
          _call("options");
        })

      ],
    );
  }
}
