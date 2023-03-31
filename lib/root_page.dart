import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mathlab/screens/home_page/home_page.dart';
import 'package:mathlab/screens/login/login.dart';
import 'package:mathlab/screens/login_success/login_success_screen.dart';
import 'package:mathlab/screens/qr_scanner/qr_scanner.dart';
import 'package:mathlab/screens/sign_up/sign_up.dart';
import 'package:mathlab/utils/colors.dart';
import 'package:mathlab/utils/dimensions.dart';
import 'package:page_transition/page_transition.dart';

class RootPage extends StatefulWidget {
  static String routeName = '/route';
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _bottomNavIndex = 0;

  List<Widget> pages = const [
    HomePage(),
    SignUp(),
    LogIn(),
    LoginSuccessScreen()
  ];

  List<IconData> iconList = [
    Icons.home_outlined,
    Icons.favorite_outline,
    Icons.send_outlined,
    Icons.person_outline,
  ];

  List<String> titleList = [
    'Home',
    'Favorite',
    'Contact',
    'Profile',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          textAlign: TextAlign.start,
          titleList[_bottomNavIndex],
          style: TextStyle(
            color: AppColors.lightTextColor,
            fontWeight: FontWeight.w500,
            fontSize: getProportionateScreenWidth(20),
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
      ),
      body: IndexedStack(
        index: _bottomNavIndex,
        children: pages,
      ),
      floatingActionButton: SizedBox(
        height: getProportionateScreenHeight(65),
        width: getProportionateScreenHeight(65),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                PageTransition(
                    child: const QRScanner(),
                    type: PageTransitionType.bottomToTop));
          },
          backgroundColor: AppColors.primaryColor,
          child: Icon(
            Icons.qr_code_scanner_outlined,
            size: getProportionateScreenWidth(35),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        height: getProportionateScreenHeight(65),
        icons: iconList,
        activeIndex: _bottomNavIndex,
        onTap: (index) {
          setState(() {
            _bottomNavIndex = index;
          });
        },
        splashColor: AppColors.primaryColor,
        activeColor: AppColors.primaryColor,
        inactiveColor: Colors.black38,
        gapLocation: GapLocation.center,
      ),
    );
  }
}
