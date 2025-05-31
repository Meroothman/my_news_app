import 'package:app_news/models/category_model.dart';
import 'package:flutter/material.dart';


class CategoryCard extends StatelessWidget {
  final CategoryModel category;
  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        alignment: Alignment.center,
        width: 160,
        height: 85,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: AssetImage(category.image),
            fit: BoxFit.cover,
          ),
        ),
        child: Text(
          category.title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

