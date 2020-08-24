import 'dart:io';

import '../../service/menuService/credit_simulator_service.dart';
import '../../util/icon_msg_back.dart';
import 'package:provider/provider.dart';

import '../../widgets/amotization/amortization_content_widget.dart';

import '../../models/amortization_model.dart';
import '../../service/accountServices/amortization_service.dart';

import '../../util/colores.dart';
import 'package:flutter/material.dart';

class AmortizationPage extends StatelessWidget {
  final tipo;
  final String nrocredito;
  const AmortizationPage({Key key, this.nrocredito, this.tipo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<AmortizationModel> providerList =
        Provider.of<CreditSimulatorService>(context).getLista;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          brightness: Brightness.dark,
          title: Text('Amortización',
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
        ),
        body: tipo == 0
            ? listViewContent(context, providerList, tipo)
            : FutureBuilder<AmortizationList>(
                future:
                    AmortizationService.amortizationQuery(context, nrocredito),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return listViewContent(
                        context, snapshot.data.amortizationList, 1);
                    /*
                    return ListView.builder(
                      primary: true,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: snapshot.data.amortizationList.length,
                      itemBuilder: (BuildContext context, index) {
                        return content(context, snapshot, 0);
                      },
                    );*/
                  } else if (snapshot.hasError) {
                    return iconMsgBack(
                        context, Icons.error, 'Ha ocurrido un error', 1);
                  }
                  return Center(child: iconCargando(context));
                }));
  }
}
