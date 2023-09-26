import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget{

  late BuildContext _context;

  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwdController = TextEditingController();

  SnackBar snackBar = SnackBar(
      content: Text('Yay! A snackBar')
  );

  void onClickRegsitrar(){

    Navigator.of(_context).pushNamed("/registerview");

  }

  Future<void> onClickIniciarSesion() async {

    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwdController.text
      );
      print("DEBUG>>>>> logea");
      Navigator.of(_context).pushNamed("/homeview");


    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        ScaffoldMessenger.of(_context).showSnackBar(snackBar);
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        ScaffoldMessenger.of(_context).showSnackBar(snackBar);
      }
    }

  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    // TODO: implement build
    //Text texto=Text("Hola Mundo desde Kyty");
    //return texto;


    Column columna = Column(children: [
      Padding (padding: EdgeInsets.symmetric(horizontal: 0,vertical: 10),
        child: Text("Bienvenido a Kyty Login",style: TextStyle(fontSize: 25)
        ),
      ),

      Padding(padding: EdgeInsets.symmetric(horizontal: 60, vertical: 16),
        child: TextField(
          controller: emailController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Escribe tu usuario',
          ),
        ),
      ),

      Padding(padding: EdgeInsets.symmetric(horizontal: 60, vertical: 16),
        child: TextFormField(
          controller: passwdController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Escribe tu password',
          ),
          obscureText: true,
        ),
      ),
      Row(mainAxisAlignment: MainAxisAlignment.center,
        children: [
        TextButton(onPressed: onClickIniciarSesion, child: Text("Iniciar Sesion"),),
        TextButton( onPressed: onClickRegsitrar, child: Text("REGISTRO"),)
      ],)

        
    ],);

    AppBar appBar = AppBar(
      title: const Text('Login'),
      centerTitle: true,
      shadowColor: Colors.pink,
      backgroundColor: Colors.black,
    );

    Scaffold scaf=Scaffold(body: columna,
      //backgroundColor: Colors.deepOrange,
    appBar: appBar,);

    return scaf;
  }

}