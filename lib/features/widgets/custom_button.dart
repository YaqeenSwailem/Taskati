import 'package:flutter/material.dart';
import 'package:traning/core/colors.dart';

class CustomButton extends StatelessWidget {

   final String text ;
   final Color? bgColor ;
   final Color? textColor ;
   final Function onPressed ;
   final double widget ;
   final double height ;

  const CustomButton({
    super.key,
    required this.text ,
    required this.onPressed ,
    this.widget = 250 ,
    this.height = 45,
    this.bgColor,
    this.textColor ,
  });

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: widget,
      height: height,
      child: ElevatedButton( onPressed:(){},

       style :ElevatedButton.styleFrom(
        backgroundColor: bgColor ?? AppColor.mainColor,
        foregroundColor: textColor ?? Colors.white,
        shape:RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          
        ),
      ),
      child: Text(text),
      ),
    );
    
    

  }
}