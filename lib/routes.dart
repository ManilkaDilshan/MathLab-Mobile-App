import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:mathlab/screens/complete_profile/complete_profile.dart';
import 'package:mathlab/screens/detail_screen/game_detail.dart';
import 'package:mathlab/screens/forgot_password/forgot_password_screen.dart';
import 'package:mathlab/root_page.dart';
import 'package:mathlab/screens/login/login.dart';
import 'package:mathlab/screens/login_success/login_success_screen.dart';
import 'package:mathlab/screens/qr_scanner/qr_scanner.dart';
import 'package:mathlab/screens/sign_up/sign_up.dart';
import 'package:mathlab/screens/splash/splash_screen.dart';


final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName:(context) => const SplashScreen(),
  LogIn.routeName:(context) => const LogIn(),
  ForgotPassword.routeName:(context) => const ForgotPassword(),
  LoginSuccessScreen.routeName:(context) => const LoginSuccessScreen(),
  SignUp.routeName:(context) => const SignUp(),
  CompleteProfile.routeName:(context) => const CompleteProfile(),
  RootPage.routeName:(context) => const RootPage(),
  GameDetail.routeName:(context, {arguments}) => GameDetail(gameId: arguments['gameId']),
  QRScanner.routeName:(context) => const QRScanner(),
};
