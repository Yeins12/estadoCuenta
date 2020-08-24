import '.././util/colores.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
          child: Container(
        margin: EdgeInsets.all(
            medidaReferenciaAlto = MediaQuery.of(context).size.height * 0.18),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/img/inicio.png'),
                fit: BoxFit.contain)),
      )),
    );
  }
}
