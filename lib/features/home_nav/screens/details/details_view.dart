import 'package:flutter/material.dart';
import 'package:news_app/core/helpers/app_text_styles.dart';
import '../../../../core/helpers/app_colors.dart';
import '../home/models/article_model.dart';



class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.model});

  final ArticleModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        title:  Text(
          'News Detail',
          style: AppTextStyles.kText20Black,
        ),
          centerTitle: true,
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.blackColor),
          ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(Icons.bookmark_border_rounded, color: AppColors.blackColor),
          )
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ///======image===============
              ClipRRect(
                borderRadius: BorderRadiusGeometry.all(Radius.circular(18)),
                child: Image.network(
                  model.urlToImage ?? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgV8Qs75tF698K52TZz6Y0SZPHT1zS4etgAGIdm3o0OWL24QBssLbdVyqV&s=10',
                ),
              ),
              SizedBox(height: 10),

              ///======name===============
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    model.author ?? 'Generated',
                    style: AppTextStyles.kText14Black
                  ),
                  Row(
                    spacing: 2,
                    children: [
                      Icon(Icons.favorite_border_outlined,color: AppColors.blackColor),
                      Text('204',style: AppTextStyles.kText14Black)
                    ],
                  )
                ],
              ),

              SizedBox(height: 10),

              ///======description===============
              Column(
                children: [
                  Text(
                    model.title ?? 'Generated Title',
                    style: AppTextStyles.kText18Black,
                  ),
                  SizedBox(height: 20),
                  Text(
                    model.description ?? 'No Description',
                    style: AppTextStyles.kText12Black
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
