import 'package:flutter/material.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/utils/routes.dart';
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
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          fontFamily: GoogleFonts.lato().fontFamily),
      initialRoute: myroutes.homeroute,
      routes: {
        //  "/home": (context) => home(),
        myroutes.loginroute: (context) => loginPage(),
        myroutes.homeroute: (context) => homepage()
      },
    );
  }
}
