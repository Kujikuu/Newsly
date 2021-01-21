import 'package:Newsly/screens/main/home.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboard extends StatefulWidget {
  @override
  _OnboardState createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  int _current = 0;

  List imgList = [
    'assets/onboard/News1.png',
    'assets/onboard/News2.png',
    'assets/onboard/News3.png'
  ];

  List titleList = [
    'Global News',
    'Are you informed?',
    'Your personal newspaper'
  ];

  List descList = [
    'breaking news & current latest Global news headlines',
    'Have you informed definition in the global news.',
    'Our goal is to build the perfect personalized newspaper for every person'
  ];

  final controller = PageController(viewportFraction: 0.8);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [FlatButton(onPressed: _letBegin, child: Text('Skip'))],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 20),
              height: MediaQuery.of(context).size.height * .70,
              child: CarouselSlider.builder(
                  itemCount: imgList.length,
                  itemBuilder: (context, i) {
                    return Column(
                      children: [
                        Text(
                          titleList[i],
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          descList[i],
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                        Image.asset(
                          imgList[i],
                          fit: BoxFit.cover,
                        ),
                      ],
                    );
                  },
                  options: CarouselOptions(
                    autoPlay: true,
                    height: MediaQuery.of(context).size.height,
                    viewportFraction: 1,
                    autoPlayInterval: Duration(seconds: 3),
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    },
                  )),
            ),
            Container(
              child: AnimatedSmoothIndicator(
                activeIndex: _current,
                count: 3,
                effect: ExpandingDotsEffect(expansionFactor: 2),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.07),
              width: MediaQuery.of(context).size.width * .60,
              height: 50,
              child: RaisedButton(
                onPressed: _letBegin,
                child: Text(
                  'Let`s Begin',
                  style: TextStyle(fontSize: 16),
                ),
                color: Colors.blue,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _letBegin() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }
}
