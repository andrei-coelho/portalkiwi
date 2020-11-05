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
          child: ListView(
              scrollDirection: Axis.vertical,
            children: lista,
          ),
        ),
      )
    );
  }


  List<Widget> _forgetStep1(){

    TextEditingController emailControllerForget  =  TextEditingController();
    Input emailForget = Input(
      "E-mail",
      icon: Icon(Icons.email),
      textInputType: TextInputType.emailAddress,
      textEditingController: emailControllerForget,
    );

      return [
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
            _widgets = _forgetStep2();
          });
        }),

        BtnBackLogin((){
          setState(() {
            _widgets =  _getOptions();
          });
        })
      ];
  }

  List<Widget> _forgetStep2(){

    TextEditingController codeInputController  =  TextEditingController();

    Input codeInput = Input(
      "Código",
      icon: Icon(Icons.lock),
      textInputType: TextInputType.text,
      textEditingController: codeInputController,
    );

    return [
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
        setState(() {
          _widgets =  _forgetStep1();
        });
      })

    ];
  }

  List<Widget> _newUserForm(){

    Input email = Input("E-mail", icon: Icon(Icons.email), textInputType: TextInputType.emailAddress,);
    Input senha = Input("Senha", icon: Icon(Icons.lock), textInputType: TextInputType.visiblePassword,);
    Input nome = Input("Nome", icon: Icon(Icons.person));

    return [

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
        setState(() {
          /// tentar vazer o login aqui
        });
      }),

      BtnBackLogin((){
        setState(() {
          _widgets =  _getOptions();
        });
      })
    ];
  }

  List<Widget> _LoginForm(){

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

    return [

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
        setState(() {
          /// tentar vazer o login aqui
        });
      }),

      BtnLink("Esqueci minha senha", (){
        setState(() {
          _widgets = [];
          _widgets =  _forgetStep1();
        });
      }),

      BtnBackLogin((){
        setState(() {
          _widgets =  _getOptions();
        });
      })

    ];
  }


  List<Widget> _getOptions(){
    return [

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
