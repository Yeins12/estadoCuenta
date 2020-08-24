import 'package:flutter/material.dart';
import 'flutter_colors.dart';

//ldpi
int xpequenna = 360;
//mdpi
int pequenna = 430;
//tvdpi
int mediana = 480;
//hdpi
int larga = 600;
//xhdpi
int xlarga = 719;
//xxhdpi
int xxlarga = 839;
//xxxhdpi
int xxxlarga = 959;
int xxxxlarga = 1025;
int xxxxxlarga = 1279;
int xxxxxxlarga = 1439;
int xxxxxxxlarga = 1599;
int xxxxxxxxlarga = 1919;

var medidaReferenciaAlto;
var medidaReferenciaAncho;

Color circuloColor = FlutterColor("#032f55");
Color primaryColor = FlutterColor("#23b674");
Color colorVerdeClaro = FlutterColor("#63e6ab");
Color colorVerdeCard = FlutterColor("#8cb9a5");
Color colorVerdeLogin = FlutterColor("#1bb25b");
Color colorCajaTexto = FlutterColor("#96e098");
Color iconoVerde = FlutterColor("#12470e");
//top
tileSize(context) {
  medidaReferenciaAlto = MediaQuery.of(context).size.height;
  print(MediaQuery.of(context).size.width);
  double medida = medidaReferenciaAlto <= xpequenna
      ? letraBarTamanno(context) + 10
      : medidaReferenciaAlto < pequenna
          ? letraBarTamanno(context) + 11
          : //probado
          medidaReferenciaAlto < mediana
              ? letraBarTamanno(context) + 14
              : //---probado 592
              medidaReferenciaAlto <= larga
                  ? letraBarTamanno(context) + 18
                  : //probado
                  medidaReferenciaAlto <= xlarga
                      ? letraBarTamanno(context) + 20
                      : //probado
                      medidaReferenciaAlto <= xxlarga
                          ? letraBarTamanno(context) + 22
                          : medidaReferenciaAlto <= xxxlarga
                              ? medidaReferenciaAncho <=pequenna? letraBarTamanno(context) + 15: letraBarTamanno(context) + 24
                              : //probado
                              medidaReferenciaAlto <= xxxxlarga
                                  ? letraBarTamanno(context) + 26
                                  : medidaReferenciaAlto <= xxxxxlarga
                                      ? letraBarTamanno(context) + 32
                                      : medidaReferenciaAlto <= xxxxxxlarga
                                          ? letraBarTamanno(context) + 36
                                          : letraBarTamanno(context) + 18;
  return medida;
}

menuSize(context) {
  medidaReferenciaAlto = MediaQuery.of(context).size.height;
  double medida = medidaReferenciaAlto <= xpequenna
      ? 180
      : medidaReferenciaAlto < pequenna
          ? 180
          : //probado
          medidaReferenciaAlto < mediana
              ? 180
              : //---probado 592
              medidaReferenciaAlto <= larga
                  ? 180
                  : //probado
                  medidaReferenciaAlto <= xlarga
                      ? 180
                      : //probado
                      medidaReferenciaAlto <= xxlarga
                          ? 180
                          : medidaReferenciaAlto <= xxxlarga
                              ? 200
                              : //probado
                              medidaReferenciaAlto <= xxxxlarga
                                  ? 250
                                  : medidaReferenciaAlto <= xxxxxlarga
                                      ? 250
                                      : medidaReferenciaAlto <= xxxxxxlarga
                                          ? 250
                                          : 180;
  return medida;
}

creditSize(context) {
  medidaReferenciaAlto = MediaQuery.of(context).size.height;
  double medida = medidaReferenciaAlto <= xpequenna
      ? medidaReferenciaAlto * 0.8
      : medidaReferenciaAlto < pequenna
          ? medidaReferenciaAlto * 0.9 //426
          : //probado
          medidaReferenciaAlto < mediana
              ? medidaReferenciaAlto * 0.8
              : //---probado 592
              medidaReferenciaAlto <= larga
                  ? medidaReferenciaAlto * 0.8
                  : //probado
                  medidaReferenciaAlto <= xlarga
                      ? medidaReferenciaAlto * 0.7
                      : //probado
                      medidaReferenciaAlto <= xxlarga
                          ? medidaReferenciaAlto * 0.6
                          : medidaReferenciaAlto <= xxxlarga
                              ? medidaReferenciaAlto * 0.6
                              : //probado
                              medidaReferenciaAlto <= xxxxlarga
                                  ? medidaReferenciaAlto * 0.6
                                  : medidaReferenciaAlto <= xxxxxlarga
                                      ? medidaReferenciaAlto * 0.5
                                      : medidaReferenciaAlto <= xxxxxxlarga
                                          ? medidaReferenciaAlto * 0.5
                                          : medidaReferenciaAlto * 0.8;
  return medida;
}

