import 'package:flutter/material.dart';
import 'package:news_app/core/helpers/app_colors.dart';
import 'package:news_app/core/helpers/app_text_styles.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem({super.key,
  required this.title, this.isSelected=false
  });

  final String title;
  bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.only(right: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.orangeColor : AppColors.whiteColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected ? AppColors.orangeColor : AppColors.blackColor
        ),
      ),
      child: Text(
        title,
        style: AppTextStyles.kText16Black,
      ),
    );
  }
}
