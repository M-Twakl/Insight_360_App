import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../home/models/article_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super (SearchInitial());

  final dio = Dio();

  Future<void> searchNews(String query) async {
    try {
      emit(SearchLoading());

      final Response response = await dio.get(
          'https://newsapi.org/v2/top-headlines',
          queryParameters: {
            'q': query,
            'apiKey': '6a7cea1520b843238244c252b0539ebc'
          }
      );


      final articles = response.data['articles'] as List;
      final data = articles.map(
              (art) => ArticleModel.fromJson(art)).toList();

      emit(SearchSuccess(data));

    } on DioException catch(e) {
      emit(SearchFailure(e.message ?? 'error found'));
    } catch(e) {
      emit(SearchFailure(e.toString()));
    }
  }



}