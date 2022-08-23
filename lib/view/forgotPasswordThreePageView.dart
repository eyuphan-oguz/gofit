import 'package:flutter/material.dart';

class ForgotPasswordThreePageView extends StatefulWidget {
  const ForgotPasswordThreePageView({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordThreePageView> createState() => _ForgotPasswordThreePageViewState();
}

class _ForgotPasswordThreePageViewState extends State<ForgotPasswordThreePageView> {
  late double height = MediaQuery.of(context).size.height;
  late double width = MediaQuery.of(context).size.width;
  TextEditingController passwordController1=TextEditingController();
  TextEditingController passwordController2=TextEditingController();

  late bool _passwordVisible1;
  late bool _passwordVisible2;
  late Color clickVisibleIconColor1=Color(0xFF9E9E9E);
  late Color clickVisibleIconColor2=Color(0xFF9E9E9E);
  late bool  clickPasswordFocus1=false;
  late bool  clickPasswordFocus2=false;
  late Color  clickLockColor1=Color(0xFF9E9E9E);
  late Color  clickLockColor2=Color(0xFF9E9E9E);
  bool isChecked = false;


  @override
  void initState() {
    _passwordVisible1 = true;
    _passwordVisible2 = true;
  }


  void passwordIconColorUpdate1({required bool clickTextFormField}){
    setState((){
      if(clickTextFormField==true){
        clickLockColor1=Color(0xFF9E9E9E);

      }
      else{
        clickLockColor1= Color(0xFF6842FF);
      }
    });
  }

  void passwordIconColorUpdate2({required bool clickTextFormField}){
    setState((){
      if(clickTextFormField==true){
        clickLockColor2=Color(0xFF9E9E9E);

      }
      else{
        clickLockColor2= Color(0xFF6842FF);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
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
              "Create your new password",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 25),
            )
          ],

        ),

      ),

    ),body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: width * 1,
            height: height * 0.35,
            child: FittedBox(
                fit: BoxFit.fill,
                child:
                Image.asset('assets/images/forgotPasswordHuman2.png')),
          ),
          Text(
            "Create your new password",
            style: TextStyle(fontSize: 15),
          ),


              Focus(
                onFocusChange: (hasFocus) {
                  passwordIconColorUpdate1(clickTextFormField: clickPasswordFocus1);
                  if(hasFocus) {
                    clickPasswordFocus1=true;

                  }
                  else{
                    clickPasswordFocus1=false;

                  }
                },
                child: TextFormField(
                  controller: passwordController1,
                  obscureText: _passwordVisible1,
                  decoration: InputDecoration(
                    fillColor:Color(0xFFFAFAFA ) ,
                    prefixIcon: Icon(Icons.lock,color: clickLockColor1,),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(width: 2.0,color: Color(0xFFB3A0FF)),

                    ),
                    hintText: "Password",
                    filled: true,
                    suffixIcon: IconButton(
                      icon: Icon(
                        // Based on passwordVisible state choose the icon
                        _passwordVisible1
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: clickVisibleIconColor1,
                      ),
                      onPressed: () {
                        // Update the state i.e. toogle the state of passwordVisible variable
                        setState(() {
                          _passwordVisible1 = !_passwordVisible1;
                          if(_passwordVisible1 ==true){
                            clickVisibleIconColor1=Color(0xFF9E9E9E);
                          }else{
                            clickVisibleIconColor1=Color(0xFF6842FF);
                          }

                        });
                      },
                    ),
                  ),
                ),
              ),
//                  SizedBox(height: height*0.03,),

              Focus(
                onFocusChange: (hasFocus) {
                  passwordIconColorUpdate2(clickTextFormField: clickPasswordFocus2);
                  if(hasFocus) {
                    clickPasswordFocus2=true;

                  }
                  else{
                    clickPasswordFocus2=false;

                  }
                },
                child: TextFormField(
                  controller: passwordController2,
                  obscureText: _passwordVisible2,
                  decoration: InputDecoration(
                    fillColor:Color(0xFFFAFAFA ) ,
                    prefixIcon: Icon(Icons.lock,color: clickLockColor2,),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(width: 2.0,color: Color(0xFFB3A0FF)),

                    ),
                    hintText: "Password",
                    filled: true,
                    suffixIcon: IconButton(
                      icon: Icon(
                        // Based on passwordVisible state choose the icon
                        _passwordVisible2
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: clickVisibleIconColor2,
                      ),
                      onPressed: () {
                        // Update the state i.e. toogle the state of passwordVisible variable
                        setState(() {
                          _passwordVisible2 = !_passwordVisible2;
                          if(_passwordVisible2 ==true){
                            clickVisibleIconColor2=Color(0xFF9E9E9E);
                          }else{
                            clickVisibleIconColor2=Color(0xFF6842FF);
                          }

                        });
                      },
                    ),
                  ),
                ),
              ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Theme(
                  data: ThemeData(unselectedWidgetColor:Color(0xFF6842FF), ),

                  child: Checkbox(
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                    activeColor:Color(0xFF6842FF) ,


                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                  ),
                ),
                Text("Remember me",style: TextStyle(fontWeight: FontWeight.w500),)
              ]
          ),
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
    ),));
  }
}
