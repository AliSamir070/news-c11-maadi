import 'package:flutter/material.dart';
import 'package:news_app_c11_maadi/ui/categories/categories_tab.dart';
import 'package:news_app_c11_maadi/ui/category_details/category_details.dart';
import 'package:news_app_c11_maadi/ui/home/widgets/custom_drawer.dart';
import 'package:news_app_c11_maadi/ui/settings/settings_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Widget selectedWidget;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedWidget = CategoriesTab(onCategoryClick: selectCategoryItem,);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(image: AssetImage("assets/images/pattern.png"))
      ),
      child: Scaffold(
        drawer: CustomDrawer(onTab: selectDrawerWidget,),
        appBar: AppBar(
          title: Text("News App"),
        ),
        body: selectedWidget,
      ),
    );
  }

  selectDrawerWidget(MenuTab tab){
    Navigator.pop(context);
    switch(tab){
      case MenuTab.Categories:{
        selectedWidget = CategoriesTab(onCategoryClick: selectCategoryItem,);
      }
      case MenuTab.Settings:{
        selectedWidget = SettingsTab();
      }
    }
    setState(() {

    });
  }
  selectCategoryItem(String categoryId){
    selectedWidget = CategoryDetailsTab(categoryId: categoryId,);
    setState(() {

    });
  }

}
