import 'package:flutter/material.dart';

import 'colores.dart';

Widget iconMsgBack(context, icon, msg, tipo) {
  return SingleChildScrollView(
    child: Column(
      children: <Widget>[
        tipo == 0 ? CircularProgressIndicator() : SizedBox(height: 0),
        SizedBox(
          height: 10,
        ),
        Icon(
          icon,
          color: Colors.orange[200],
          size: tipo == 2 ? 60 : tamannoIconoBack(context),
        ),
        Text(
          msg,
          style: TextStyle(
              color: Colors.orange[300], fontSize: letraTextoTamanno(context)),
        )
      ],
    ),
  );
}

Widget iconCargando(context) {
  return Center(
    child: Image.asset(
      'assets/img/logo.gif',
      height: tammannoIconoCargando(context),
      width: tammannoIconoCargando(context),
    ),
  );
}
