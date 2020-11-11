import 'package:flutter/material.dart';
import 'package:portalkiwi/model/User.dart';

class LoginProvider extends InheritedWidget {

  final Widget child;
  final Function callbackAlterarView, callbackSaveUser;

  LoginProvider({this.child, this.callbackAlterarView, this.callbackSaveUser});

  static LoginProvider of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<LoginProvider>();

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  void alterarView(String view) => callbackAlterarView(view);

  void userSaved() => callbackSaveUser();
  
}