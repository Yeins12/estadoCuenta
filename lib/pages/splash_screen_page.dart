import '.././util/colores.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
          child: Container(
        child: Image.asset('assets/img/inicio.png',
            width: MediaQuery.of(context).size.height * 0.3, fit: BoxFit.fill),
      )),
    );
  }
}
