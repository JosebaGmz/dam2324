import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class KTTextField extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Column column = Column(
      children: [
      Image.asset("resources/logoKity.png",width: 50,height: 50,
      ),
        Flexible(
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'HEY',
              ))
        ),
    Image.asset("resources/logoKity.png",width: 50,height: 50,)
    ],
    );
    return column;
  }
  
  
}