import '../../../util/colores.dart';
import '../../../util/icon_msg_back.dart';
import 'package:flutter/material.dart';

class NoticiasPage extends StatelessWidget {
  Widget _card(snapshot, index, context) {
    final medidaReferencia = MediaQuery.of(context).size.height;

    return GestureDetector(
      child: Card(
        color: primaryColor,
        semanticContainer: true,
        elevation: 3,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                    color: Colors.white,
                    child: Image.network(
                      snapshot.data[index].ruta,
                      width: medidaReferencia >= 1000
                          ? 240
                          : medidaReferencia >= 600 ? 160 : 120,
                      height: medidaReferencia >= 1000
                          ? 200
                          : medidaReferencia >= 600 ? 150 : 100,
                    )),
              ],
            ),
            Expanded(
              flex: 6,
              child: Container(
                alignment: Alignment.center,
                color: primaryColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      snapshot.data[index].titulo,
                      style: TextStyle(
                          fontSize: letraTextoTamanno(context),
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: sizedBox(context),
                    ),
                    Text(
                      snapshot.data[index].fecha,
                      style: TextStyle(
                          fontSize: letraTextoTamanno(context),
                          color: Colors.grey),
                    ),
                    SizedBox(
                      height: (paddingAll(context) - 5).isNegative
                          ? 3
                          : (paddingAll(context) - 5),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildLista() {
    return FutureBuilder(
        future: null,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              primary: true,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, index) {
                return _card(snapshot, index, context);
              },
            );
          } else if (snapshot.hasError) {
            return iconMsgBack(context, Icons.error, 'Ha ocurrido un error', 1);
          }
          return Center(child: iconCargando(context));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildLista(),
    );
  }
}
