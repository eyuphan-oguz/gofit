import 'package:flutter/material.dart';
import 'package:go_fit/model/personalChocesModel.dart';
import 'package:go_fit/view/welcomeView/personalInformationView/selectionGenderView.dart';
import 'package:go_fit/view/welcomeView/personalInformationView/selectionHeightView.dart';
import 'package:go_fit/view/welcomeView/personalInformationView/selectionLevelView.dart';
import 'package:go_fit/view/welcomeView/personalInformationView/selectionWeightView.dart';
import 'package:numberpicker/numberpicker.dart';

class selectionGoalView extends StatefulWidget {
  const selectionGoalView({Key? key}) : super(key: key);

  @override
  _selectionGoalViewState createState() => _selectionGoalViewState();
}

class _selectionGoalViewState extends State<selectionGoalView> {
bool value=false;
List<bool>valueList=[false,false,false,false,false,false];
List<Color> borderColorList=[Colors.white,Colors.white,Colors.white,Colors.white,Colors.white,Colors.white];
Color activeColor=Color(0xFF704CFF);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Padding(
                padding: EdgeInsets.symmetric(vertical: 24),
                child: Column(
                  children: [
                    Text("What is Your Goal?",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 30),),
                    SizedBox(height: 24,),
                    Text("You can choose more than one. Don't worry,",style: TextStyle(fontSize: 15)),
                    Text("you can always change it later.",style: TextStyle(fontSize: 15)),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    buildSelection(borderColor: borderColorList,index: 0,valueList: valueList,text: "Get Fitter"),
                    SizedBox(height: MediaQuery.of(context).size.height*0.01,),

                    buildSelection(borderColor: borderColorList,index: 1,valueList: valueList,text: "Gain Weight"),

                    SizedBox(height: MediaQuery.of(context).size.height*0.01,),

                    buildSelection(borderColor: borderColorList,index: 2,valueList: valueList,text: "Lose Weight"),

                    SizedBox(height: MediaQuery.of(context).size.height*0.01,),

                    buildSelection(borderColor: borderColorList,index: 3,valueList: valueList,text: "Building Muscles"),

                    SizedBox(height: MediaQuery.of(context).size.height*0.01,),

                    buildSelection(borderColor: borderColorList,index: 4,valueList: valueList,text: "Improving Endurance"),

                    SizedBox(height: MediaQuery.of(context).size.height*0.01,),

                    buildSelection(borderColor: borderColorList,index: 5,valueList: valueList,text: "Others"),



                  ],
                ),
              ),

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
                                builder: (BuildContext context) => selectionHeightView()));
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
                                builder: (BuildContext context) => selectionLevelView()));
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
  Widget buildSelection({required List<Color>borderColor, required List<bool>valueList,required int index,required String text}){
    return  Container(
      decoration: BoxDecoration(
          border: Border.all(
              width: 2,
              color: borderColor[index]
          ),
          borderRadius: BorderRadius.all(Radius.circular(12))
      ),child: ListTile(
      trailing: Checkbox(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
        activeColor:activeColor,
        value: valueList[index],
        onChanged: (value){
          setState(() {
            this.valueList[index]=value!;
            //personalChoces.goal=this.valueList[index] as List<bool>;
            print(personalChoces.gender.toString());
            print(personalChoces.age.toString());
            print(personalChoces.height.toString());
            print(personalChoces.weight.toString());



            if(valueList[index]==true){
              borderColor[index]=Color(0xFF704CFF);
            }
            else{
              borderColor[index]=Colors.white;
            }

          });
        },
      ) ,

      title:  Text(text),
    ),
    );
  }
}
