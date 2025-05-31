import 'package:app_news/models/news_model.dart';
import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  final NewsModel neW;
  const NewsCard({super.key, required this.neW});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            image: DecorationImage(
              image: NetworkImage(neW.image ??""),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(
          neW.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 10),
        Text(
          neW.subtitle??"",
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ],
    );
  }
}
