import 'package:flutter/material.dart';
import 'package:portalkiwi/navigate/components/Btn.dart';
import 'package:portalkiwi/navigate/components/Input.dart';
import 'package:portalkiwi/providers/LoginProvider.dart';

class Forget extends StatefulWidget {

  @override
  _ForgetState createState() => _ForgetState();
}

class _ForgetState extends State<Forget> {

  ListView _listView;
  LoginProvider _provider;

  @override
  void initState() {
    super.initState();
    _listView = _forgetStepOne();
  }

  @override
  Widget build(BuildContext context) {
    _provider = LoginProvider.of(context);
    return _listView;
  }

  ListView _forgetStepOne(){

    TextEditingController emailControllerForget  =  TextEditingController();
    Input emailForget = Input(
      "E-mail",
      icon: Icon(Icons.email),
      textInputType: TextInputType.emailAddress,
      textEditingController: emailControllerForget,
    );

    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.all(10),
          child: Center(
            child: Text(
              "Enviaremos um código de recuperação da sua conta de e-mail",
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.all(10),
          child: emailForget,
        ),

        Btn("Enviar", (){
          /// gerar código e enviar para o email via api
          setState(() {
            _listView = _forgetStepTwo();
          });
        }),

        BtnBackLogin((){
          _provider.alterarView("options");
        })
      ],
    );

  }

  ListView _forgetStepTwo(){

    TextEditingController codeInputController  =  TextEditingController();

    Input codeInput = Input(
      "Código",
      icon: Icon(Icons.lock),
      textInputType: TextInputType.text,
      textEditingController: codeInputController,
    );

    return ListView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      children: [
        Padding(
          padding: EdgeInsets.all(10),
          child: Center(
            child: Text(
              "Enviamos um código para o seu e-mail:",
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.all(10),
          child: Center(
            child: Text(
              "Digite o código abaixo:",
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.all(10),
          child: codeInput,
        ),

        Btn("Enviar", (){

        }),

        BtnBackLogin((){
          _provider.alterarView("options");
        })

      ],
    );
  }

}
