import 'package:connectivity/connectivity.dart';
import '../../widgets/alert/alert_dialogo.dart';
import '../../service/login_service.dart';
import 'package:provider/provider.dart';

import '../../util/FadeAnimation.dart';
import '../../util/colores.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  //Declaración de variables
  final GlobalKey<FormState> _formKey = GlobalKey();

  Map<String, String> _datosAtenticar = {
    'usuario': '',
    'clave': '',
  };
  TabController controller;
  TextEditingController usuarioController = new TextEditingController();
  TextEditingController claveController = new TextEditingController();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    //WIDGET TOP
    Widget _top() {
      return Container(
        height: MediaQuery.of(context).size.height * 0.5,
        child: Stack(
          children: <Widget>[
            CustomPaint(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.5,
              ),
              painter: CurvePainter(),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: paddingAll(context) * 4,
                  top: paddingTop(context)), //9),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeAnimation(
                    1,
                    Text(
                      "Tu",
                      style: TextStyle(
                          fontFamily: 'berlin',
                          color: Colors.white,
                          fontSize: tileSize(context),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  FadeAnimation(
                    1,
                    Text(
                      "Estado",
                      style: TextStyle(
                          fontFamily: 'berlin',
                          color: Colors.white,
                          fontSize: tileSize(context),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  FadeAnimation(
                    1,
                    Text(
                      "De Cuenta",
                      style: TextStyle(
                          fontFamily: 'berlin',
                          color: Colors.white,
                          fontSize: tileSize(context),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: paddingAll(context) * 5,
              top: paddingAll(context) * 9,
              width: MediaQuery.of(context).size.width * 0.25,
              height: MediaQuery.of(context).size.width * 0.4,
              child: FadeAnimation(
                  1.5,
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/img/logocta1.png'))),
                  )),
            ),
          ],
        ),
      );
    }

    //WIDGET BOTTOM
    Widget _bottom() {
      return Padding(
        padding: EdgeInsets.only(
            right: paddingAll(context) * 5, left: paddingAll(context) * 5),
        child: Column(
          children: <Widget>[
            FadeAnimation(
                1.8,
                Container(
                  padding: EdgeInsets.all(paddingAll(context)),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(143, 148, 251, .2),
                            blurRadius: 20.0,
                            offset: Offset(0, 10))
                      ]),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Colors.grey[100]))),
                          child: TextFormField(
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Usuario invalido';
                              }
                              return null;
                            },
                            onSaved: (valor) {
                              _datosAtenticar['usuario'] = valor;
                            },
                            controller: usuarioController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Usuario",
                                hintStyle: TextStyle(color: Colors.grey[400],fontSize: letraTextoTamanno(context))),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8.0),
                          child: TextFormField(
                            obscureText: _obscureText,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Clave invalida';
                              }
                              return null;
                            },
                            onSaved: (valor) {
                              _datosAtenticar['clave'] = valor;
                            },
                            controller: claveController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Clave",
                                hintStyle: TextStyle(color: Colors.grey[400], fontSize: letraTextoTamanno(context))),
                          ),
                        )
                      ],
                    ),
                  ),
                )),
            SizedBox(
              height: 30,
            ),
            FadeAnimation(
                2,
                InkWell(
                  onTap: () async {
                    var connectivityResult =
                        await (Connectivity().checkConnectivity());
                    if (connectivityResult == ConnectivityResult.none) {
                      toastShow(context, 'Verifica tu conexión a internet');
                    } else {
                      if (!_formKey.currentState.validate()) {
                        // Invalid!
                        return;
                      }
                      _formKey.currentState.save();
                      try {
                        await Provider.of<LoginService>(context, listen: false)
                            .authenticate(_datosAtenticar['usuario'],
                                _datosAtenticar['clave'], context);
                      } catch (e) {
                        mostrarDialogoWidget(
                            0,
                            context,
                            'Ha ocurrido un error!',
                            'Autenticación fallida. Intente de nuevo',
                            1);
                      }
                    }
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(colors: [
                          primaryColor,
                          colorVerdeClaro,
                        ])),
                    child: Center(
                      child: Text(
                        "Iniciar Sesión",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold, fontSize: letraTextoTamanno(context)),
                      ),
                    ),
                  ),
                )),
            SizedBox(
              height: sizedBox(context),
            ),
          ],
        ),
      );
    }

    //SCAFFOLD PRINCIPÁL
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Column(
        children: [_top(), _bottom()],
      )),
    );
  }
}

//DRAW CURVEPAINTER
class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()..color = primaryColor;
    // create a path
    var path = Path()
      ..moveTo(0, size.height)
      ..quadraticBezierTo(size.width * 0.3, size.height * 0.600,
          size.width * 0.65, size.height * 0.760)
      ..quadraticBezierTo(size.width * 1.40, size.height * 1.2,
          size.width * 1.2, size.height * 0.300)
      ..lineTo(size.width, 0)
      ..lineTo(0, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
