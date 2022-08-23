import 'package:flutter/material.dart';

class ForgotPasswordOnePageView extends StatefulWidget {
  const ForgotPasswordOnePageView({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordOnePageView> createState() =>
      _ForgotPasswordOnePageViewState();
}
bool clickButtonSMS=false;
bool clickButtonEmail=false;

class _ForgotPasswordOnePageViewState extends State<ForgotPasswordOnePageView> {
  late double height = MediaQuery.of(context).size.height;
  late double width = MediaQuery.of(context).size.width;

  late bool smsButtonSideColor=false;
  late bool emailButtonSideColor=false;




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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: width * 1,
                height: height * 0.35,
                child: FittedBox(
                    fit: BoxFit.fill,
                    child:
                        Image.asset('assets/images/forgotPasswordHuman.png')),
              ),
              Text(
                "Select which contact details should we use to reset your password",
                style: TextStyle(fontSize: 15),
              ),

              chooseResetPasswordButton(context: context, height: height, width: width, text: "via SMS:", imagePath: "assets/images/messageIcons.png", personInformation: "+1 111 ******99",clickButton: clickButtonSMS,onPressed: (){
                setState((){
                   clickButtonSMS=true;
                   clickButtonEmail=false;
                   print("bastın");

                });

              }),
              chooseResetPasswordButton(context: context, height: height, width: width, text: "via Email:", imagePath: "assets/images/emailIcons.png", personInformation: "and***ey@yourdomain.com",clickButton: clickButtonEmail,onPressed: (){
                setState((){
                  clickButtonSMS=false;
                  clickButtonEmail=true;
                  print("bastın");

                });
              } ),

              SizedBox(height: height*0.01,),
              Container(
                height: height * 0.07,
                width: width * 1,
                child: ElevatedButton(
                    onPressed: () {

                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF6842FF),
                      shape: StadiumBorder(),
                    ),
                    child: Text("Continue")),
              )
            ],
          ),
        ),
      ),
    ));
  }
}

Widget chooseResetPasswordButton({required BuildContext context,required double height,required double width,required String text , required String imagePath, required String personInformation,required bool clickButton,required VoidCallback onPressed}){
  return Container(
    width: MediaQuery.of(context).size.width * 1,
    height: MediaQuery.of(context).size.height * 0.15,
    child: ElevatedButton(
     onPressed: onPressed,
      style: ButtonStyle(
          backgroundColor:
          MaterialStateProperty.all<Color>((Colors.white)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  side: BorderSide(color:clickButton ==true ? Color(0xFF9175FF) : Colors.white70 ,width: 3)))),
      child: Row(
        children: [
          Container(
              width: width * 0.15,
              height: height * 0.15,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Color(0xffF0ECFF)),
              child: Image.asset(imagePath)),
          SizedBox(
            width: width * 0.1,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
               text,
                style: TextStyle(color: Color(0xFFB3B3B3)),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Text(
                personInformation,
                style: TextStyle(color: Color(0xff585858)),
              ),
            ],
          )
        ],
      ),
    ),
  );
}