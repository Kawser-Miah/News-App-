import 'package:simple_news_app/0_data/datasources/local/app_database.dart';
import 'package:simple_news_app/0_data/datasources/local/dao/articles_model.dart';
import '../../0_data/datasources/news_remote_datasource.dart';
import '../../1_domain/entities/news_entity.dart';
import '../../1_domain/failures/failure.dart';
import '../../1_domain/repositories/news_repositories.dart';
import '../exceptions/exceptions.dart';
import 'package:dartz/dartz.dart';

import '../models/news_model.dart';

class NewsRepositoryIml implements NewsRepository {
  final NewsRemoteDatasource newsRemoteDatasource = NewsRemoteDatasourceImpl();
  @override
  Future<Either<Failure, NewsEntity>> getNewsFromDatasource() async {
    final database =
        await $FloorAppDatabase.databaseBuilder('newsDatabase.db').build();
    final dao = database.newsDao;
    try {
      final result = await newsRemoteDatasource.getRandomNewsFromApi();
      dao.deleteAllNews();
      dao.deleteAllNewsSource();

      for (var i in result.articles) {
        dao.insertNews(ArticlesModel(
            author: i.author,
            title: i.title,
            description: i.description,
            url: i.url,
            urlToImage: i.urlToImage,
            publishedAt: i.publishedAt,
            content: i.content));
        dao.insertNewsSource(Source(id: i.source?.id, name: i.source?.name));
      }
      return right(result);
    } on ServerException catch (_) {
      return left(ServerFailure());
    } catch (_) {
      final result = await newsRemoteDatasource.getRandomNewsFromDb(dao);
      return right(result);
    }
  }
}
