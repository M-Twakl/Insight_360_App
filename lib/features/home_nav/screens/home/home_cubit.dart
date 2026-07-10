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
          'apiKey':'d8a0d007adc448fcb3d02c7441e078cc'
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