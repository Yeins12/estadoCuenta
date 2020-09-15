import './pages/Login/login_intro_page.dart';
import './service/login_service.dart';
import './service/menuService/credit_simulator_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'pages/home_page.dart';
import 'pages/splash_screen_page.dart';
import 'util/colores.dart';

void main() {
  runApp(CuentaVirtualV1());
}

class CuentaVirtualV1 extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    /*
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.white, systemNavigationBarColor: Colors.white));*/
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  statusBarColor: primaryColor
));

    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: LoginService(),
          ),
          ChangeNotifierProvider.value(
            value: CreditSimulatorService(),
          ),
        ],
        child: Consumer<LoginService>(
          builder: (context, login, _) => MaterialApp(
            localizationsDelegates: [
              GlobalCupertinoLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: [
              const Locale('es'),
              const Locale('en'),
            ],
            locale: const Locale('es'),
            theme: ThemeData(
              colorScheme: ColorScheme.light(primary: primaryColor),
              primaryColor: primaryColor,
              accentColor: Colors.orange,
              buttonColor: primaryColor,
            ),
            debugShowCheckedModeBanner: false,
            home: login.isLogin
                ? HomePage()
                : FutureBuilder(
                    future: login.tryAutoLogin(),
                    builder: (context, loginResultSnapshot) =>
                        loginResultSnapshot.connectionState ==
                                ConnectionState.waiting
                            ? SplashScreen()
                            : LoginIntroPage()),
          ),
        ));
  }
}
