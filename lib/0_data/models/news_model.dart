import '../../1_domain/entities/news_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

class NewsModel extends NewsEntity {
  final String status;
  final int totalResults;
  final List<Articles> articles;

  const NewsModel(
      {required this.status,
      required this.totalResults,
      required this.articles})
      : super(news: articles);

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    var articlesList = <Articles>[];

    if (json['articles'] != null) {
      json['articles'].forEach((v) {
        articlesList.add(Articles.fromJson(v));
      });
    }
    return NewsModel(
        status: json['status'] ?? 'Default Value',
        totalResults: json['totalResults'] ?? 0,
        articles: articlesList);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['totalResults'] = totalResults;
    data['articles'] = articles.map((v) => v.toJson()).toList();
    return data;
  }
}

class Articles {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Articles(
      {this.source,
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});

  Articles.fromJson(Map<String, dynamic> json) {
    source = json['source'] != null ? Source.fromJson(json['source']) : null;
    author = json['author'] ?? 'Anonymous';
    title = json['title'] ?? 'Default Value';
    description = json['description'] ?? 'Description was deleted.';
    url = json['url'] ?? 'Default Value';
    urlToImage = json['urlToImage'] ??
        'https://nachamafrica.org/wp-content/themes/consultix/images/no-image-found-360x260.png';
    publishedAt = json['publishedAt'] ?? 'Default Value';
    content = json['content'] ?? 'Content was deleted.';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (source != null) {
      data['source'] = source!.toJson();
    }
    data['author'] = author;
    data['title'] = title;
    data['description'] = description;
    data['url'] = url;
    data['urlToImage'] = urlToImage;
    data['publishedAt'] = publishedAt;
    data['content'] = content;
    return data;
  }
}

@entity
class Source{
  @PrimaryKey(autoGenerate: true)
  int? tableId;

  String? id;
  String? name;

  Source({this.tableId, this.id, this.name});

  Source.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 'Default Value';
    name = json['name'] ?? 'Default Value';
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
