//import '../pages/menu/prueba_page.dart';
import '.././widgets/alert/alert_dialogo.dart';

import '../service/menuService/credit_simulator_service.dart';

import 'menu_pages/credit_simulator_page.dart';

import '../pages/Account/account_page.dart';
import 'package:provider/provider.dart';

import '../util/colores.dart';
//import '../widgets/alert_dialogo.dart';
import 'package:flutter/material.dart';
//import 'Cuenta/consulta_cuenta.dart';

class DrawerItem {
  String title;
  String titleLong;
  IconData icon;
  DrawerItem(this.title, this.titleLong, this.icon);
}

class HomePage extends StatefulWidget {
  final drawerItems = [
    DrawerItem("Mi Cuenta", 'Tu Estado de Cuenta', Icons.home),
    DrawerItem("Simulador", 'Simulador de Crédito', Icons.computer),
    DrawerItem("Noticias", 'Noticias', Icons.public),
    DrawerItem("Notificaciones", 'Notificaciones', Icons.notifications),
  ];

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedDrawerIndex = 0;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return AccountPage();
      case 1:
        return CreditSimulatorPage();
      case 2:
        return Container(
          child: Center(
            child: ListTile(
                title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.orange,
                    child: Center(
                        child: Icon(Icons.pan_tool, color: Colors.white)),
                  ),
                ),
                SizedBox(height: sizedBox(context)),
                Center(
                    child: Text(
                  'En construcción ...',
                  style: TextStyle(color: Colors.orange),
                )),
              ],
            )),
          ),
        );
      case 3:
        return Container(
          child: Center(
            child: ListTile(
                title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.orange,
                    child: Center(
                        child: Icon(Icons.pan_tool, color: Colors.white)),
                  ),
                ),
                SizedBox(height: sizedBox(context)),
                Center(
                    child: Text(
                  'En construcción ...',
                  style: TextStyle(color: Colors.orange),
                )),
              ],
            )),
          ),
        );

      default:
        return Text("Error");
    }
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
    if (Provider.of<CreditSimulatorService>(context, listen: false).getValor !=
        '\$ 0,00') {
      Provider.of<CreditSimulatorService>(context, listen: false).restar();
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> drawerOptions = [];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(ListTile(
          title: Card(
            color: i == _selectedDrawerIndex ? primaryColor : Colors.white,
            elevation: 5,
            child: buildMenuItem(_selectedDrawerIndex, d.icon, d.title,
                opacity: 1.0,
                color: i == _selectedDrawerIndex ? Colors.white : primaryColor),
          ),
          selected: i == _selectedDrawerIndex,
          onTap: () => WidgetsBinding.instance.addPostFrameCallback((_) {
                _onSelectItem(i);
              })));
    }
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
          iconTheme: IconThemeData(color: Colors.white),
          actions: [
            IconButton(
                color: Colors.white,
                icon: Icon(
                  Icons.exit_to_app,
                  size: tamannoIcono(context),
                ),
                onPressed: () => mostrarDialogoCerrar(context)),
          ],
          centerTitle: true,
          backgroundColor: primaryColor,
          elevation: 0.0,
          title: Text(
            widget.drawerItems[_selectedDrawerIndex].titleLong,
            style: TextStyle(
              fontSize: letraBarTamanno(context),
              color: Colors.white,
              fontFamily: 'berlin',
            ),
          )),
      drawer: 
                   Container(
                     decoration: BoxDecoration(
                       color: Colors.white,
                       borderRadius: BorderRadius.only(
                         topRight: Radius.circular(50),
                         bottomRight: Radius.circular(50),
                       )
                     ),
                     width: menuSize(context),
                     
                     child: Center(
                       child: ListView(
                         shrinkWrap: true,
                        children: <Widget>[
                          FlatButton.icon(
                            icon: Icon(
                              Icons.arrow_back,
                              color: primaryColor,
                            ),
                            onPressed: null,
                            label: Text("Volver",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: letraTextoTamanno(context),
                                    color: Colors.black)),
                            color: Colors.black,
                          ),
                          Column(children: drawerOptions),
                          Padding(
                            padding: EdgeInsets.only(
                                top: paddingAll(context),
                                bottom: paddingAll(context)),
                            child: GestureDetector(
                              onTap: () => mostrarDialogoCerrar(context),
                              child: Card(
                                color: Color.fromRGBO(35, 182, 116, 0.5),
                                child: Padding(
                                  padding: EdgeInsets.all(paddingAll(context)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        Icons.exit_to_app,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: sizedBox(context),
                                      ),
                                      Text('Salir',
                                          style: TextStyle(color: Colors.white, fontSize: letraTextoTamanno(context)))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                  
                
      ),
                     ),
                   ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }

  Opacity buildMenuItem(int selected, IconData icon, String title,
      {double opacity = 0.3, Color color = Colors.black}) {
    return Opacity(
      opacity: opacity,
      child: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            Icon(
              icon,
              size: 35.0,
              color: color,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(title,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: letraTextoTamanno(context) ,
                    color: color)),
            SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}
