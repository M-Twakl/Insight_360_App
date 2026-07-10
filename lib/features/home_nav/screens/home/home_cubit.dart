import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'models/article_model.dart';


part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  
  final dio = Dio();
  
  Future<void> getHomeArticles() async {
    try {
      emit(HomeLoading());

      final Response response =await dio.get(
        'https://newsapi.org/v2/top-headlines',
        queryParameters: {
          'country':"us",
          'apiKey':'6a7cea1520b843238244c252b0539ebc'
        }
      );

      final articles= response.data['articles'] as List;
      final data = articles.map(
          (art) => ArticleModel.fromJson(art)).toList();

      emit(HomeSuccess(data));

    }on DioException catch(e){
      emit(HomeFailure(e.message?? 'error found'));
    }

    catch(e){
      emit(HomeFailure(e.toString()));
    }
  }

}