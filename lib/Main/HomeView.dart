import 'package:flutter/material.dart';

class HomeView extends StatelessWidget{

  late BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _context = context;
    // TODO: implement build

    AppBar appBar = AppBar(
      title: const Text('Home'),
      centerTitle: true,
      shadowColor: Colors.pink,
      backgroundColor: Colors.black,
    );

    Scaffold scaf=Scaffold(appBar: appBar,);

    return scaf;
  }

  /*Column columna = Column(children: [
  Padding (padding: EdgeInsets.symmetric(horizontal: 0,vertical: 10),
      child: Text("Bienvenido a Kyty Login",style: TextStyle(fontSize: 25)
  ),
  ),
  ],);*/

}