import 'dart:io';

import '../../models/creditDetail_model.dart';
import '../../util/colores.dart';
import '../../widgets/pdfDocument/pdf_detailAccount_widget.dart';
import 'package:flutter/material.dart';

class AccountDetailPage extends StatelessWidget {
  final CreditDetailModel creditDetail;
  const AccountDetailPage({@required this.creditDetail, key}) : super(key: key);

  Widget _contentTop(context, icon, color, title, st1, data, st2) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: color,
            size: tamannoIcono(context),
          ),
          SizedBox(
            width: sizedBox(context),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: st1,
                textAlign: TextAlign.center,
              ),
              Text(
                data,
                style: st2,
                textAlign: TextAlign.center,
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _top(context) {
    TextStyle st1 = TextStyle(
        fontSize: letraTextoTamanno(context) - 2, color: Colors.white);
    TextStyle st2 = TextStyle(
        color: Colors.white,
        fontSize: letraTextoTamanno(context),
        fontWeight: FontWeight.bold);
    TextStyle st3 = TextStyle(
        color: Colors.white,
        fontSize: letraTextoTamanno(context),
        fontWeight: FontWeight.bold);
    return Column(
      children: [
        SizedBox(height: sizedBox(context)),
        Row(
          children: [
            _contentTop(context, Icons.nature, Colors.green[100], 'No. Crédito',
                st1, creditDetail.nrocredio, st2),
            _contentTop(context, Icons.calendar_today, Colors.green[100],
                'Fecha de inicio', st1, creditDetail.fechainicio, st2),
          ],
        ),
        SizedBox(
          height: sizedBox(context),
        ),
        Row(
          children: [
            _contentTop(context, Icons.attach_money, Colors.green[100], 'Valor',
                st1, creditDetail.valor, st2),
            _contentTop(context, Icons.money_off, Colors.green[100],
                'Pendiente', st1, creditDetail.pendiente, st3),
          ],
        ),
        SizedBox(
          height: sizedBox(context),
        ),
        Padding(
          padding: EdgeInsets.all(paddingAll(context)),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Descripción', style: st1),
                Text(creditDetail.descripcion,
                    style: TextStyle(
                        fontSize: letraTextoTamanno(context) + 2,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ],
            ),
          ),
        ),
        SizedBox(
          height: sizedBox(context),
        ),
        Row(
          children: [
            _contentTop(context, Icons.event_available, Colors.green[100],
                'Cuotas', st1, creditDetail.cuotas, st2),
            _contentTop(context, Icons.event_busy, Colors.green[100],
                'Pendientes', st1, creditDetail.cpendientes, st3),
            _contentTop(context, Icons.show_chart, Colors.green[100], 'Interés',
                st1, creditDetail.interes, st3),
          ],
        )
      ],
    );
  }

  Widget _content(context, index) {
    TextStyle es1 = TextStyle(
      fontSize: letraTextoTamanno(context),
    );
    _listTile(title, data) {
      return Expanded(
        child: ListTile(
          title: Center(
              child: Text(title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: letraTextoTamanno(context),
                      color: Colors.orange,
                      fontWeight: FontWeight.bold))),
          subtitle: Center(child: Text(data, style: TextStyle(fontSize: letraTextoTamanno(context)))),
        ),
      );
    }

    return Card(
      child: ExpansionTile(
        backgroundColor: Colors.white,
        leading: CircleAvatar(
          radius: tamannoIcono(context) + 5,
          backgroundColor: primaryColor,
          child: Center(
              child: Text(
            creditDetail.detCuenta[index].cuota,
            style: TextStyle(color: Colors.white),
          )),
        ),
        title: Text(
          "Fecha: ${creditDetail.detCuenta[index].fecha}",
          style: es1,
        ),
        subtitle: Text(
          "Recibo: ${creditDetail.detCuenta[index].recibo}",
          style: es1,
        ),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _listTile('Valor Cuota: ', creditDetail.detCuenta[index].valor),
              _listTile('Capital: ', creditDetail.detCuenta[index].capital),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _listTile('Intereses: ', creditDetail.detCuenta[index].intereses),
              _listTile('Mora: ', creditDetail.detCuenta[index].mora),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _listTile('Seguro: ', creditDetail.detCuenta[index].seguro),
              _listTile('Total Pago: ', creditDetail.detCuenta[index].total),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        brightness: Brightness.dark,
        title: Text('Detalle de cuenta',
            style: TextStyle(
              fontFamily: 'berlin',
              color: Colors.white,
              fontSize: letraBarTamanno(context),
            )),
        leading: IconButton(
          icon: Icon(
            Platform.isAndroid?Icons.arrow_back:Icons.arrow_back_ios,
            color: Colors.white,
            size: tamannoIcono(context),
          ),
          onPressed: () => Navigator.of(context).pop(true),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.file_download, color: Colors.white),
              onPressed: () =>
                  PdfDetailAccountWidget(creditDetail: creditDetail)
                      .pdfDownloadDetail())
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  color: primaryColor,
                  height: heightContent(context),
                  padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: _top(context),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * .60,
                  color: Colors.white,
                )
              ],
            ),
            Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.only(
                    top: topContent(context),
                    right: paddingAll(context),
                    left: paddingAll(context)),
                child: ListView.builder(
                  physics: new NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: creditDetail.detCuenta.length,
                  itemBuilder: (BuildContext context, index) {
                    return _content(context, index);
                  },
                ))
          ],
        ),
      ),
    );
  }
}
