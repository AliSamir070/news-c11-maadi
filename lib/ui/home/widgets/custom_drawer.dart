import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app_c11_maadi/ui/home/widgets/drawer_item.dart';
typedef onTabClick = void Function(MenuTab);
class CustomDrawer extends StatelessWidget {
  onTabClick onTab;
   CustomDrawer({super.key,required this.onTab});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 45),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary
            ),
            child: Text("News App!",style: Theme.of(context).textTheme.headlineLarge,),
          ),
          SizedBox(height: 16,),
          DrawerItem(title: "Categories", image: "assets/images/menu.svg",onPress: () {
            onTab(MenuTab.Categories);
          },),
          DrawerItem(title: "Settings", image: "assets/images/settings.svg",onPress: () {
            onTab(MenuTab.Settings);
          },),
        ],
      ),
    );
  }
}

enum MenuTab{
  Categories,
  Settings
}