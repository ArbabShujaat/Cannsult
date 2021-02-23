import 'package:auto_size_text/auto_size_text.dart';
import 'package:cannsult/Constants/constant.dart';
import 'package:cannsult/Screens/web_view.dart';
import 'package:cannsult/Widgets/responsive_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gifimage/flutter_gifimage.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:intro_slider/dot_animation_enum.dart';
import 'package:url_launcher/url_launcher.dart';

class PrimaryScreen extends StatefulWidget {
  @override
  _PrimaryScreenState createState() => _PrimaryScreenState();
}

class _PrimaryScreenState extends State<PrimaryScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double hieght = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    bool _large = ResponsiveWidget.isScreenLarge(width, _pixelRatio);
    bool _medium = ResponsiveWidget.isScreenMedium(width, _pixelRatio);
    bool _small = ResponsiveWidget.isScreenSmall(width, _pixelRatio);
    print(width * _pixelRatio);
    print(_pixelRatio);
    print(_large);
    print(_small);
    print(_medium);

    return Scaffold(
      drawer: drawer(_large, _medium, _small),
      appBar: AppBar(
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            "assets/logo.jpeg",
            scale: 7,
          ),
        ),
      ),
      body: Container(
        height: hieght,
        width: width,
        color: Colors.grey[300],
        child: Stack(children: <Widget>[
          Container(
            height: hieght,
            width: width,
            child: Image.asset(
              "assets/main.png",
              fit: BoxFit.fill,
            ),
          ),
          Center(
            child: Image.asset(
              "assets/GIF.gif",
            ),
          ),
          Positioned(
              bottom: 10,
              left: 10,
              right: 10,
              child: Container(
                width: width - 20,
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ButtonTheme(
                            buttonColor: Colors.white,
                            height: 50,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                              child: AutoSizeText.rich(TextSpan(
                                text: "BOOK TUTOR",
                                style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontSize: _large
                                      ? 12
                                      : _medium
                                          ? 10
                                          : 8,
                                ),
                              )),
                              onPressed: () {
                                // launch(
                                //     "https://friendlytutors.co.uk/webapp/search-tutor");
                                webUrl =
                                    "https://friendlytutors.co.uk/webapp/search-tutor";
                                Navigator.pushNamed(context, WEB_VIEW);
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ButtonTheme(
                            buttonColor: Colors.white,
                            // minWidth: width - 20,
                            height: 50,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                              child: AutoSizeText.rich(TextSpan(
                                text: "BECOME TUTOR",
                                style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontSize: _large
                                      ? 12
                                      : _medium
                                          ? 10
                                          : 8,
                                ),
                              )),
                              onPressed: () {
                                // launch(
                                //     "https://friendlytutors.co.uk/webapp/auth/login");
                                webUrl =
                                    "https://friendlytutors.co.uk/webapp/auth/login";
                                Navigator.pushNamed(context, WEB_VIEW);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ButtonTheme(
                        buttonColor: Colors.green,
                        minWidth: width - 20,
                        height: 50,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          child: AutoSizeText.rich(TextSpan(
                            text: "GET STARTED",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: _large
                                  ? 16
                                  : _medium
                                      ? 10
                                      : 8,
                            ),
                          )),
                          onPressed: () {
                            // launch("https://friendlytutors.co.uk/webapp");
                            webUrl = "https://google.com";
                            Navigator.pushNamed(context, WEB_VIEW);
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ))
        ]),
      ),
    );
  }

  Widget drawer(bool large, bool medium, bool small) {
    return Drawer(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              color: Colors.green,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset('assets/Logo.png'),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 8, 8, 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              '''Friendly''',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: large
                                      ? 20
                                      : medium
                                          ? 20
                                          : 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '''Tutors''',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: large
                                      ? 20
                                      : medium
                                          ? 20
                                          : 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 5,
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                // launch("https://friendlytutors.co.uk/webapp/#");
                webUrl = "https://friendlytutors.co.uk/webapp";
                Navigator.pushNamed(context, WEB_VIEW);
              },
              child: ListTile(
                leading:
                    Container(height: 40, child: Image.asset("assets/d1.png")),
                title: Text(
                  "Find Course",
                  style: TextStyle(fontSize: 18, color: Colors.green),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Divider(
                color: Colors.green,
                thickness: 2,
              ),
            ),
            InkWell(
              onTap: () {
                // launch("https://friendlytutors.co.uk/webapp/search-tutor");
                webUrl = "https://friendlytutors.co.uk/webapp/search-tutor";
                Navigator.pushNamed(context, WEB_VIEW);
              },
              child: ListTile(
                leading:
                    Container(height: 40, child: Image.asset("assets/d2.png")),
                title: Text(
                  "Find Tutor",
                  style: TextStyle(fontSize: 18, color: Colors.green),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Divider(
                color: Colors.green,
                thickness: 2,
              ),
            ),
            InkWell(
              onTap: () {
                //  launch("https://friendlytutors.co.uk/webapp/about-us");
                webUrl = "https://friendlytutors.co.uk/webapp/about-us";
                Navigator.pushNamed(context, WEB_VIEW);
              },
              child: ListTile(
                leading:
                    Container(height: 40, child: Image.asset("assets/d3.png")),
                title: Text(
                  "About Us",
                  style: TextStyle(fontSize: 18, color: Colors.green),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Divider(
                color: Colors.green,
                thickness: 2,
              ),
            ),
            InkWell(
              onTap: () {
                // launch("https://friendlytutors.co.uk/webapp/contact-us");
                webUrl = "https://friendlytutors.co.uk/webapp/contact-us";
                Navigator.pushNamed(context, WEB_VIEW);
              },
              child: ListTile(
                leading:
                    Container(height: 40, child: Image.asset("assets/d4.png")),
                title: Text(
                  "Contact Us",
                  style: TextStyle(fontSize: 18, color: Colors.green),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Divider(
                color: Colors.green,
                thickness: 2,
              ),
            ),
            InkWell(
              onTap: () {
                // launch("https://friendlytutors.co.uk/webapp/auth/login");
                webUrl = "https://friendlytutors.co.uk/webapp/auth/login";
                Navigator.pushNamed(context, WEB_VIEW);
              },
              child: ListTile(
                leading:
                    Container(height: 40, child: Image.asset("assets/d5.png")),
                title: Text(
                  "Login",
                  style: TextStyle(fontSize: 18, color: Colors.green),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Divider(
                color: Colors.green,
                thickness: 2,
              ),
            ),
            InkWell(
              onTap: () {
                launch("https://friendlytutors.co.uk/");
                // Url1.url = "https://friendlytutors.co.uk/";
                // Navigator.pushNamed(context, WEB_VIEW);
              },
              child: ListTile(
                leading: Container(
                  height: 40,
                  child: Image.asset(
                    "assets/d6.png",
                  ),
                ),
                title: Text(
                  "Open website",
                  style: TextStyle(fontSize: 18, color: Colors.green),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Divider(
                color: Colors.green,
                thickness: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
