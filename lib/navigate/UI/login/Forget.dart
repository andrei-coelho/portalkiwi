import 'package:flutter/material.dart';
import 'package:portalkiwi/navigate/components/Btn.dart';
import 'package:portalkiwi/navigate/components/Input.dart';

class Forget extends StatefulWidget {

  final _ForgetState _state = _ForgetState();

  Forget(Function call, {Key key}):super(key:key){
    _state.setCallBack(call);
  }

  @override
  _ForgetState createState() => _ForgetState();
}

class _ForgetState extends State<Forget> {

  Function _call;
  ListView _listView;

  void setCallBack(Function call){
    _call = call;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _listView = _forgetStepOne();
  }

  @override
  Widget build(BuildContext context) {
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
          _call("options");
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
          setState(() {
            /// tentar vazer o login aqui
          });
        }),

        BtnBackLogin((){
          _call("options");
        })

      ],
    );
  }

}
