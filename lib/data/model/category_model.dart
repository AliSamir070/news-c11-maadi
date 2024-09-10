import 'package:flutter/material.dart';

class CategoryModel{
  String id;
  String title;
  String imagePath;
  Color background;
  CategoryModel({required this.id,required this.title , required this.imagePath , required this.background});

  static List<CategoryModel> categories = [
    CategoryModel(id:"sports",title: "Sports", imagePath:"sports.png" , background:Color(0xffC91C22) ),
    CategoryModel(id: "general",title: "General", imagePath: "Politics.png",background: Color(0xff003E90)),
    CategoryModel(id: "health",title: "Health", imagePath: "health.png",background: Color(0xffED1E79)),
    CategoryModel(id: "business",title: "Business", imagePath: "bussines.png",background: Color(0xffCF7E48)),
    CategoryModel(id: "technology",title: "Technology", imagePath: "environment.png",background: Color(0xff4882CF)),
    CategoryModel(id: "science",title: "Science", imagePath: "science.png",background: Color(0xffF2D352)),
  ];

}