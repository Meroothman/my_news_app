// // import 'package:app_news/api_service.dart';
// // import 'package:app_news/models/news_model.dart';
// // import 'package:dio/dio.dart';
// // import 'package:flutter/material.dart';
// //
// // import 'news_card.dart';
// //
// // class NewsList extends StatefulWidget {
// //   final String category;
// //   const NewsList({super.key, required this.category});
// //
// //   @override
// //   State<NewsList> createState() => _NewsListState();
// // }
// //
// // class _NewsListState extends State<NewsList> {
// //   List <NewsModel> news =[] ;
// //   bool isLoading = true;
// //   @override
// //   void initState() {
// //     super.initState();
// //     getNews();
// //   }
// //    Future<void> getNews()async{
// //     news = await ApiServices(Dio()).getNewsData(category:widget.category);
// //     isLoading = false;
// //     setState(() {
// //     });
// //   }
// //   @override
// //   Widget build(BuildContext context) {
// //     return isLoading? Center(child: CircularProgressIndicator()):ListView.builder(
// //       physics: NeverScrollableScrollPhysics(),
// //       shrinkWrap: true,
// //       itemCount:news.length,
// //       itemBuilder: (context, index) {
// //         return NewsCard(neW:news[index],
// //         );
// //       },
// //     );
// //   }
// // }
//
//
// import 'package:app_news/cubit/news_cubit.dart';
// import 'package:app_news/models/news_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import 'news_card.dart';
//
// class NewsList extends StatelessWidget {
//   final String category;
//
//   const NewsList({super.key, required this.category});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<NewsCubit ,NewsState>(
//       builder: (context, state)
//     {
//       if (state is NewsLoading) {
//         return Center(
//           child: CircularProgressIndicator(),
//         );
//       }
//       else if (state is NewsError) {
//         return Center(
//           child: Text(state.errorMessage),
//         );
//       }
//       else if (state is NewsSuccess) {
//         List<NewsModel> news = BlocProvider
//             .of<NewsCubit>(context)
//             .news;
//         return ListView.builder(
//           physics: NeverScrollableScrollPhysics(),
//           shrinkWrap: true,
//           itemCount: news.length,
//           itemBuilder: (context, index) {
//             return NewsCard(neW: news[index],
//             );
//           },
//         );
//       }
//       else {
//         return Center(
//           child: Text("No news found"),
//         );
//       }
//     },
//     );
//   }
// }







import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/news_cubit.dart';
import '../models/news_model.dart';
import 'news_card.dart';

class NewsList extends StatefulWidget {
  final String category;
  const NewsList({super.key, required this.category});

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  @override
  void initState() {
    super.initState();
    // Call getNews once when the widget is first created
    BlocProvider.of<NewsCubit>(context).getNews(category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        if (state is NewsLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is NewsError) {
          return Center(child: Text(state.errorMessage));
        } else if (state is NewsSuccess) {
          List<NewsModel> news = state.news;
          return ListView.builder(

            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: news.length,
            itemBuilder: (context, index) {
              return NewsCard(neW: news[index]);
            },
          );
        } else {
          return Center(child: Text("No news found"));
        }
      },
    );
  }
}
