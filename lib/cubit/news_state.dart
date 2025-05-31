part of 'news_cubit.dart';

@immutable
sealed class NewsState {}

final class NewsInitial extends NewsState {}

final class NewsLoading extends NewsState {}

final class NewsSuccess extends NewsState {
  final List<NewsModel> news;
  NewsSuccess({ required this.news});
}

final class NewsError extends NewsState {
  final String errorMessage;
  NewsError({ required this.errorMessage});
}
