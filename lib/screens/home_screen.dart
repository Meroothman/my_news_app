import 'package:flutter/material.dart';

import '../widgets/category_list.dart';
import '../widgets/news_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          " What about news today?",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [CategoryList(), NewsList(category: "general")],
        ),
      ),
    );
  }
}
