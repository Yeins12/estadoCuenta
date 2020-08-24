import 'dart:io';

import '../../models/creditDetail_model.dart';
import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfDetailAccountWidget {
  final CreditDetailModel creditDetail;
  PdfDetailAccountWidget({this.creditDetail});
  final pdf = pw.Document();
  _text(title) {
    return pw.Text(title,
        style: pw.TextStyle(
          fontWeight: pw.FontWeight.bold,
        ));
  }

  _writeOnPdf(_logo) {
    List<List> salidas = new List();
    salidas.add(<String>[
      'Nro Cuota',
      'Fecha',
      'Valor Cuota',
      'Capital',
      'Intereses',
      'Mora',
      'Seguro',
      'Total Pago',
      'Nro recibo'
    ]);
    //salidas.add(creditDetail.detCuenta);

    creditDetail.detCuenta.forEach((element) {
      List<String> recind = <String>[
        element.cuota,
        element.fecha,
        element.valor,
        element.capital,
        element.intereses,
        element.mora,
        element.seguro,
        element.total,
        element.recibo
      ];
      salidas.add(recind);
    });
    pdf.addPage(pw.MultiPage(build: (pw.Context context) {
      return <pw.Widget>[
        pw.Container(
          alignment: pw.Alignment.center,
          padding: const pw.EdgeInsets.only(top: 5, bottom: 10),
          height: 80,
          child: _logo != null ? pw.Image(_logo) : pw.PdfLogo(),
        ),
        pw.Header(
            level: 0,
            child: pw.Text("TU ESTADO DE CUENTA",
                style: pw.TextStyle(
                    color: PdfColor.fromHex('#009688'),
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 20))),
        pw.Container(
            margin: pw.EdgeInsets.only(bottom: 10),
            decoration: pw.BoxDecoration(
              borderRadius: 2,
              color: PdfColor.fromHex('#009688'),
            ),
            padding:
                pw.EdgeInsets.only(left: 10, top: 20, right: 20, bottom: 10),
            alignment: pw.Alignment.centerLeft,
            height: 150,
            child: pw.DefaultTextStyle(
                style: pw.TextStyle(
                  color: PdfColor.fromHex('#FFFFFF'),
                  fontSize: 12,
                ),
                child: pw.GridView(
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 10,
                    crossAxisCount: 4,
                    children: [
                      _text('Nro Crédito'),
                      _text('Fecha Inicio'),
                      _text('Valor'),
                      _text('Pendientes'),
                      pw.Text(creditDetail.nrocredio),
                      pw.Text(creditDetail.fechainicio),
                      pw.Text(creditDetail.valor),
                      pw.Text(creditDetail.pendiente),
                      _text('Descripción'),
                      pw.Text(''),
                      pw.Text(creditDetail.descripcion),
                      pw.Text(''),
                      _text('Cuotas'),
                      _text('Pendientes'),
                      pw.Text(''),
                      _text('Interés'),
                      pw.Text(creditDetail.cuotas),
                      pw.Text(creditDetail.cpendientes),
                      pw.Text(''),
                      pw.Text(creditDetail.interes),
                    ]))),
        pw.Header(
            level: 0,
            child: pw.Center(
                child: pw.Text("Detalle de Pagos",
                    style: pw.TextStyle(
                        color: PdfColor.fromHex('#009688'),
                        fontWeight: pw.FontWeight.bold,
                        fontSize: 15)))),
        pw.SizedBox(height: 10),
        pw.Table.fromTextArray(
            context: context,
            data: salidas,
            border: null,
            cellAlignment: pw.Alignment.centerLeft,
            headerDecoration: pw.BoxDecoration(
              borderRadius: 2,
              color: PdfColor.fromHex('#009688'),
            ),
            headerHeight: 25,
            cellHeight: 40,
            headerStyle: pw.TextStyle(
              color: PdfColor.fromHex('#FFFFFF'),
              fontSize: 8,
              fontWeight: pw.FontWeight.bold,
            ),
            cellStyle:
                pw.TextStyle(color: PdfColor.fromHex('#000000'), fontSize: 7),
            rowDecoration: pw.BoxDecoration(
                border: pw.BoxBorder(
                    bottom: true,
                    color: PdfColor.fromHex('#000000'),
                    width: .5))),
      ];
    }));
  }

  Future _savePdf() async {
    var now = DateTime.now();
    //Get external storage directory
    Directory directory = await getExternalStorageDirectory();
    //Get directory path
    String path = directory.path;
    //Create an empty file to write PDF data
    File file = File('$path/Output$now.pdf');
    //Write PDF data
    file.writeAsBytesSync(pdf.save());
    //Open File
    OpenFile.open('$path/Output$now.pdf');
  }

  pdfDownloadDetail() async {
    PdfImage _logo;
    _logo = PdfImage.file(
      pdf.document,
      bytes:
          (await rootBundle.load('assets/img/icon.png')).buffer.asUint8List(),
    );
    _writeOnPdf(_logo);
    await _savePdf();
  }
}
