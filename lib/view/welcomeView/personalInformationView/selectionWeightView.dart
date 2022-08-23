import 'package:flutter/material.dart';
import 'package:go_fit/model/personalChocesModel.dart';
import 'package:go_fit/view/welcomeView/personalInformationView/selectionAgeView.dart';
import 'package:go_fit/view/welcomeView/personalInformationView/selectionGenderView.dart';
import 'package:go_fit/view/welcomeView/personalInformationView/selectionHeightView.dart';
import 'package:numberpicker/numberpicker.dart';

class selectionWeightView extends StatefulWidget {
  const selectionWeightView({Key? key}) : super(key: key);

  @override
  _selectionWeightViewState createState() => _selectionWeightViewState();
}

class _selectionWeightViewState extends State<selectionWeightView> {
  int _currentValue = 50;
  int _minValue = 40;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Column(
                children: [
                  Text("What is Your Weight?",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 30),),
                  SizedBox(height: 24,),
                  Text("Weight in kg. Don't worry, you can always",style: TextStyle(fontSize: 15)),
                  Text("change it later.",style: TextStyle(fontSize: 15)),
                ],
              ),
              Column(
                children: [
                  NumberPicker(
                    selectedTextStyle: TextStyle(color:Color(0xFF6842FF),fontSize: 50,fontWeight: FontWeight.bold ),
                    textStyle: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.grey,),
                    value: _currentValue,
                    minValue: _minValue,
                    axis: Axis.horizontal,
                    itemCount: 3,
                    itemHeight: MediaQuery.of(context).size.height*0.09,
                    maxValue: 200,
                    onChanged: (value) => setState(() {
                      _currentValue = value;
                      personalChoces.weight;
                    }),
                  ),
                  Icon(Icons.arrow_drop_up_outlined,color:Color(0xFF6842FF),size: MediaQuery.of(context).size.width*0.2 ,),

                ],
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
                                builder: (BuildContext context) => selectionAgeView()));
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
                                builder: (BuildContext context) => selectionHeightView()));
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
