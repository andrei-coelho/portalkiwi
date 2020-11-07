import 'package:flutter/material.dart';
import 'package:portalkiwi/model/User.dart';
import 'package:portalkiwi/navigate/components/Btn.dart';
import 'package:portalkiwi/navigate/components/Input.dart';

class NewUserForm extends StatefulWidget {

  final _NewUserFormState _state = _NewUserFormState();

  NewUserForm(Function call, Function callUser, {Key key}):super(key:key){
    _state.setCallBack(call,callUser);
  }

  @override
  _NewUserFormState createState() => _NewUserFormState();
}

class _NewUserFormState extends State<NewUserForm> {

  Function _call, _callUser;

  void setCallBack(Function call, Function callUser){
    _call = call;
    _callUser = callUser;
  }

  @override
  Widget build(BuildContext context) {

    Input email = Input("E-mail", icon: Icon(Icons.email), textInputType: TextInputType.emailAddress,);
    Input senha = Input("Senha", icon: Icon(Icons.lock), textInputType: TextInputType.visiblePassword,);
    Input nome = Input("Nome", icon: Icon(Icons.person));

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
          _callUser(User("_nome", "_device_key", "_token"));
        }),

        BtnBackLogin((){
          _call("options");
        })
      ],
    );
  }
}
