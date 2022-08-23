import 'package:flutter/material.dart';
import 'package:go_fit/model/personalChocesModel.dart';
import 'package:go_fit/view/welcomeView/personalInformationView/selectionAgeView.dart';
import 'package:go_fit/view/welcomeView/personalInformationView/selectionGenderView.dart';
import 'package:go_fit/view/welcomeView/personalInformationView/selectionGoalView.dart';
import 'package:go_fit/view/welcomeView/personalInformationView/selectionWeightView.dart';
import 'package:numberpicker/numberpicker.dart';

class selectionHeightView extends StatefulWidget {
  const selectionHeightView({Key? key}) : super(key: key);

  @override
  _selectionHeightViewState createState() => _selectionHeightViewState();
}

class _selectionHeightViewState extends State<selectionHeightView> {
  int _currentValue = 145;
  int _minValue = 140;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Column(
                children: [
                  Text("What is Your Height?",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 30),),
                  SizedBox(height: 24,),
                  Text("Height in cm. Don't worry, you can always",style: TextStyle(fontSize: 15)),
                  Text("change it later.",style: TextStyle(fontSize: 15)),
                ],
              ),
              Center(
                child: NumberPicker(
                  selectedTextStyle: TextStyle(color:Color(0xFF6842FF),fontSize: 50,fontWeight: FontWeight.bold ),
                  textStyle: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.grey,),
                  value: _currentValue,
                  minValue: _minValue,
                  itemCount: 7,
                  itemHeight: MediaQuery.of(context).size.height*0.09,
                  decoration:const BoxDecoration(
                    border: Border(
                      bottom: BorderSide( //                   <--- left side
                        color: Color(0xFF6842FF),
                        width: 3.0,
                      ),
                      top: BorderSide( //                    <--- top side
                        color: Color(0xFF6842FF),
                        width: 3.0,
                      ),
                    ),
                  ),
                  maxValue: 220,
                  onChanged: (value) => setState(() {
                    _currentValue = value;
                      personalChoces.height=_currentValue;
                  }),
                ),
              ),
              // Text('Current value: $_currentValue'),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24,vertical: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height *0.07,
                      width: MediaQuery.of(context).size.width*0.4,

                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(MaterialPageRoute(
                                builder: (BuildContext context) => selectionWeightView()));
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFFF0ECFF),
                            shape: StadiumBorder(),
                          ),
                          child: Text("Back",style: TextStyle(color: Color(0xFF8B6DFF)),)),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                    Container(
                      height: MediaQuery.of(context).size.height *0.07,
                      width: MediaQuery.of(context).size.width*0.4,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(MaterialPageRoute(
                                builder: (BuildContext context) => selectionGoalView()));
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF6842FF),
                            shape: StadiumBorder(),
                          ),
                          child: Text("Continue")),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
