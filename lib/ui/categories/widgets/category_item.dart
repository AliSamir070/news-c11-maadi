import 'package:flutter/material.dart';
import 'package:news_app_c11_maadi/model/category_model.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel categoryModel;
  final int index;
  final void Function() onTab;
  const CategoryItem({super.key,required this.categoryModel,required this.index,required this.onTab});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTab,
      child: Container(
        decoration: BoxDecoration(
          color: categoryModel.background,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(25),
            topLeft: Radius.circular(25),
            bottomLeft: index.isEven ? Radius.circular(25):Radius.zero,
            bottomRight: index.isEven ? Radius.zero : Radius.circular(25)
          )
        ),
        child: Column(
          children: [
            Image.asset("assets/images/${categoryModel.imagePath}",
              height: MediaQuery.of(context).size.height*0.15,
              fit: BoxFit.fitHeight,
            ),
            SizedBox(height: 10,),
            Text(categoryModel.title,style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w400
            ),)
          ],
        ),
      ),
    );
  }
}
