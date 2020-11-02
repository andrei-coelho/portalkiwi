import 'package:flutter/material.dart';
import 'package:portalkiwi/model/User.dart';
import 'package:portalkiwi/navigate/components/Btn.dart';
import 'package:portalkiwi/navigate/components/Input.dart';

class Login extends StatefulWidget {

  final _LoginState __loginState = _LoginState();

  Login(Function call, {Key key}):super(key:key){
    __loginState.setCallBack(call);
  }

  @override
  _LoginState createState() => __loginState;
}

class _LoginState extends State<Login> {

  Function _callback;
  List<Widget> _widgets;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _widgets = _getOptions();

  }

  void setCallBack(Function call){
      this._callback = call;
  }

  @override
  Widget build(BuildContext context) {

    List <Widget> lista = [
      // logo
      Padding(
        padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
        child: Container(
          child: Center(child: Image.asset(
            "assets/portalkiwilogo.png",
            scale: 1.6,
          ),),
        ),
      ),
    ];
    lista.addAll(_widgets);

    return MaterialApp(
      home: Scaffold(
        body:  Padding(padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
          child: Column(
            children: lista,
          ),
        ),
      )
    );
  }

  List<Widget> _newUserForm(){

    Input email = Input("E-mail", icon: Icon(Icons.email));
    Input senha = Input("Senha", icon: Icon(Icons.lock));
    Input nome = Input("Nome", icon: Icon(Icons.lock));

    return [

      Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          "Digite os dados abaixo:",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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
      Btn("Entrar", (){
        setState(() {
          /// tentar vazer o login aqui
        });
      })
    ];
  }

  List<Widget> _LoginForm(){

    Input email = Input("E-mail", icon: Icon(Icons.email));
    Input senha = Input("senha", icon: Icon(Icons.lock));

    return [

      Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          "Digite os dados abaixo:",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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
        setState(() {
          /// tentar vazer o login aqui
        });
      }),

      BtnLink("Esqueci minha senha", (){
        setState(() {
          /// faça algo aqui
        });
      }),

      BtnBackLogin((){

      })

    ];
  }


  List<Widget> _getOptions(){
    return [

      // TEXTO DE APRESENTAÇÃO
      Text("Seja bem vindo ao Portal Kiwi!", style: TextStyle(fontSize: 16),),
      Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          "Escolha uma opção abaixo:",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),

      Btn("Entrar", (){
        setState(() {
          _widgets = _LoginForm();
        });
      }),

      Btn("Criar Nova Conta", (){
        setState(() {
          _widgets = _newUserForm();
        });
      }, border: true)


    ];
  }


}
