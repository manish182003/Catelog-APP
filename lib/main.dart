import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home.dart';
import 'package:flutter_application_1/pages/login.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:flutter_application_1/widget/theme.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(home());
}

//stl
class home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: Scaffold(
      //   appBar: AppBar(
      //     title: Text("Catelog app"),
      //   ),
      //   body: Center(
      //     child: Container(child: Text("Welcome to 30 days of flutter")),
      //   ),
      //   drawer: Drawer(),
      // ),
      themeMode: ThemeMode.light,
      theme: mytheme.lighttheme(context)
      ,darkTheme: mytheme.darktheme(context),
      initialRoute: myroutes.homeroute,
      debugShowCheckedModeBanner: false,
      routes: {
        //  "/home": (context) => home(),
        myroutes.loginroute: (context) => loginPage(),
        myroutes.homeroute: (context) => homepage()
      },
    );
  }
}
