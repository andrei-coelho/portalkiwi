import 'package:flutter/material.dart';
import 'package:portalkiwi/navigate/components/Btn.dart';

class Options extends StatefulWidget {

  final _OptionsState _optionsState = _OptionsState();

  Options(Function call, {Key key}):super(key:key){
    _optionsState.setCallBack(call);
  }

  @override
  _OptionsState createState() => _optionsState;
}

class _OptionsState extends State<Options> {

  Function _call;

  void setCallBack(Function call){
    _call = call;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [

        // TEXTO DE APRESENTAÇÃO
        Center(
          child: Text("Seja bem vindo ao Portal Kiwi!", style: TextStyle(fontSize: 16),),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: Center(
            child: Text(
              "Escolha uma opção abaixo:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
        ),

        Btn("Entrar", (){
          _call("login");
        }),

        Btn("Criar Nova Conta", (){
          setState(() {
            _call("newUserForm");
          });
        }, border: true)

      ],
    );
  }
}