paddingTop(context) {
  medidaReferenciaAlto = MediaQuery.of(context).size.height;
  double medida = medidaReferenciaAlto <= xpequenna
      ? paddingAll(context) * 6
      : medidaReferenciaAlto < pequenna
          ? paddingAll(context) * 6
          : //probado
          medidaReferenciaAlto < mediana
              ? paddingAll(context) * 7
              : //---probado 592
              medidaReferenciaAlto <= larga
                  ? paddingAll(context) * 8
                  : //probado
                  medidaReferenciaAlto <= xlarga
                      ? paddingAll(context) * 9
                      : //probado
                      medidaReferenciaAlto <= xxlarga
                          ?  paddingAll(context) * 9
                          : medidaReferenciaAlto <= xxxlarga
                              ?  paddingAll(context) * 9
                              : //probado
                              medidaReferenciaAlto <= xxxxlarga
                                  ?  paddingAll(context) * 9
                                  : medidaReferenciaAlto <= xxxxxlarga
                                      ?  paddingAll(context) * 9
                                      : medidaReferenciaAlto <= xxxxxxlarga
                                          ?  paddingAll(context) * 9
                                          :  paddingAll(context) * 8;
  return medida;
}

radiusExt(context) {
  medidaReferenciaAlto = MediaQuery.of(context).size.height;
  double medida = medidaReferenciaAlto <= xpequenna
      ? 30
      : medidaReferenciaAlto < pequenna
          ? 40
          : //probado
          medidaReferenciaAlto < mediana
              ? 50
              : //---probado 592
              medidaReferenciaAlto <= larga
                  ? 60
                  : //probado
                  medidaReferenciaAlto <= xlarga
                      ? 70
                      : //probado
                      medidaReferenciaAlto <= xxlarga
                          ? 80
                          : medidaReferenciaAlto <= xxxlarga
                              ? 110
                              : //probado
                              medidaReferenciaAlto <= xxxxlarga
                                  ? 120
                                  : medidaReferenciaAlto <= xxxxxlarga
                                      ? 130
                                      : medidaReferenciaAlto <= xxxxxxlarga
                                          ? 180
                                          : 90;
  return medida;
}

radius(context) {
  medidaReferenciaAlto = MediaQuery.of(context).size.height;
  double medida = medidaReferenciaAlto <= xpequenna
      ? 30
      : medidaReferenciaAlto < pequenna
          ? 20
          : //probado
          medidaReferenciaAlto < mediana
              ? 30
              : //---probado 592
              medidaReferenciaAlto <= larga
                  ? 40
                  : //probado
                  medidaReferenciaAlto <= xlarga
                      ? 50
                      : //probado
                      medidaReferenciaAlto <= xxlarga
                          ? 50
                          : medidaReferenciaAlto <= xxxlarga
                              ? 70
                              : //probado
                              medidaReferenciaAlto <= xxxxlarga
                                  ? 70
                                  : medidaReferenciaAlto <= xxxxxlarga
                                      ? 70
                                      : medidaReferenciaAlto <= xxxxxxlarga
                                          ? 100
                                          : 50;
  return medida;
}

