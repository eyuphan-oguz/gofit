import 'package:flutter/material.dart';
import 'package:go_fit/view/welcomeView/personalInformationView/selectionGenderView.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class fillYourProfileView extends StatefulWidget {
  const fillYourProfileView({Key? key}) : super(key: key);

  @override
  State<fillYourProfileView> createState() => _fillYourProfileViewState();
}

class _fillYourProfileViewState extends State<fillYourProfileView> {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController fullNameController=TextEditingController();
  TextEditingController nickNameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  String initialCountry = 'TR';
  PhoneNumber number = PhoneNumber(isoCode: 'TR');



  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Fill Your Profile",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Text("Don't worry, you can always change it later, ort",
                      style: TextStyle(fontSize: 15)),
                  Text("you can skip it for now.",
                      style: TextStyle(fontSize: 15)),
                ],
              ),
              Center(
                child: Container(
                    width: MediaQuery.of(context).size.width * 0.22,
                    height: MediaQuery.of(context).size.height * 0.22,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 1, color: Colors.blue),
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                                "https://picsum.photos/500/300?random=1")))),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: TextFormField(
                  controller: fullNameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none

                      ),
                      hintText: "Full Name",
                      filled: true),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: TextFormField(
                  controller: nickNameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none

                      ),
                      hintText: "Nick Name",
                      filled: true),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.email_rounded),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none

                      ),
                      hintText: "Email",
                      filled: true),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Form(
              key: formKey,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InternationalPhoneNumberInput(
                      onInputChanged: (PhoneNumber number) {
                        print(number.phoneNumber);
                      },

                  //collapsed(hintText: "Phone Number"),
                      inputDecoration: InputDecoration(
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none
                        ),
                      ),
                      onInputValidated: (bool value) {
                        print(value);
                      },
                      selectorConfig: SelectorConfig(
                        selectorType: PhoneInputSelectorType.DROPDOWN,
                        setSelectorButtonAsPrefixIcon: true,
                      ),
                      ignoreBlank: false,
                      autoValidateMode: AutovalidateMode.disabled,
                      selectorTextStyle: TextStyle(color: Colors.black),
                      initialValue: number,
                      textFieldController: phoneController,
                      formatInput: false,
                      keyboardType:
                      TextInputType.numberWithOptions(signed: true, decimal: true),
                      inputBorder: OutlineInputBorder(),
                      onSaved: (PhoneNumber number) {
                        print('On Saved: $number');
                      },
                    ),

                  ],
                ),
              ),
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
                            //Navigator.of(context).pushReplacement(MaterialPageRoute(
                              //  builder: (BuildContext context) =>
                                //    selectionGoalView()));
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
                            if(formKey.currentState?.validate.toString()=="Closure: () => bool from Function 'validate':."){
                              print("aaa");
                              formKey.currentState?.save();
                             // Navigator.push(context, MaterialPageRoute(builder: (context)=>selectionGenderView()));
                            }else{
                              print("error");
                            }

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
        ),
      ),
    ));
  }


  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }
}


