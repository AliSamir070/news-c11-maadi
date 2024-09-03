import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
typedef onDrawerClick = void Function();
class DrawerItem extends StatelessWidget {
  final String image;
  final String title;
  final onDrawerClick onPress;
  const DrawerItem({super.key,required this.title , required this.image,required this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onPress();
      },
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            SvgPicture.asset(image),
            SizedBox(width: 10,),
            Text(title,style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: Theme.of(context).colorScheme.secondary
            ),)
          ],
        ),
      ),
    );
  }
}
