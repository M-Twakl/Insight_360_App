import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/helpers/app_text_styles.dart';
import 'package:news_app/features/home_nav/screens/home/home_view.dart';
import 'package:news_app/features/home_nav/screens/search/search_view.dart';
import '../../core/helpers/app_colors.dart';

class HomeVav extends StatefulWidget {
  const HomeVav({super.key});

  @override
  State<HomeVav> createState() => _HomeVavState();
}

class _HomeVavState extends State<HomeVav> {

  int currentIndex= 0;
  List<Widget>screens =[
    HomeScreen(),
    SearchScreen(),
    Center(child: Text('شاشة الأخبار')),
    Center(child: Text('الشاشة الشخصية')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      bottomNavigationBar: CurvedNavigationBar(
        color: AppColors.primaryColor,
        backgroundColor: Colors.transparent,
        items: [
          CurvedNavigationBarItem(
            child: Icon(Icons.home, color: AppColors.whiteColor,),
            label: 'Home',
            labelStyle: AppTextStyles.kText16White
          ),

          CurvedNavigationBarItem(
            child: Icon(Icons.search, color: AppColors.whiteColor,),
            label: 'Search',
            labelStyle: AppTextStyles.kText16White
          ),

          CurvedNavigationBarItem(
            child: Icon(Icons.newspaper, color: AppColors.whiteColor),
            label: 'Feed',
            labelStyle: AppTextStyles.kText16White
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.perm_identity, color: AppColors.whiteColor),
            label: 'Personal',
            labelStyle: AppTextStyles.kText16White
          ),
        ],
        index: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex=value;
          });
        },
        buttonBackgroundColor: AppColors.orangeColor,
      ),
      body: screens[currentIndex],
    );
  }
}
