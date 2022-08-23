import 'package:flutter/material.dart';
import 'package:go_fit/model/personalChocesModel.dart';
import 'package:go_fit/view/welcomeView/personalInformationView/selectionGenderView.dart';
import 'package:go_fit/view/welcomeView/personalInformationView/selectionGoalView.dart';
import 'package:go_fit/view/welcomeView/personalInformationView/selectionWeightView.dart';
import 'package:numberpicker/numberpicker.dart';

class selectionLevelView extends StatefulWidget {
  const selectionLevelView({Key? key}) : super(key: key);

  @override
  _selectionLevelViewState createState() => _selectionLevelViewState();
}

class _selectionLevelViewState extends State<selectionLevelView> {
  List<bool> selectionLevel = [false, false, false];
  List<Color> selectionColorList=[Colors.white,Colors.white,Colors.white];

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
                Text(
                  "Physical Activity Level?",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30),
                ),
                SizedBox(
                  height: 24,
                ),
                Text("Choose your regular activity level. This will",
                    style: TextStyle(fontSize: 15)),
                Text("help us to personalize plans for you.",
                    style: TextStyle(fontSize: 15)),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [

                Container(
                  width: MediaQuery.of(context).size.width*0.8,
                  height: MediaQuery.of(context).size.height*0.08,
                    decoration: BoxDecoration(
                      color: selectionLevel[0]==true ?selectionColorList[0]:Colors.white,
                        border: Border.all(
                            width: 2,
                          color: Colors.white
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(12))
                    ),
                  child:GestureDetector(
                      onTap: (){
                        selectionLevel[0]=true;
                        selectionLevel[1]=false;
                        selectionLevel[2]=false;
                        setState(() {
                          personalChoces.selectionLevel=[selectionLevel[0],selectionLevel[1],selectionLevel[2]];
                          print("beginner:${personalChoces.selectionLevel.toString()}");

                          if(selectionLevel[0]==true){
                            selectionColorList[0]=Color(0xFF704CFF);
                          }else{
                            selectionColorList[0]=Colors.white;
                          }
                        });
                      },
                    child: Center(child: Text("Beginner")),
                  )
                ),
                Container(
                    width: MediaQuery.of(context).size.width*0.8,
                    height: MediaQuery.of(context).size.height*0.08,
                    decoration: BoxDecoration(
                        color: selectionLevel[1]==true ?selectionColorList[1]:Colors.white,
                        border: Border.all(
                            width: 2,
                            color: Colors.white
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(12))
                    ),
                    child:GestureDetector(
                      onTap: (){
                        selectionLevel[0]=false;
                        selectionLevel[1]=true;
                        selectionLevel[2]=false;
                        setState(() {
                          print("Medium:${selectionLevel}");

                          personalChoces.selectionLevel=[selectionLevel[0],selectionLevel[1],selectionLevel[2]];

                          if(selectionLevel[1]==true){
                            selectionColorList[1]=Color(0xFF704CFF);
                          }else{
                            selectionColorList[1]=Colors.white;
                          }
                        });
                      },
                      child: Center(child: Text("Intermediate")),
                    )
                ),
                Container(
                    width: MediaQuery.of(context).size.width*0.8,
                    height: MediaQuery.of(context).size.height*0.08,
                    decoration: BoxDecoration(
                        color: selectionLevel[2]==true ?selectionColorList[2]:Colors.white,
                        border: Border.all(
                            width: 2,
                            color: Colors.white
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(12))
                    ),
                    child:GestureDetector(
                      onTap: (){
                        selectionLevel[0]=false;
                        selectionLevel[1]=false;
                        selectionLevel[2]=true;
                        setState(() {
                          print("Hard:${selectionLevel}");
                          personalChoces.selectionLevel=[selectionLevel[0],selectionLevel[1],selectionLevel[2]];


                          if(selectionLevel[2]==true){
                            selectionColorList[2]=Color(0xFF704CFF);
                          }else{
                            selectionColorList[2]=Colors.white;
                          }
                        });
                      },
                      child: Center(child: Text("Advanced")),
                    )
                ),

              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (BuildContext context) =>
                                selectionGoalView()));
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFF0ECFF),
                        shape: StadiumBorder(),
                      ),
                      child: Text(
                        "Back",
                        style: TextStyle(color: Color(0xFF8B6DFF)),
                      )),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.05,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: ElevatedButton(
                      onPressed: () {

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
