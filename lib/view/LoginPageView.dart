import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class LoginPageView extends StatefulWidget {
  const LoginPageView({Key? key}) : super(key: key);

  @override
  State<LoginPageView> createState() => _LoginPageViewState();
}

class _LoginPageViewState extends State<LoginPageView> {
  late double height=MediaQuery.of(context).size.height;
  late double width=MediaQuery.of(context).size.width;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: IconButton(onPressed:(){
          print("tıklandı");
        },icon: Icon(Icons.arrow_back,color:Colors.black)),

      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(height: height*0.01,),

          Text("Let's you in",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 30),),
          SizedBox(height: height*0.01,),
          Column(
            children: [
              SignInButton(icons:Icon(Icons.facebook_outlined,color: Colors.blue,), text: "Continue with Facebook", context: context),
              SizedBox(height: height*0.01,),
              SignInButton(imagePath: "assets/images/google-logo.png", text: "Continue with Google", context: context),
              SizedBox(height: height*0.01,),
              SignInButton(icons: Icon(Icons.apple,color: Colors.black,), text: "Continue with Apple", context: context),



            ],
          ),
          Row(
              children: <Widget>[
                Expanded(
                    child: Divider(

                    )
                ),

                Text("or",style: TextStyle(color: Color(0xFF616161)),),

                Expanded(
                    child: Divider()
                ),
              ]
          ),
          buildContinueButton(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don't have an account?"),
              TextButton(onPressed: (){}, child: Text("Sign up", style: TextStyle(color: Color(0xff6842FF) )   ))
            ],
          )
        ],
      ) ,
    ));
  }

  Container buildContinueButton() {
    return Container(
                height: height * 0.065,
                width: width * 0.8,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF6842FF),
                      shape: StadiumBorder(),
                    ),
                    child: Text("Sign in with password")),
              );
  }
}

Widget SignInButton({ Icon? icons ,String? imagePath,required String text ,required BuildContext context }){

      return Container(
        width: MediaQuery.of(context).size.width*0.8,
        height: MediaQuery.of(context).size.height*0.05,
        child: ElevatedButton.icon(
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>((Colors.white)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: Colors.grey.shade300)
                    )
                )
            ),
          icon: icons!=null ? icons : Image.asset(imagePath!),
          label: Text(text,style: TextStyle(color: Colors.black),),
          onPressed: () {},

        ),
      );
    }



