import 'package:flutter/material.dart';
import 'package:news_app/features/home_nav/screens/search/search_cubit.dart';
import '../../../../core/helpers/app_colors.dart';
import '../search_results/search_results_view.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 22.0),
          child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                      ),
                      prefixIcon: Icon(
                          Icons.search,
                          color: AppColors.lightGrey
                      ),
                      suffixIcon: Icon(
                        Icons.cancel_outlined,
                        color: AppColors.lightGrey,
                      ),
                      fillColor: AppColors.fillFormField,
                      filled: true,
                      hintText: 'Search',
                      hintStyle: TextStyle(
                        color: AppColors.lightGrey,
                        fontSize: 18,
                        fontWeight: FontWeight.w400
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.blueText)
                      )
                    ),
                    onFieldSubmitted: (value) {
                      if (value.isNotEmpty){
                        SearchCubit().searchNews(value);
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const SearchResultsScreen(),
                          ),
                        );
                      }
                    },
                  ),
                ),
                SizedBox(width: 15),
                Text(
                  'Cancel',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blueColor,
                  )
                )
              ],
            ),
        
        ),
      ),
    );
  }
}
