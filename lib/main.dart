import 'package:country_code_picker/country_code_picker.dart';
import 'package:country_code_picker/country_localizations.dart';
import 'package:flutter/material.dart';
import 'package:go_fit/view/CreateAccountPageView.dart';
import 'package:go_fit/view/LoginPageView.dart';
import 'package:go_fit/view/forgotPasswordOnePageView.dart';
import 'package:go_fit/view/forgotPasswordThreePageView.dart';
import 'package:go_fit/view/forgotPasswordTwoPageView.dart';
import 'package:go_fit/view/welcomeView/personalInformationView/fillYourProfileView.dart';
import 'package:go_fit/view/welcomeView/welcomeSplashPageView.dart';
import 'package:go_fit/view/welcomeView/welcomeView.dart';

//void main(){
 // runApp(MaterialApp(
   // debugShowCheckedModeBanner: false,
    //home: welcomeSplashPageView(),
  //));
//}


// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home:
    //fillYourProfileView()
    //welcomeView()
    //CreateAccountPageView()
    //ForgotPasswordOnePageView()
    //forgotPasswordTwoView()
    ForgotPasswordThreePageView()
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return

       Scaffold(
       body: Center(child: Container(height: 250,width: 250,
       child: Center(child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Text("TestPro"),
           Text("Description.......")
         ],
       ),),
       decoration: BoxDecoration(

shape: BoxShape.rectangle,         color:Colors.grey[300],
         boxShadow: [

           BoxShadow(
             color: Colors.grey.shade500,
             offset: Offset(4.0,4.0),
             blurRadius: 15.0,
             spreadRadius: 1.0
           ),
           BoxShadow(
             color: Colors.white,
             offset: Offset(-4.0,-4.0),
             blurRadius: 15.0,
             spreadRadius: 1.0
           )
         ]
       ),))
      );

  }
}
