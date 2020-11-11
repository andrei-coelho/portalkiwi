import 'package:flutter/material.dart';
import 'package:portalkiwi/navigate/components/Btn.dart';
import 'package:portalkiwi/providers/LoginProvider.dart';

class Options extends StatefulWidget {

  final _OptionsState _optionsState = _OptionsState();

  @override
  _OptionsState createState() => _optionsState;
}

class _OptionsState extends State<Options> {
  
  LoginProvider _provider;

  @override
  Widget build(BuildContext context) {

    _provider = LoginProvider.of(context);
    
    return ListView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
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

        Btn("Entrar", () => _provider.alterarView("login")),

        Btn("Criar Nova Conta", () => _provider.alterarView("nova_conta"), border: true)

      ],
    );
  }
}