topLoginIntro(context) {
  medidaReferenciaAlto = MediaQuery.of(context).size.height;
  print(medidaReferenciaAlto);
  double medida = MediaQuery.of(context).orientation == Orientation.portrait
      ? medidaReferenciaAlto <= xpequenna
          ? medidaReferenciaAlto * 0.08
          : medidaReferenciaAlto < pequenna
              ? medidaReferenciaAlto * 0.09
              : //probado
              medidaReferenciaAlto < mediana
                  ? medidaReferenciaAlto * 0.10
                  : //---probado 592
                  medidaReferenciaAlto <= larga
                      ? medidaReferenciaAlto * 0.12
                      : //probado
                      medidaReferenciaAlto <= xlarga
                          ? medidaReferenciaAlto * 0.13
                          : //probado
                          medidaReferenciaAlto <= xxlarga
                              ? medidaReferenciaAlto * 0.14
                              : medidaReferenciaAlto <= xxxlarga
                                  ? medidaReferenciaAlto * 0.14
                                  : //probado
                                  medidaReferenciaAlto <= xxxxlarga
                                      ? medidaReferenciaAlto * 0.14
                                      : medidaReferenciaAlto <= xxxxxlarga
                                          ? medidaReferenciaAlto * 0.14
                                          : medidaReferenciaAlto <= xxxxxxlarga
                                              ? medidaReferenciaAlto * 0.12
                                              : 0.15
      : medidaReferenciaAlto < xpequenna
          ? medidaReferenciaAlto * 0.15
          : //probado
          medidaReferenciaAlto < pequenna
              ? medidaReferenciaAlto * 0.15
              : //probado
              medidaReferenciaAlto < mediana
                  ? medidaReferenciaAlto * 0.1
                  : medidaReferenciaAlto <= larga
                      ? medidaReferenciaAlto * 0.15
                      : //establecido
                      medidaReferenciaAlto <= xlarga
                          ? medidaReferenciaAlto * 0.15
                          : medidaReferenciaAlto <= xxlarga
                              ? medidaReferenciaAlto * 0.15
                              : medidaReferenciaAlto <= xxxlarga
                                  ? medidaReferenciaAlto * 0.2
                                  : medidaReferenciaAlto <= xxxxlarga
                                      ? medidaReferenciaAlto * 0.2
                                      : medidaReferenciaAlto <= xxxxxlarga
                                          ? medidaReferenciaAlto * 0.2
                                          : medidaReferenciaAlto <= xxxxxxlarga
                                              ? medidaReferenciaAlto * 0.2
                                              : 50;
  return medida;
}

//Icono Login
iconLogin(context) {
  medidaReferenciaAncho = MediaQuery.of(context).size.width;
  medidaReferenciaAlto = MediaQuery.of(context).size.height;
  double medida = MediaQuery.of(context).orientation == Orientation.portrait
      ? medidaReferenciaAlto < xpequenna
          ? medidaReferenciaAlto * 0.3
          : medidaReferenciaAlto < pequenna
              ? medidaReferenciaAlto * 0.33
              : //probado
              medidaReferenciaAlto < mediana
                  ? medidaReferenciaAlto * 0.33
                  : //--probadao
                  medidaReferenciaAlto <= larga
                      ? medidaReferenciaAlto * 0.33
                      : //probado
                      medidaReferenciaAlto <= xlarga
                          ? medidaReferenciaAlto * 0.33
                          : //probado
                          medidaReferenciaAlto <= xxlarga
                              ? medidaReferenciaAlto * 0.33
                              : medidaReferenciaAlto <= xxxlarga
                                  ? medidaReferenciaAlto * 0.33
                                  : //probado
                                  medidaReferenciaAlto <= xxxxlarga
                                      ? medidaReferenciaAlto * 0.33
                                      : medidaReferenciaAlto <= xxxxxlarga
                                          ? medidaReferenciaAlto * 0.33
                                          : medidaReferenciaAlto <= xxxxxxlarga
                                              ? medidaReferenciaAlto * 0.33
                                              : 50
      : medidaReferenciaAlto < xpequenna
          ? medidaReferenciaAlto * 0.45
          : //probado
          medidaReferenciaAlto < pequenna
              ? medidaReferenciaAlto * 0.4
              : //probado
              medidaReferenciaAlto < mediana
                  ? medidaReferenciaAlto * 0.4
                  : medidaReferenciaAlto <= larga
                      ? medidaReferenciaAlto * 0.45
                      : //probado
                      medidaReferenciaAlto <= xlarga
                          ? medidaReferenciaAlto * 0.35
                          : medidaReferenciaAlto <= xxlarga
                              ? medidaReferenciaAlto * 0.4
                              : medidaReferenciaAlto <= xxxlarga
                                  ? medidaReferenciaAlto * 0.4
                                  : medidaReferenciaAlto <= xxxxlarga
                                      ? medidaReferenciaAlto * 0.4
                                      : medidaReferenciaAlto <= xxxxxlarga
                                          ? medidaReferenciaAlto * 0.4
                                          : medidaReferenciaAlto <= xxxxxxlarga
                                              ? medidaReferenciaAlto * 0.45
                                              : 50;

  //print(medida);
  return medida;
}

