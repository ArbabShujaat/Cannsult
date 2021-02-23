import 'package:cannsult/Constants/constant.dart';

import 'package:flutter/material.dart';
import 'package:intro_slider/dot_animation_enum.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:shared_preferences/shared_preferences.dart';

//import 'package:intro_slider_example/home.dart';

class IntroScreen extends StatefulWidget {
  IntroScreen({Key key}) : super(key: key);

  @override
  IntroScreenState createState() => new IntroScreenState();
}

class IntroScreenState extends State<IntroScreen> {
  List<Slide> slides = new List();

  Function goToTab;

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
          title: "Live interactive classes with white board",
          styleTitle: TextStyle(
              color: Colors.white, fontSize: 15.0, fontFamily: 'RobotoMono'),
          description: "",
          styleDescription: TextStyle(
              color: Colors.white, fontSize: 19.0, fontFamily: 'Raleway'),
          pathImage: "assets/Slider1.png",
          foregroundImageFit: BoxFit.fitHeight,
          widthImage: 40),
    );
    slides.add(
      new Slide(
        title: "Very friendly and verified Tutors",
        styleTitle: TextStyle(
            color: Colors.white, fontSize: 15.0, fontFamily: 'RobotoMono'),
        description: "",
        styleDescription: TextStyle(
            color: Colors.white, fontSize: 22.0, fontFamily: 'Raleway'),
        pathImage: "assets/Slider2.png",
      ),
    );
    slides.add(
      new Slide(
        title: "Excellent customer services and support",
        styleTitle: TextStyle(
            color: Colors.white, fontSize: 15.0, fontFamily: 'RobotoMono'),
        description: "",
        styleDescription: TextStyle(
            color: Colors.white, fontSize: 22.0, fontFamily: 'Raleway'),
        pathImage: "assets/Slider3.png",
        heightImage: 20,
      ),
    );
  }

  Future<void> onDonePress() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('FirstTime', true);
    Navigator.pushReplacementNamed(context, PRIMARY_SCREEN);
  }

  void onTabChangeCompleted(index) {
    // Index of current tab is focused
  }

  Widget renderNextBtn() {
    return Icon(
      Icons.navigate_next,
      color: Colors.white,
      size: 35.0,
    );
  }

  Widget renderDoneBtn() {
    return Text(
      "DONE",
      style: TextStyle(color: Colors.white),
    );
  }

  Widget renderSkipBtn() {
    return Text(
      "SKIP",
      style: TextStyle(color: Colors.white),
    );
    // return Icon(
    //   Icons.skip_next,
    //   color: Color(0xffffcc5c),
    // );
  }

  List<Widget> renderListCustomTabs() {
    List<Widget> tabs = new List();
    for (int i = 0; i < slides.length; i++) {
      Slide currentSlide = slides[i];
      tabs.add(Container(
        width: double.infinity,
        height: double.infinity,
        child: Container(
          margin: EdgeInsets.only(bottom: 60.0, top: 60.0),
          child: ListView(
            children: <Widget>[
              GestureDetector(
                  child: Image.asset(
                currentSlide.pathImage,
                width: 200.0,
                height: 200.0,
                fit: BoxFit.contain,
              )),
              Container(
                child: Text(
                  currentSlide.title,
                  style: currentSlide.styleTitle,
                  textAlign: TextAlign.center,
                ),
                margin: EdgeInsets.only(top: 20.0),
              ),
              Container(
                child: Text(
                  currentSlide.description,
                  style: currentSlide.styleDescription,
                  textAlign: TextAlign.center,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
                margin: EdgeInsets.only(top: 20.0),
              ),
            ],
          ),
        ),
      ));
    }
    return tabs;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height -
                MediaQuery.of(context).size.height / 1.3,
          ),
          Container(
            height: MediaQuery.of(context).size.height / 1.3,
            child: IntroSlider(
              // List slides
              slides: this.slides,

              // Skip button
              renderSkipBtn: this.renderSkipBtn(),
              onSkipPress: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setBool('FirstTime', true);
                Navigator.pushReplacementNamed(context, PRIMARY_SCREEN);
              },
              // colorSkipBtn: Colors.green,
              highlightColorSkipBtn: Color(0xffffcc5c),

              // Next button
              renderNextBtn: this.renderNextBtn(),

              // Done button
              renderDoneBtn: this.renderDoneBtn(),
              onDonePress: this.onDonePress,
              // colorDoneBtn: Color(0x33ffcc5c),
              highlightColorDoneBtn: Color(0xffffcc5c),

              // Dot indicator
              colorDot: Colors.white,
              sizeDot: 13.0,
              typeDotAnimation: dotSliderAnimation.SIZE_TRANSITION,

              // Tabs
              listCustomTabs: this.renderListCustomTabs(),
              backgroundColorAllSlides: Colors.green,
              refFuncGoToTab: (refFunc) {
                this.goToTab = refFunc;
              },

              // Show or hide status bar
              shouldHideStatusBar: true,

              // On tab change completed
              onTabChangeCompleted: this.onTabChangeCompleted,
            ),
          ),
        ],
      ),
    );
  }
}
