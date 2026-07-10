import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/helpers/news_item.dart';

import '../../../../core/helpers/app_colors.dart';
import '../../../../core/helpers/app_text_styles.dart';
import '../search/search_cubit.dart';

class SearchResultsScreen extends StatelessWidget {
  const SearchResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.whiteColor,
            title: Text(
              'Search Results',
              style: AppTextStyles.kText20Black,
            ),
            centerTitle: true,
            leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(Icons.arrow_back_ios_new_rounded,
                  color: AppColors.blackColor),
            ),
          ),
          body: BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
              if (state is SearchLoading){
                return const Center(child: CircularProgressIndicator());
              }

              if (state is SearchFailure){
                return Center(child: Text(state.msg));
              }

              if (state is SearchSuccess) {
                if (state.model.isEmpty){
                  return const Center(
                    child: Text(
                      'No results found',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  );
                }
                return ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemCount: state.model.length,
                    separatorBuilder: (context, index) => SizedBox(height: 20),
                    itemBuilder: (context, index) {
                      final article = state.model[index];

                      return NewsItem(
                          img: article.urlToImage ??
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgV8Qs75tF698K52TZz6Y0SZPHT1zS4etgAGIdm3o0OWL24QBssLbdVyqV&s=10",
                          description: article.description ?? "No Description",
                          author: article.author?? "Unknown",
                          publishedAt: article.publishedAt ?? "Unknown Date"
                      );

                    }


                );
              }
              return SizedBox();
            },
          )
      ),
    );
  }
}
