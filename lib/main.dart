import 'package:flutter/material.dart';
import 'package:news_app_c11_maadi/style/Appstyle.dart';
import 'package:news_app_c11_maadi/ui/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppStyle.lightTheme,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName:(_)=>HomeScreen()
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}

