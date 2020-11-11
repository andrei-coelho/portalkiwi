import 'package:flutter/material.dart';
import 'package:portalkiwi/model/User.dart';
import 'package:portalkiwi/navigate/components/Btn.dart';
import 'package:portalkiwi/navigate/components/Input.dart';
import 'package:portalkiwi/providers/LoginProvider.dart';

class LoginForm extends StatefulWidget {

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  LoginProvider _provider;

  @override
  Widget build(BuildContext context) {

    _provider = LoginProvider.of(context);

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

      scrollDirection: Axis.vertical,
      shrinkWrap: true,
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

          // _provider.userSaved();

        }),

        BtnLink("Esqueci minha senha", () => _provider.alterarView("forget")),

        BtnBackLogin(() => _provider.alterarView("options"))

      ],
    );
  }
}
