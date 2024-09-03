import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app_c11_maadi/model/category_model.dart';
import 'package:news_app_c11_maadi/ui/categories/widgets/category_item.dart';

class CategoriesTab extends StatelessWidget {
  void Function(String) onCategoryClick;
  CategoriesTab({super.key,required this.onCategoryClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 35,
        top: 35,
        right: 35
      ),
      child: Column(
        children: [
          Text("Pick your category of interest",style: Theme.of(context).textTheme.headlineMedium,),
          SizedBox(height: 20,),
          Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  crossAxisSpacing: 25,
                  mainAxisSpacing: 25,
                  childAspectRatio: 1/1.3
                ),
                itemBuilder: (context, index) => CategoryItem(
                  onTab: (){
                    onCategoryClick(CategoryModel.categories[index].id);
                  },
                  categoryModel: CategoryModel.categories[index],index: index,),
                itemCount: CategoryModel.categories.length,
            ),
          )
        ],
      ),
    );
  }
}
