import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/helpers/app_colors.dart';
import 'package:news_app/core/helpers/app_text_styles.dart';
import 'package:news_app/core/helpers/news_item.dart';
import 'package:news_app/features/home_nav/screens/search/search_view.dart';
import '../details/details_view.dart';
import 'package:news_app/features/widgets/category_item.dart';
import 'home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      HomeCubit()..getHomeArticles(),
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBar(
          backgroundColor: AppColors.whiteColor,
          centerTitle: true,
          leading: Icon(
            Icons.menu, color: AppColors.blackColor,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: IconButton(
                icon: Icon(Icons.search),
                color: AppColors.blackColor,
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => SearchScreen()
                  ),
                )
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(Icons.notifications_none_outlined, color: AppColors.blackColor),
            )
          ],
        ),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state is HomeLoading){
                  return Center(child: CircularProgressIndicator(),);
                }
                if (state is HomeFailure){
                  return Center(child: Text(state.msg),);
                }
                if (state is HomeSuccess) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Breaking News',
                              textAlign: TextAlign.left,
                              style: AppTextStyles.kText20Black,
                            ),
                            Text(
                              'Show More',
                              textAlign: TextAlign.right,
                              style: AppTextStyles.kText16Blue,
                            )
                          ]
                      ),
                      SizedBox(height: 5),
                      Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: NetworkImage(state.model[0].urlToImage??"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgV8Qs75tF698K52TZz6Y0SZPHT1zS4etgAGIdm3o0OWL24QBssLbdVyqV&s=10"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                        Expanded(
                          child: ListView.separated(
                            itemCount: 1,
                            scrollDirection: Axis.horizontal,
                            separatorBuilder: (context, index) => Divider(),
                            itemBuilder: (context, index) =>
                                Row(
                                  children: [
                                    CategoryItem(title: 'All',isSelected: true),
                                    CategoryItem(title: 'Politics'),
                                    CategoryItem(title: 'Sport'),
                                    CategoryItem(title: 'Education'),
                                    CategoryItem(title: 'Business'),
                                    CategoryItem(title: 'Technology'),
                                    CategoryItem(title: 'arts'),
                                    CategoryItem(title: 'Crime'),
                                  ],
                                ),
                          ),
                        ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'News For You',
                              style: AppTextStyles.kText20Black,
                            ),
                            Text(
                              'Show More',
                              style: AppTextStyles.kText16Blue,
                            )
                          ]
          
                      ),
                      SizedBox(height: 5),
                      Expanded(
                        flex: 4,
                        child: ListView.separated(
                          itemCount: state.model.length - 1,
                          itemBuilder: (context, index) =>
                              GestureDetector(
                                onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) =>
                                      DetailsScreen(model: state.model[index+1]),)
                                ),
                                child: NewsItem(
                                  img: state.model[index+1].urlToImage??"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgV8Qs75tF698K52TZz6Y0SZPHT1zS4etgAGIdm3o0OWL24QBssLbdVyqV&s=10",
                                  author: state.model[index+1].author??"Generated",
                                  description: state.model[index+1].description??"Generated",
                                  publishedAt: state.model[index+1].publishedAt??"UnKnown Date",
                                
                                ),
                              ),
                          separatorBuilder: (context, index) => Divider(),
                        ),
                      )
                    ],
                  );
                }
                return SizedBox();
              },
            ),
        ),
      ),
    );
  }
}
