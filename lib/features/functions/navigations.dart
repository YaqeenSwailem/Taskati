import 'package:flutter/material.dart';

navigate (BuildContext context , Widget newScreen){
Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) {
          return newScreen;
        }),
      );
}









