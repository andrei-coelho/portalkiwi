import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class Load extends StatefulWidget {
  @override
  _LoadState createState() => _LoadState();
}

class _LoadState extends State<Load> {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        body: Container(
          child:  FlareActor(
              "assets/PortalKiwi.flr",
              alignment:Alignment.center,
              fit:BoxFit.contain,
              animation: "rotate",
              sizeFromArtboard: false
            )
          ),
        ),
      );
  }
}
