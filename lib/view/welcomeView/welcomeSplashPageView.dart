import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_fit/view/welcomeView/welcomeSwipePage.dart';

class welcomeSplashPageView extends StatelessWidget {
  const welcomeSplashPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Timer(
        Duration(seconds: 3),
            () =>
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => welcomeSwipePage())));

    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 1,
          width: MediaQuery.of(context).size.width * 1,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/welcome1.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          child: Padding(
            padding: EdgeInsets.only(left: 30,right: 40,bottom: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome to",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Alata'),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Image.asset(
                      "assets/images/HelloEmoji.png",
                      scale: 3.6,
                    )
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.005,
                ),
                Row(
                  children: [
                    Text(
                      "Go",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 70,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Alata'),
                    ),

                    Text(
                      "fit",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 70,
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Alata'),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.02,
                ),

                Text(
                  "The best fitness app in this century to accompany your sports.",
                  style: TextStyle(
                    fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.5,
                      fontFamily: 'Alata'),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
