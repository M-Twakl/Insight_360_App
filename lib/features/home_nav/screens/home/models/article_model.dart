

class ArticleModel {
  String? author;
  String? title;
  String? description;
  String? urlToImage;
  String? publishedAt;
  String? content;


  ArticleModel(
  {
    this.author,
    this.title,
    this.description,
    this.publishedAt,
    this.urlToImage,
    this.content,
  });

  factory ArticleModel.fromJson(Map<String,dynamic>json){
    return ArticleModel(
      title: json['title'],
      description: json['description'],
      author: json['author'],
      publishedAt: json['publishedAt'],
      urlToImage: json['urlToImage'],
      content : json['content'],

    );
  }
}