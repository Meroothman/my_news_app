import 'package:app_news/widgets/news_list.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  final String category;
  const CategoryScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, // change this to the desired color
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("$category News" ,style: TextStyle(color: Colors.white ,fontSize: 24),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [NewsList(category:category)],
        ),
      ),
    );
  }
}
