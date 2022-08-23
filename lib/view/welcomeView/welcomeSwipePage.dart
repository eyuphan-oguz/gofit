import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_fit/view/welcomeView/personalInformationView/selectionAgeView.dart';
import 'package:go_fit/view/welcomeView/personalInformationView/selectionGenderView.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class welcomeSwipePage extends StatefulWidget {
  const welcomeSwipePage({Key? key}) : super(key: key);

  @override
  _welcomeSwipePageState createState() => _welcomeSwipePageState();
}

class _welcomeSwipePageState extends State<welcomeSwipePage> {
  final controller=PageController();
  bool isLastPage=false;
  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.only(bottom: 80),
          child: PageView(
            onPageChanged: (index){
              setState(() => isLastPage=index==2);
            },
            controller: controller,
            children: [
              buildPage(urlImage: "assets/images/welcome2.jpeg", title1: "Find the right",title2: "workout for what",title3: "you need"),
              buildPage(urlImage: "assets/images/welcome3.jpg", title1: "Make suitable",title2: "workouts and great",title3: "results"),
              buildPage(urlImage: "assets/images/welcome4.jpg", title1: "Let's do a workout",title2: "and live healthy",title3: "with us"),



            ],
          ),
        ),
        bottomSheet:
        isLastPage ? TextButton(
            style: TextButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),minimumSize: Size.fromHeight(80)),
            onPressed: (){
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => selectionGenderView()));
            }, child: Text("Get Started",style: TextStyle(fontSize: 24),))
        :Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          height: 80,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Center(
                child: SmoothPageIndicator(
                  controller: controller,
                  count: 3,
                  effect: ExpandingDotsEffect(
                      spacing: 10,
                      radius:  8.0,
                      dotWidth:  8.0,
                      expansionFactor: 4,
                      dotHeight:  8.0,
                      dotColor: Color(0xFFE0E0E0),
                      activeDotColor: Color(0xFF6842FF)

                  ),
                  onDotClicked: (index)=>controller.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.easeIn),
                ),
              ),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                  onPressed: (){
                    controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeInOut);

                  },
                  style: ElevatedButton.styleFrom(primary: Color(0xFF6842FF),shape: StadiumBorder(),),
                  child: Text("Next")),
            ),
          ],
        )
            ],
          ),

        ),
      ),
    );
  }
  Widget buildPage({required String urlImage,required String title1,required String title2,required String title3}){
    return Column(
      children: [
        Container(child: Image.asset(urlImage,fit: BoxFit.fitWidth,width:MediaQuery.of(context).size.width*1,height: MediaQuery.of(context).size.height*0.6)),
        SizedBox(height: 20,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(title1,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,fontFamily: "Alata"),),
            Text(title2,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,fontFamily: 'Alata'),),
            Text(title3,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,fontFamily: 'Alata'),),
          ],
        ),
      ],
    );
  }
}
