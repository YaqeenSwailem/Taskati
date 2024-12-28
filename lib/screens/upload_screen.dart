// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:traning/core/colors.dart';
import 'package:traning/features/functions/navigations.dart';
import 'package:traning/features/widgets/custom_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:traning/screens/home_screen.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  final ImagePicker picker = ImagePicker();
  String? path;
  var nameController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(onPressed: (){
            if (formKey.currentState!.validate() && path!=null) {
             navigate(context , HomeScreen());
            } else if (path== null){
             showDialog(context: context, builder: (context) {
              return AlertDialog (
                title: Text("Error" , 
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: AppColor.mainColor,
                ),),
                content: Text("Please choose an image"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("OK"),
                  ),
                ],
                
              );
             });
            }
          }, child:Text ("Done" , 
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: AppColor.mainColor,
          ),)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 70,
                backgroundImage: path != null
                    ? FileImage(File(path!))
                    : NetworkImage("http://picsum.photos/200"),
              ),
              SizedBox(
                height: 30,
              ),
              CustomButton(
                text: "Upload From Camera",
                onPressed: () async {
                  await picker
                      .pickImage(source: ImageSource.camera)
                      .then((value) {
                    if (value != null) {
                      setState(() {
                        path = value.path;
                      });
                    }
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              CustomButton(
                text: "Upload From Gallery",
                onPressed: () async {
                  await picker
                      .pickImage(source: ImageSource.gallery)
                      .then((value) {
                    if (value != null) {
                      setState(() {
                        path = value.path;
                      });
                    }
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
             
              Divider( 
                color: AppColor.mainColor,
                indent: 20,
                endIndent: 20,
                thickness: 2, 
              ),
              
              SizedBox(height: 10,),
              
              Form(
                key: formKey,
                child: TextFormField(
                  controller: nameController,
                  validator: (value) {
                    if (value!.isEmpty){
                      return "Name is required ";
                    }else if (RegExp('^[A-Z][a-z]{2,8}').hasMatch(value)){
                      return "min is 3";
                    }
                    return null;
                  },
                 
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter your name ... ",
                    enabledBorder: OutlineInputBorder(
                     borderRadius:BorderRadius.circular(10),
                     borderSide: BorderSide(color:AppColor.mainColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                     borderRadius:BorderRadius.circular(10),
                     borderSide: BorderSide(color:AppColor.mainColor),
                    ),
                  ),
                ),
              ),
        
            ],
          ),
        ),
      ),
    );
  }
}
