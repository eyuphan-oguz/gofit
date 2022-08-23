import 'dart:async';

import 'package:flutter/material.dart';

class forgotPasswordTwoView extends StatefulWidget {
  const forgotPasswordTwoView({Key? key}) : super(key: key);

  @override
  State<forgotPasswordTwoView> createState() => _forgotPasswordTwoViewState();
}

class _forgotPasswordTwoViewState extends State<forgotPasswordTwoView> {
  late double height = MediaQuery.of(context).size.height;
  late double width = MediaQuery.of(context).size.width;
  late List<String> codeNumber = [];
  late List<bool> inputContainerCode=[false,false,false,false];




  late Timer _timer;
  int _start = 60;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }




  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Transform(
          transform: Matrix4.translationValues(-15.0, 0.0, 0.0),
          child: Row(
            children: [
              IconButton(
                  onPressed: () {
                    print("tıklandı");
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    size: 30,
                  )),
              Text(
                "Forgot Password",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 25),
              )
            ],
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: height * 0.1,
          ),
          Text("Code has been send to +1 111******99"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap:(){
                    setState((){
                      inputContainerCode=[true,false,false,false];
                    });
                  },
                  child: Container(
                    width: width * 0.2,
                    height: height * 0.1,
                    decoration: BoxDecoration(
                        color: Color(0xffFAFAFA),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color:codeNumber.length == 1 ? Color(0xff7C5BFF) :Color(0xffDCDCDC))),
                    child:
                        Center(
                          child: codeNumber.length >= 1 ? Text(codeNumber[0],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),) : null,
                        )
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    setState((){
                      inputContainerCode=[false,true,false,false];
                    });
                  },
                  child: Container(
                    width: width * 0.2,
                    height: height * 0.1,
                    decoration: BoxDecoration(
                        color: Color(0xffFAFAFA),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: codeNumber.length == 2 ? Color(0xff7C5BFF) :Color(0xffDCDCDC))),
                    child:
                        Center(
                          child: codeNumber.length >= 2 ? Text(codeNumber[1],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25)) : null,
                        )
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    setState((){
                      inputContainerCode=[false,false,true,false];
                    });
                  },
                  child: Container(
                    width: width * 0.2,
                    height: height * 0.1,
                    decoration: BoxDecoration(
                        color: Color(0xffFAFAFA),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: codeNumber.length == 3 ? Color(0xff7C5BFF) :Color(0xffDCDCDC))),
                    child:
                        Center(
                          child: codeNumber.length >= 3 ? Text(codeNumber[2],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25)) : null,
                        )
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    setState((){
                      inputContainerCode=[false,false,false,true];
                    });

                  },
                  child: Container(
                    width: width * 0.2,
                    height: height * 0.1,
                    decoration: BoxDecoration(
                        color: Color(0xffFAFAFA),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color:  inputContainerCode[3]==true ? Color(0xff7C5BFF) :Color(0xffDCDCDC))),
                    child:
                        Center(
                          child: codeNumber.length >= 4 ? Text(codeNumber[3],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25)) : null,
                        )
                  ),
                ),

              ],
            ),
          ) ,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Resed code in "),
              Text(
                "$_start",
                style: TextStyle( color:Color(0xff7C5BFF)),
              ),
            ],
          ),
          codeNumber.length<4 || inputContainerCode.contains(true) ? Container(
            width: width * 1,
            height: height * 0.35,
            decoration: BoxDecoration(
              color: Color(0xffFAFAFA),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                          onPressed: () {
                            setState(() {
                              if(codeNumber.length<4 )
                              codeNumber.add("1");


                            });

                            print(codeNumber);
                          },
                          child: Text(
                            "1",
                            style: TextStyle(color: Colors.black, fontSize: 25),
                          )),
                      TextButton(
                          onPressed: () {
                            setState(() {
                              if(codeNumber.length<4)
                                codeNumber.add("2");

                            });

                            print(codeNumber);
                          },
                          child: Text("2",
                              style: TextStyle(
                                  color: Colors.black, fontSize: 25))),
                      TextButton(
                          onPressed: () {
                            setState(() {
                              if(codeNumber.length<4)
                                codeNumber.add("3");

                            });

                            print(codeNumber);
                          },
                          child: Text("3",
                              style: TextStyle(
                                  color: Colors.black, fontSize: 25))),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                          onPressed: () {
                            setState(() {
                              if(codeNumber.length<4)
                              codeNumber.add("4");

                            });

                            print(codeNumber);
                          },
                          child: Text("4",
                              style: TextStyle(
                                  color: Colors.black, fontSize: 25))),
                      TextButton(
                          onPressed: () {
                            setState(() {
                              if(codeNumber.length<4)
                              codeNumber.add("5");

                            });

                            print(codeNumber);
                          },
                          child: Text("5",
                              style: TextStyle(
                                  color: Colors.black, fontSize: 25))),
                      TextButton(
                          onPressed: () {
                            setState(() {
                              if(codeNumber.length<4)
                              codeNumber.add("6");

                            });

                            print(codeNumber);
                          },
                          child: Text("6",
                              style: TextStyle(
                                  color: Colors.black, fontSize: 25))),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                          onPressed: () {
                            setState(() {
                              if(codeNumber.length<4)
                              codeNumber.add("7");

                            });

                            print(codeNumber);
                          },
                          child: Text("7",
                              style: TextStyle(
                                  color: Colors.black, fontSize: 25))),
                      TextButton(
                          onPressed: () {
                            setState(() {
                              if(codeNumber.length<4)
                              codeNumber.add("8");


                            });

                            print(codeNumber);
                          },
                          child: Text("8",
                              style: TextStyle(
                                  color: Colors.black, fontSize: 25))),
                      TextButton(
                          onPressed: () {
                            setState(() {
                              if(codeNumber.length<4)
                              codeNumber.add("9");

                            });
                            print(codeNumber);
                          },
                          child: Text("9",
                              style: TextStyle(
                                  color: Colors.black, fontSize: 25))),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                          onPressed: () {
                            setState(() {
                              if(codeNumber.length>=0){
                                codeNumber=[];
                              }


                            });
                            print(codeNumber);
                          },
                          child: Icon(
                            Icons.backspace_outlined,
                            color: Colors.black,
                          )),

                      TextButton(
                          onPressed: () {
                            setState(() {
                              if(codeNumber.length<4)
                              codeNumber.add("0");


                            });
                            print(codeNumber);
                          },
                          child: Text("0",
                              style: TextStyle(
                                  color: Colors.black, fontSize: 25))),
                      TextButton(
                          onPressed: () {
                            setState(() {
                              inputContainerCode=[false,false,false,false];

                            });
                            print(codeNumber);
                          },
                          child: Icon(
                            Icons.done_rounded,
                            color: Colors.black,
                          )),
                    ],
                  ),
                ),
              ],
            )
          ):Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Container(
      height: height * 0.07,
      width: width * 1,
      child: ElevatedButton(
            onPressed: () {

            },
            style: ElevatedButton.styleFrom(
              primary: Color(0xFF6842FF),
              shape: StadiumBorder(),
            ),
            child: Text("Verify")),
    ),
          ),
        ],
      ),
    ));
  }
}
