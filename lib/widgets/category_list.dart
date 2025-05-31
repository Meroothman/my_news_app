
import 'package:app_news/models/category_model.dart';
import 'package:flutter/material.dart';

import '../screens/category_screen.dart';
import 'caregory_card.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final List <CategoryModel> categories = [
      CategoryModel(image: "assets/images/business.jpg", title:"business"),
      CategoryModel(image: "assets/images/entertainment.jpg", title: "entertainment"),
      CategoryModel(image: "assets/images/health.jpg", title: "health"),
      CategoryModel(image: "assets/images/news.jpg", title: "general"),
      CategoryModel(image: "assets/images/science.jpg", title: "science"),
      CategoryModel(image: "assets/images/technology.jpg", title:"technology"),
    ];
    return SizedBox(
      height: 100,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount:categories.length,itemBuilder: (context,index){
        return GestureDetector(
          onTap: (){
            Navigator.push(context,MaterialPageRoute(builder: (context){
              return CategoryScreen(category:categories[index].title);
            }));
          },
          child: CategoryCard(category:categories[index],
          ),
        );
      }),
    );
  }
}