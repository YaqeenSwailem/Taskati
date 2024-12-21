// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:traning/core/colors.dart';
import 'package:traning/features/functions/navigations.dart';
import 'package:traning/screens/upload_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3), () {
      navigate(context, UploadScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            Lottie.asset('./assets/logo.json' , width:200 , height:200 ),

            Text("Taskati" , 
             style:TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
              color: AppColor.mainColor,
             )
            ),
          ],
        ),
      ), // End Center widget
    );
  }
}