paddingAll(context) {
  medidaReferenciaAncho = MediaQuery.of(context).size.width;
  medidaReferenciaAlto = MediaQuery.of(context).size.height;

  double medida = medidaReferenciaAlto < xpequenna
      ? 3
      : medidaReferenciaAlto < pequenna
          ? 5
          : medidaReferenciaAlto < mediana
              ? 5
              : medidaReferenciaAlto <= larga
                  ? 6
                  : medidaReferenciaAlto <= xlarga
                      ? 7
                      : medidaReferenciaAlto <= xxlarga
                          ? 8
                          : medidaReferenciaAlto <= xxxlarga
                              ? 10
                              : medidaReferenciaAlto <= xxxxlarga
                                  ? 12
                                  : medidaReferenciaAlto <= xxxxxlarga
                                      ? 10
                                      : //establecido
                                      medidaReferenciaAlto <= xxxxxxlarga
                                          ? 15
                                          : 15;

  /*MediaQuery.of(context).orientation==  Orientation.portrait? 
                medidaReferencia>=1000?15:medidaReferencia>=600?7:medidaReferencia>=400?5:3:
                medidaReferencia>=1000?25:medidaReferencia>=600?15:medidaReferencia>=400?5:3;*/
  return medida;
}

letraTextoTamanno(context) {
  medidaReferenciaAlto = MediaQuery.of(context).size.height;
  //print(medidaReferenciaAlto);
  double medida = MediaQuery.of(context).orientation == Orientation.portrait
      ? medidaReferenciaAlto < xpequenna
          ? 13
          : //probado
          medidaReferenciaAlto < pequenna
              ? 13
              : //probado
              medidaReferenciaAlto < mediana
                  ? 13
                  : medidaReferenciaAlto < 540
                      ? 13
                      : //probado
                      medidaReferenciaAlto <= larga
                          ? 13
                          : //--
                          medidaReferenciaAlto <= xlarga
                              ? 13
                              : //Probado 640
                              medidaReferenciaAlto <= xxlarga
                                  ? 15
                                  : medidaReferenciaAlto <= xxxlarga
                                      ? 17
                                      : //establecido
                                      medidaReferenciaAlto <= xxxxlarga
                                          ? 19
                                          : medidaReferenciaAlto <= xxxxxlarga
                                              ? 22
                                              : medidaReferenciaAlto <=
                                                      xxxxxxlarga
                                                  ? 25
                                                  : 20
      : medidaReferenciaAlto < xpequenna
          ? 13
          : //probado
          medidaReferenciaAlto < pequenna
              ? 13
              : //probado
              medidaReferenciaAlto < mediana
                  ? 13
                  : medidaReferenciaAlto < 540
                      ? 13
                      : //probado
                      medidaReferenciaAlto <= larga
                          ? 17
                          : //--
                          medidaReferenciaAlto <= xlarga
                              ? 17
                              : //Probado
                              medidaReferenciaAlto <= xxlarga
                                  ? 19
                                  : medidaReferenciaAlto <= xxxlarga
                                      ? 19
                                      : //establecido
                                      medidaReferenciaAlto <= xxxxlarga
                                          ? 20
                                          : medidaReferenciaAlto <= xxxxxlarga
                                              ? 21
                                              : medidaReferenciaAlto <=
                                                      xxxxxxlarga
                                                  ? 22
                                                  : 20;
  /* MediaQuery.of(context).orientation==  Orientation.portrait?
                medidaReferencia>=1000?30:medidaReferencia>=600?15:medidaReferencia>=400?15:13:
                medidaReferencia>=1000?31:medidaReferencia>=600?18:medidaReferencia>=400?16:14;*/

  return medida;
}

