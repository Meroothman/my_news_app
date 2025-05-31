import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../api_service.dart';
import '../models/news_model.dart';
part 'news_state.dart';


class NewsCubit extends Cubit<NewsState> {
  NewsCubit(this.apiServices) : super(NewsInitial());
  final ApiServices apiServices ;
  List<NewsModel> news = [];
   Future <void> getNews( {required String category})async{
     try {
       emit(NewsLoading());
       news = await apiServices.getNewsData(category:category);
       emit(NewsSuccess(news:  news));
     } catch (e) {
       emit(NewsError( errorMessage: e.toString()));
     }
   }
}
