import 'package:cached_network_image/cached_network_image.dart';
import '../../../models/noticia_model.dart';

import '../../../util/colores.dart';
import 'package:flutter/material.dart';

class DetalleNoticiaPage extends StatelessWidget {
  final NoticiaModel noticia;
  const DetalleNoticiaPage({Key key, @required this.noticia}) : super(key: key);

  Widget _content(context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(paddingAll(context)),
        child: Column(
          children: [
            Center(
              child: Text(
                noticia.titulo,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'berlin',
                    fontSize: letraBarTamanno(context),
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Divider(height: 1.0, color: Colors.orange),
            ),
            Row(
              children: [
                Icon(
                  Icons.access_time,
                  color: primaryColor,
                ),
                SizedBox(
                  width: sizedBox(context),
                ),
                Text(
                  'Publicado: ${noticia.fecha}',
                  style: TextStyle(
                      color: Colors.grey, fontSize: letraTextoTamanno(context)),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.all(paddingAll(context)),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.2,
              child: CachedNetworkImage(
                imageUrl: noticia.rutaimg,
                fit: BoxFit.cover,
                placeholder: (context, url) => new Icon(
                  Icons.panorama,
                  color: Colors.grey,
                  size: 120.0,
                ),
              ),
            ),
            Text(
              noticia.contenido,
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: letraTextoTamanno(context)),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Divider(height: 1.0, color: Colors.orange),
            ),
            Text(
              noticia.cita,
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: letraTextoTamanno(context)),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Detalle',
            style: TextStyle(
              fontFamily: 'berlin',
              color: Colors.white,
              fontSize: letraBarTamanno(context),
            )),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: tamannoIcono(context),
          ),
          onPressed: () => Navigator.of(context).pop(true),
        ),
      ),
      body: _content(context),
    );
  }
}