tamannoIcono(context) {
  medidaReferenciaAlto = MediaQuery.of(context).size.height;
  
  double medida = MediaQuery.of(context).orientation == Orientation.portrait
      ? medidaReferenciaAlto < xpequenna
          ? 19
          : medidaReferenciaAlto < pequenna
              ? 20
              : //probado
              medidaReferenciaAlto < mediana
                  ? 20
                  : medidaReferenciaAlto <= larga
                      ? 20
                      : medidaReferenciaAlto <= xlarga
                          ? 20
                          : //probado 640
                          medidaReferenciaAlto <= xxlarga
                              ? 22
                              : medidaReferenciaAlto <= xxxlarga
                                  ? 27
                                  : //probadp 913
                                  medidaReferenciaAlto <= xxxxlarga
                                      ? 27
                                      : medidaReferenciaAlto <= xxxxxlarga
                                          ? 30
                                          : medidaReferenciaAlto <= xxxxxxlarga
                                              ? 27
                                              : 27
      : medidaReferenciaAlto < xpequenna
          ? 18
          : //probado
          medidaReferenciaAlto < pequenna
              ? 20
              : //probada
              medidaReferenciaAlto < mediana
                  ? 20
                  : medidaReferenciaAlto <= larga
                      ? 23
                      : medidaReferenciaAlto <= xlarga
                          ? 23
                          : medidaReferenciaAlto <= xxlarga
                              ? 23
                              : medidaReferenciaAlto <= xxxlarga
                                  ? 23
                                  : medidaReferenciaAlto <= xxxxlarga
                                      ? 23
                                      : medidaReferenciaAlto <= xxxxxlarga
                                          ? 23
                                          : medidaReferenciaAlto <= xxxxxxlarga
                                              ? 23
                                              : 23;
  /*
                medidaReferencia>=1000?30:medidaReferencia>=600?25:medidaReferencia>=400?20:18:
                medidaReferencia>=1000?25:medidaReferencia>=600?20:medidaReferencia>=400?15:13;*/
  return medida;
}

sizedBox(context) {
  medidaReferenciaAlto = MediaQuery.of(context).size.height;
  double medida = medidaReferenciaAlto < xpequenna
      ? 5
      : //probado 320 hor
      medidaReferenciaAlto < pequenna
          ? 7
          : medidaReferenciaAlto < mediana
              ? 7
              : medidaReferenciaAlto <= larga
                  ? 7
                  : medidaReferenciaAlto <= xlarga
                      ? 7
                      : //probado 640 v
                      medidaReferenciaAlto <= xxlarga
                          ? 8
                          : medidaReferenciaAlto <= xxxlarga
                              ? 8
                              : medidaReferenciaAlto <= xxxxlarga
                                  ? 20
                                  : medidaReferenciaAlto <= xxxxxlarga
                                      ? 25
                                      : medidaReferenciaAlto <= xxxxxxlarga
                                          ? 30
                                          : 35;
  /* MediaQuery.of(context).orientation==  Orientation.portrait? 
                medidaReferencia>=1000?25:medidaReferencia>=600?20:medidaReferencia>=400?15:10:
                medidaReferencia>=1000?20:medidaReferencia>=600?15:medidaReferencia>=400?10:5;*/
 
  return medida;
}

creditContent(context) {
  //medidaReferenciaAlto = MediaQuery.of(context).size.height;

  double medida = medidaReferenciaAlto < xpequenna
      ? 5
      : //probado 320 hor
      medidaReferenciaAlto < pequenna
          ? medidaReferenciaAlto * .40
          : medidaReferenciaAlto < mediana
              ? medidaReferenciaAlto * .40
              : medidaReferenciaAlto <= larga
                  ? medidaReferenciaAlto * .85
                  : medidaReferenciaAlto <= xlarga
                      ? medidaReferenciaAlto * .40
                      : //probado 640 v
                      medidaReferenciaAlto <= xxlarga
                          ? medidaReferenciaAlto * .40
                          : medidaReferenciaAlto <= xxxlarga
                              ? medidaReferenciaAlto * .35
                              : medidaReferenciaAlto <= xxxxlarga
                                  ? medidaReferenciaAlto * .35
                                  : medidaReferenciaAlto <= xxxxxlarga
                                      ? medidaReferenciaAlto * .35
                                      : medidaReferenciaAlto <= xxxxxxlarga
                                          ? medidaReferenciaAlto * .35
                                          : medidaReferenciaAlto * .35;
  /* MediaQuery.of(context).orientation==  Orientation.portrait? 
                medidaReferencia>=1000?25:medidaReferencia>=600?20:medidaReferencia>=400?15:10:
                medidaReferencia>=1000?20:medidaReferencia>=600?15:medidaReferencia>=400?10:5;*/
  return medida;
}

