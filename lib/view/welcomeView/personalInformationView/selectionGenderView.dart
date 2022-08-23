import 'package:flutter/material.dart';
import 'package:go_fit/model/personalChocesModel.dart';
import 'package:go_fit/view/welcomeView/personalInformationView/selectionAgeView.dart';
import 'package:numberpicker/numberpicker.dart';

class selectionGenderView extends StatefulWidget {
  const selectionGenderView({Key? key}) : super(key: key);

  @override
  _selectionGenderView createState() => _selectionGenderView();
}

class _selectionGenderView extends State<selectionGenderView> {
  late bool isMale=true;



  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
               Text(
                "Tell Us About Yourself",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30),
              ),
              SizedBox(
                height: 24,
              ),
              Text("To give you a better experience and results",
                  style: TextStyle(fontSize: 15)),
              Text("we need to  know your gender.",
                  style: TextStyle(fontSize: 15)),
            ],
          ),
          GestureDetector(
              onTap: () {
                print('Button tapped');
                setState(() {
                  isMale=true;
                  personalChoces.gender=isMale;
                  print(personalChoces.gender);
                });
              },
              child:  CircleAvatar(
                radius: 100,
                backgroundColor:isMale==true ? Color(0xFF704CFF):Colors.grey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.male,size: MediaQuery.of(context).size.width*0.25,color: Colors.white),
                    Text(
                      'Male',
                      style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),
                    ),
                  ],
                ),
              )),
          GestureDetector(
              onTap: () {
                setState(() {
                  isMale=false;
                  personalChoces.gender=isMale;
                  print(personalChoces.gender);
                });
              },
              child:  CircleAvatar(
                radius: 100,
                backgroundColor:isMale==false? Color(0xFF704CFF):Colors.grey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.female,size: MediaQuery.of(context).size.width*0.25,color: Colors.white,),
                    Text(
                      'Female',
                      style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),
                    ),
                  ],
                ),
              )),

          Padding(
            padding: EdgeInsets.symmetric( vertical: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [


                Container(
                  width: MediaQuery.of(context).size.width*0.9,
                  height: MediaQuery.of(context).size.height *0.07,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (BuildContext context) => selectionAgeView()));
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
