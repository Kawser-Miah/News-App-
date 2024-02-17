import 'package:floor/floor.dart';

@entity
class ArticlesModel {
  @PrimaryKey(autoGenerate: true)
  final int? tableId;

  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  ArticlesModel(
      {this.tableId,
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});
}