topContent(context) {
  double medida = medidaReferenciaAlto < xpequenna
      ? 5
      : //probado 320 hor
      medidaReferenciaAlto < pequenna
          ? medidaReferenciaAlto * .42
          : medidaReferenciaAlto < mediana
              ? medidaReferenciaAlto * .40
              : medidaReferenciaAlto <= larga
                  ? medidaReferenciaAlto * .35 //588
                  : medidaReferenciaAlto <= xlarga
                      ? medidaReferenciaAlto * .30
                      : //por defecto 30
                      medidaReferenciaAlto <= xxlarga
                          ? medidaReferenciaAlto * .30
                          : medidaReferenciaAlto <= xxxlarga
                              ? medidaReferenciaAlto * .28
                              : medidaReferenciaAlto <= xxxxlarga
                                  ? medidaReferenciaAlto * .32
                                  : medidaReferenciaAlto <= xxxxxlarga
                                      ? medidaReferenciaAlto * .35
                                      : medidaReferenciaAlto <= xxxxxxlarga
                                          ? medidaReferenciaAlto * .35
                                          : medidaReferenciaAlto * .25;
  /* MediaQuery.of(context).orientation==  Orientation.portrait? 
                medidaReferencia>=1000?25:medidaReferencia>=600?20:medidaReferencia>=400?15:10:
                medidaReferencia>=1000?20:medidaReferencia>=600?15:medidaReferencia>=400?10:5;*/
  return medida;
}

heightContent(context) {
  //medidaReferenciaAlto = MediaQuery.of(context).size.height;

  double medida = medidaReferenciaAlto < xpequenna
      ? 60
      : //probado 320 hor
      medidaReferenciaAlto < pequenna
          ? medidaReferenciaAlto * .50
          : medidaReferenciaAlto < mediana
              ? medidaReferenciaAlto * .50
              : medidaReferenciaAlto <= larga
                  ? medidaReferenciaAlto * .40
                  : medidaReferenciaAlto <= xlarga
                      ? medidaReferenciaAlto * .38
                      : //probado 640 v
                      medidaReferenciaAlto <= xxlarga
                          ? medidaReferenciaAlto * .35
                          : medidaReferenciaAlto <= xxxlarga
                              ? medidaReferenciaAlto * .35
                              : medidaReferenciaAlto <= xxxxlarga
                                  ? medidaReferenciaAlto * .35
                                  : medidaReferenciaAlto <= xxxxxlarga
                                      ? medidaReferenciaAlto * .35
                                      : medidaReferenciaAlto <= xxxxxxlarga
                                          ? medidaReferenciaAlto * .35
                                          : medidaReferenciaAlto * .35;
  /* MediaQuery.of(context).orientation==  Orientation.portrait? 
                medidaReferencia>=1000?25:medidaReferencia>=600?20:medidaReferencia>=400?15:10:
                medidaReferencia>=1000?20:medidaReferencia>=600?15:medidaReferencia>=400?10:5;*/
  return medida;
}

heightCard(context) {
  //medidaReferenciaAlto = MediaQuery.of(context).size.height;

  double medida = medidaReferenciaAlto < xpequenna
      ? 80
      : //probado 320 hor
      medidaReferenciaAlto < pequenna
          ? 70
          : medidaReferenciaAlto < mediana
              ? 80
              : medidaReferenciaAlto <= larga
                  ? 80
                  : medidaReferenciaAlto <= xlarga
                      ? 80
                      : //probado 640 v
                      medidaReferenciaAlto <= xxlarga
                          ? 80
                          : medidaReferenciaAlto <= xxxlarga //probado en 887
                              ? 120
                              : medidaReferenciaAlto <= xxxxlarga
                                  ? 125
                                  : medidaReferenciaAlto <= xxxxxlarga
                                      ? 150
                                      : medidaReferenciaAlto <= xxxxxxlarga
                                          ? 180
                                          : 80;
  /* MediaQuery.of(context).orientation==  Orientation.portrait? 
                medidaReferencia>=1000?25:medidaReferencia>=600?20:medidaReferencia>=400?15:10:
                medidaReferencia>=1000?20:medidaReferencia>=600?15:medidaReferencia>=400?10:5;*/
  return medida;
}

