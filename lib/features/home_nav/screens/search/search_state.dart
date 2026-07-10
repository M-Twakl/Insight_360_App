part of 'search_cubit.dart';


abstract class SearchState {

}

final class SearchInitial extends SearchState{

}

final class SearchLoading extends SearchState{

}

final class SearchSuccess extends SearchState{
  final List<ArticleModel> model;
  SearchSuccess(this.model);
}

final class SearchFailure extends SearchState{
  final String msg;
  SearchFailure(this.msg);
}
