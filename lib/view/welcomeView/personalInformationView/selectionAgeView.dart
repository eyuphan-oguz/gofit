import 'package:flutter/material.dart';
import 'package:go_fit/model/personalChocesModel.dart';
import 'package:go_fit/view/welcomeView/personalInformationView/selectionGenderView.dart';
import 'package:go_fit/view/welcomeView/personalInformationView/selectionWeightView.dart';
import 'package:numberpicker/numberpicker.dart';

class selectionAgeView extends StatefulWidget {
  const selectionAgeView({Key? key}) : super(key: key);

  @override
  _selectionAgeViewState createState() => _selectionAgeViewState();
}

class _selectionAgeViewState extends State<selectionAgeView> {
  int _currentValue = 15;
  int _minValue = 10;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

         Column(
           children: [
             Text("How Old Are You?",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 30),),
             SizedBox(height: 24,),
             Text("Age in years. This will help us to personalize",style: TextStyle(fontSize: 15)),
             Text("an exercise program plan that suits you.",style: TextStyle(fontSize: 15)),
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
              maxValue: 100,
              onChanged: (value) => setState((){
                _currentValue = value;
                personalChoces.age=_currentValue;
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
                            builder: (BuildContext context) => selectionGenderView()));
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
                            builder: (BuildContext context) => selectionWeightView()));
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
