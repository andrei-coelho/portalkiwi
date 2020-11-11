import 'package:flutter/material.dart';
import 'package:portalkiwi/model/User.dart';
import 'package:portalkiwi/navigate/components/Btn.dart';
import 'package:portalkiwi/navigate/components/Input.dart';
import 'package:portalkiwi/providers/LoginProvider.dart';

class NewUserForm extends StatefulWidget {
  @override
  _NewUserFormState createState() => _NewUserFormState();
}

class _NewUserFormState extends State<NewUserForm> {

  LoginProvider _provider;

  @override
  Widget build(BuildContext context) {

    _provider = LoginProvider.of(context);

    Input email = Input("E-mail", icon: Icon(Icons.email), textInputType: TextInputType.emailAddress,);
    Input senha = Input("Senha", icon: Icon(Icons.lock), textInputType: TextInputType.visiblePassword,);
    Input nome = Input("Nome", icon: Icon(Icons.person));

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
          child: nome,
        ),

        Padding(
          padding: EdgeInsets.all(10),
          child: email,
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: senha,
        ),

        Btn("Salvar", (){
          /// gera um usuário
          // _provider.userSaved();
        }),

        BtnBackLogin((){
          _provider.alterarView("options");
        })
      ],
    );
  }
}
