import 'package:flutter/material.dart';

class CreateAccountPageView extends StatefulWidget {
  const CreateAccountPageView({Key? key}) : super(key: key);

  @override
  State<CreateAccountPageView> createState() => _CreateAccountPageViewState();
}

class _CreateAccountPageViewState extends State<CreateAccountPageView> {
  late double height=MediaQuery.of(context).size.height;
  late double width=MediaQuery.of(context).size.width;
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  late bool _passwordVisible;
  late Color clickVisibleIconColor=Color(0xFF9E9E9E);
  late bool  clickEmailFocus=false;
  late bool  clickPasswordFocus=false;
  late Color  clickEmailColor=Color(0xFF9E9E9E);
  late Color  clickLockColor=Color(0xFF9E9E9E);
  bool isChecked = false;

  @override
  void initState() {
    _passwordVisible = true;
  }


  void emailIconColorUpdate({required bool clickTextFormField}){
    setState((){
      if(clickTextFormField==true){
        clickEmailColor=Color(0xFF9E9E9E);
      }
      else{
        clickEmailColor= Color(0xFF6842FF);
      }
    });
  }
  void passwordIconColorUpdate({required bool clickTextFormField}){
    setState((){
      if(clickTextFormField==true){
        clickLockColor=Color(0xFF9E9E9E);

      }
      else{
        clickLockColor= Color(0xFF6842FF);
      }
    });
  }


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
          body:Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(height: height*0.01,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Create your",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 40),),
                        Text("Account",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 40),),

                      ],
                    ),
                  ],
                ),

                SizedBox(height: height*0.01,),
                Column(
                  children: [
                    Focus(
                      onFocusChange: (hasFocus) {
                        emailIconColorUpdate(clickTextFormField: clickEmailFocus);
                        if(hasFocus) {
                          print("fokuslandı");
                          clickEmailFocus=true;

                        }
                        else{
                          clickEmailFocus=false;
                          print("fokuslanmadı");
                        }
                        },
                      child: TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            fillColor:Color(0xFFFAFAFA ) ,
                            prefixIcon: Icon(Icons.email_rounded,color: clickEmailColor,),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide.none
                            ),
                          focusedBorder:OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(width: 2.0,color: Color(0xFFB3A0FF)),),

                            hintText: "Email",
                            filled: true),
                      ),

                    ),
                    SizedBox(height: height*0.01,),

                    Focus(
                      onFocusChange: (hasFocus) {
                        passwordIconColorUpdate(clickTextFormField: clickPasswordFocus);
                        if(hasFocus) {
                          clickPasswordFocus=true;

                        }
                        else{
                          clickPasswordFocus=false;

                        }
                      },
                      child: TextFormField(
                        controller: passwordController,
                        obscureText: _passwordVisible,
                        decoration: InputDecoration(
                          fillColor:Color(0xFFFAFAFA ) ,
                            prefixIcon: Icon(Icons.lock,color: clickLockColor,),
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
                                _passwordVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: clickVisibleIconColor,
                              ),
                              onPressed: () {
                                // Update the state i.e. toogle the state of passwordVisible variable
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                  if(_passwordVisible ==true){
                                    clickVisibleIconColor=Color(0xFF9E9E9E);
                                  }else{
                                    clickVisibleIconColor=Color(0xFF6842FF);
                                  }

                                });
                              },
                            ),
                      ),
                    ),
                    )
                  ],
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
                buildContinueButton(),
                Center(child: TextButton(onPressed: (){}, child: Text("Forgot the password?"))),
                Row(
                    children: [
                      Expanded(
                          child: Divider()
                      ),

                     const Text("or continue with",style: TextStyle(color: Color(0xFF616161)),),

                      Expanded(
                          child: Divider()
                      ),
                    ]
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SignInButton(icons:Icon(Icons.facebook_outlined,color: Colors.blue,),  context: context),
                    SizedBox(width: width*0.03,),
                    SignInButton(imagePath: "assets/images/google-logo.png", context: context),
                    SizedBox(width: width*0.03,),

                    SignInButton(icons: Icon(Icons.apple,color: Colors.black,), context: context),


                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?"),
                    TextButton(onPressed: (){}, child: Text("Sign up",style: TextStyle(color: Color(0xff6842FF)),))
                  ],
                )
              ],
            ),
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
          child: Text("Sign in")),
    );
  }
}

Widget SignInButton({ Icon? icons ,String? imagePath,required ,required BuildContext context }){

  return Container(
    width: MediaQuery.of(context).size.width*0.2,
    height: MediaQuery.of(context).size.height*0.065,
    child: ElevatedButton(
      style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>((Colors.white)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(color: Colors.grey.shade300)
              )
          )
      ),
      child: icons!=null ? icons : Image.asset(imagePath!),
      onPressed: () {},

    ),
  );
}