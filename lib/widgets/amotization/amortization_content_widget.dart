import 'dart:io';

import '../../util/colores.dart';
import 'package:flutter/material.dart';

Widget listViewContent(context, snapshot, tipo) {
  TextStyle es1 = TextStyle(
    fontSize: letraTextoTamanno(context),
  );
  TextStyle es2 = TextStyle(
      fontSize: letraTextoTamanno(context),
      color: Colors.orange,
      fontWeight: FontWeight.bold);
  _listTile(title, data, icon) {
    return Padding(
      padding: EdgeInsets.only(left: paddingAll(context) + 70),
      child: ListTile(
        title: Row(
          children: [
            Icon(
              icon,
              color: Colors.orange,
            ),
            SizedBox(
              width: sizedBox(context),
            ),
            Text(title, style: es2),
            SizedBox(
              width: sizedBox(context),
            ),
            Text(data, style: es1),
          ],
        ),
      ),
    );
  }

  Widget _content(context, datos, index) {
    return Card(
      child: ExpansionTile(
        backgroundColor: Colors.white,
        leading: CircleAvatar(
          radius: tamannoIcono(context) + 5,
          backgroundColor: primaryColor,
          child: Center(
              child: Text(
            datos[index].nrocta,
            style: TextStyle(color: Colors.white),
          )),
        ),
        title: Platform.isAndroid?Text(
          "Fecha Programada: ${datos[index].fchaprog}",
          style: es1,
        ):medidaReferenciaAlto >= xxxlarga?
        Text(
          "Fecha Programada: ${datos[index].fchaprog}",
          style: es1,
        ):
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Fecha Programada:'),
            Text(datos[index].fchaprog),
          ],
        ),
        subtitle: Text(
          "Total Pendiente: ${datos[index].pndntertotal}",
          style: es1,
        ),
        children: [
          _listTile('Interes: ', datos[index].intres, Icons.show_chart),
          _listTile('Capital: ', datos[index].cptal, Icons.attach_money),
          //_listTile('Seguro: ', datos[index].seguro, Icons.assignment_ind),
          _listTile('Valor Cuota: ', datos[index].vlorcta, Icons.money_off)
        ],
      ),
    );
  }

  var datos = snapshot;
  return ListView.builder(
    primary: true,
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    itemCount: datos.length,
    itemBuilder: (BuildContext context, index) {
      return _content(context, datos, index);
    },
  );
}
