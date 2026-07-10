import 'package:flutter/material.dart';
import 'package:news_app/core/helpers/app_text_styles.dart';

import 'format_date.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({super.key,
    required this.img,
    required this.description,
    required this.author,
    required this.publishedAt
  });


  final String img;
  final String description;
  final String author;
  final String publishedAt;



  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                img,
                fit: BoxFit.cover,
                height: 90
              ),
            ),
          ),
        SizedBox(width: 15),
        Expanded(
          flex: 4,
          child: Column(
            spacing: 5,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  author,
                  style: AppTextStyles.kText14Black
              ),
              Text(
                description,
                style: AppTextStyles.kText12Black,
                maxLines: 3,
                overflow: TextOverflow.ellipsis
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                    formatMyDate(publishedAt),
                    style: AppTextStyles.kText12Grey
                  ),
              ),
            ],
          ),
        )
    ]
        )
    );
  }
}
