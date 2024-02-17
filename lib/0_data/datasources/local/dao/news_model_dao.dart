import 'package:floor/floor.dart';
import '../../../models/news_model.dart';
import 'articles_model.dart';

@dao
abstract class NewsDao {
  //Articles Table
  @Query('SELECT * FROM ArticlesModel')
  Future<List<ArticlesModel>> getAllNewsFromDb();

  @Query('DELETE FROM ArticlesModel')
  Future<int?> deleteAllNews();

  @insert
  Future<int?> insertNews(ArticlesModel articlesModel);

//Source Table
  @Query('SELECT * FROM Source')
  Future<List<Source>> getAllNewsSourceFromDb();

  @Query('DELETE FROM Source')
  Future<int?> deleteAllNewsSource();

  @insert
  Future<int?> insertNewsSource(Source source);
}
