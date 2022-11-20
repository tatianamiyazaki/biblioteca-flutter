import 'package:biblioteca/screens/dashboard.dart';
import 'package:flutter/material.dart';

import 'database/app_database.dart';

void main() {
  runApp(
    Biblioteca(),
  );
  findAll().then(
    (livros) => debugPrint(
      livros.toString(),
    ),
  );
}

class Biblioteca extends StatelessWidget{
  @override
      Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xff000000),
          brightness: Brightness.light,
          primary: Color(0xff1e38a7),
          secondary: Color(0xff1e38a7),
        ),
      ),
      home: Dashboard(),
    );
  }
    
  

}
