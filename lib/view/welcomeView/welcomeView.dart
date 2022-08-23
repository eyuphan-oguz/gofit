import 'package:flutter/material.dart';
import 'package:go_fit/view/welcomeView/personalInformationView/selectionAgeView.dart';
import 'package:go_fit/view/welcomeView/personalInformationView/selectionGenderView.dart';
import 'package:go_fit/view/welcomeView/welcomeSplashPageView.dart';

class welcomeView extends StatefulWidget {
  const welcomeView({Key? key}) : super(key: key);

  @override
  _welcomeViewState createState() => _welcomeViewState();
}

class _welcomeViewState extends State<welcomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: welcomeSplashPageView(),
    );
  }
}
