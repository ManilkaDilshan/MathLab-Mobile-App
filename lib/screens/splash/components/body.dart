import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:mathlab/screens/login/login.dart';
import 'package:mathlab/utils/colors.dart';
import 'package:mathlab/widgets/default_button.dart';
import 'package:mathlab/utils/dimensions.dart';

import 'splash_content.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  PageController pageController = PageController();
  double _currentPageValue = 0.0;

  List<Map> splashData = [
    {'text': "Explore games and enjoy", 'image': "assets/images/img1.png"},
    {
      'text': "Create your own favourite list",
      'image': "assets/images/img2.png"
    },
    {'text': "Share your feedbacks", 'image': "assets/images/img3.png"},
  ];

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
                flex: 3,
                child: PageView.builder(
                    controller: pageController,
                    itemCount: splashData.length,
                    itemBuilder: (context, position) => SplashContent(
                        text: splashData[position]["text"],
                        image: splashData[position]["image"]))),
            Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20)),
                  child: Column(
                    children: [
                      const Spacer(),
                      DotsIndicator(
                        dotsCount: splashData.length,
                        position: _currentPageValue,
                        onTap: (position) {
                          pageController.animateToPage(position.floor(),
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeInOut);
                        },
                        decorator: DotsDecorator(
                          activeColor: AppColors.primaryColor,
                          size: const Size.square(9.0),
                          activeSize: const Size(18.0, 9.0),
                          activeShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                        ),
                      ),
                      const Spacer(
                        flex: 3,
                      ),
                      DefaultButton(
                          text: 'Continue',
                          press: () {
                            Navigator.pushNamed(context, LogIn.routeName);
                          },
                          backgroundColor: AppColors.primaryColor),
                      const Spacer()
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