letraBarTamanno(context) {
  medidaReferenciaAlto = MediaQuery.of(context).size.height;
  double medida = medidaReferenciaAlto < xpequenna
      ? 18
      : medidaReferenciaAlto < pequenna
          ? 18
          : medidaReferenciaAlto < mediana
              ? 18
              : medidaReferenciaAlto <= larga
                  ? 19
                  : //probado
                  medidaReferenciaAlto <= xlarga
                      ? 19
                      : //probado
                      medidaReferenciaAlto <= xxlarga
                          ? 20
                          : medidaReferenciaAlto <= xxxlarga
                              ? 21
                              : //probadp 913
                              medidaReferenciaAlto <= xxxxlarga
                                  ? 21
                                  : medidaReferenciaAlto <= xxxxxlarga
                                      ? 21
                                      : medidaReferenciaAlto <= xxxxxxlarga
                                          ? 30
                                          : 20;

  /*medidaReferencia>=1000?24:medidaReferencia>=600?22:medidaReferencia>=400?20:18;*/
  return medida;
}

tamannoIconoBack(context) {
  var medidaReferencia;
  medidaReferencia = MediaQuery.of(context).size.width;
  double medida = MediaQuery.of(context).orientation == Orientation.portrait
      ? medidaReferencia >= 1000
          ? 150
          : medidaReferencia >= 600 ? 140 : medidaReferencia >= 400 ? 130 : 110
      : medidaReferencia >= 1000
          ? 130
          : medidaReferencia >= 600 ? 120 : medidaReferencia >= 400 ? 110 : 90;
  return medida;
}

tammannoIconoCargando(context) {
  medidaReferenciaAlto = MediaQuery.of(context).size.height;

  double medida = MediaQuery.of(context).orientation == Orientation.portrait
      ? medidaReferenciaAlto < xpequenna
          ? 60
          : medidaReferenciaAlto < pequenna
              ? 60
              : //Probada
              medidaReferenciaAlto < mediana
                  ? 60
                  : medidaReferenciaAlto <= larga
                      ? 80
                      : //probada
                      medidaReferenciaAlto <= xlarga
                          ? 80
                          : //probada 065 640
                          medidaReferenciaAlto <= xxlarga
                              ? 90
                              : medidaReferenciaAlto <= xxxlarga
                                  ? 100
                                  : //probado en 913
                                  medidaReferenciaAlto <= xxxxlarga
                                      ? 150
                                      : medidaReferenciaAlto <= xxxxxlarga
                                          ? 150
                                          : //probada
                                          medidaReferenciaAlto <= xxxxxxlarga
                                              ? 150
                                              : 90
      : //portraint

      medidaReferenciaAlto < xpequenna
          ? 70
          : medidaReferenciaAlto < pequenna
              ? 70
              : //probada
              medidaReferenciaAlto < mediana
                  ? 70
                  : medidaReferenciaAlto <= larga
                      ? 80
                      : medidaReferenciaAlto <= xlarga
                          ? 80
                          : medidaReferenciaAlto <= xxlarga
                              ? 90
                              : medidaReferenciaAlto <= xxxlarga
                                  ? 100
                                  : medidaReferenciaAlto <= xxxxlarga
                                      ? 150
                                      : medidaReferenciaAlto <= xxxxxlarga
                                          ? 150
                                          : //probada
                                          medidaReferenciaAlto <= xxxxxxlarga
                                              ? 150
                                              : 150;
/*
 //print(medidaReferencia);
 double medida= MediaQuery.of(context).orientation==  Orientation.portrait?
                medidaReferencia>=1000?90:medidaReferencia>=600?100:medidaReferencia>=400?80:60:
                medidaReferencia>=1000?90:medidaReferencia>=600?90:medidaReferencia>=400?80:70;
 */
  return medida;
}
