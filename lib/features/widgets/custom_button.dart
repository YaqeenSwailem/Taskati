import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:traning/core/colors.dart';

class CustomButton extends StatelessWidget {

   final String text ;


  const CustomButton({
    super.key,
    required this.text ,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton( onPressed:(){},
    child: Text(text),
    
     style :ElevatedButton.styleFrom(
      backgroundColor: AppColor.mainColor,
      foregroundColor: Colors.white,
      shape:RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        
      ),
    ),
    );
    
    

  }
}