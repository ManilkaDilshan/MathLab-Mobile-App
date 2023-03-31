import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mathlab/routes.dart';
import 'package:mathlab/root_page.dart';
import 'package:mathlab/screens/splash/splash_screen.dart';
import 'package:mathlab/utils/colors.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Math Lab',
      theme: theme(),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }

  ThemeData theme() {
    return ThemeData(
      primarySwatch: Colors.purple,
      appBarTheme: const AppBarTheme(
        color: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(color: AppColors.lightTextColor)
      ),
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: Colors.white,
    );
  }
}

