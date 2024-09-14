import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:news_app_c11_maadi/DI/di.config.dart';
import 'package:news_app_c11_maadi/data/model/NewsResponse/Articles.dart';
import 'package:news_app_c11_maadi/data/model/NewsResponse/NewsResponse.dart';
import 'package:news_app_c11_maadi/data/model/SourcesResponse/Source.dart';
import 'package:news_app_c11_maadi/style/Appstyle.dart';
import 'package:news_app_c11_maadi/ui/home/home_screen.dart';
import 'package:path_provider/path_provider.dart';

import 'DI/di.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  final Directory appDocumentsDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentsDir.path);
  Hive.registerAdapter(NewsResponseAdapter());
  Hive.registerAdapter(ArticleAdapter());
  Hive.registerAdapter(SourceAdapter());
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

