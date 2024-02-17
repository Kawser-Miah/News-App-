import 'package:simple_news_app/0_data/datasources/local/dao/news_model_dao.dart';
import '../models/news_model.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../exceptions/exceptions.dart';

abstract class NewsRemoteDatasource {
  Future<NewsModel> getRandomNewsFromApi();
  Future<NewsModel> getRandomNewsFromDb(NewsDao newsDao);
}

class NewsRemoteDatasourceImpl implements NewsRemoteDatasource {
  final Dio dio = Dio();

  @override
  Future<NewsModel> getRandomNewsFromApi() async {
    Response response = await dio.get(
        "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=8e3b29253cb4420b8fd2829cac5c70b3");
    dio.interceptors.add(PrettyDioLogger());

    if (response.statusMessage != 'OK') {
      throw ServerException();
    } else {
      final responseBody = response.data;
      return NewsModel.fromJson(responseBody);
    }
  }

  @override
  Future<NewsModel> getRandomNewsFromDb(NewsDao newsDao) async {
    List<Articles> news = [];
    final newsDetails = await newsDao.getAllNewsFromDb();
    final newsSource = await newsDao.getAllNewsSourceFromDb();

    for (int i = 0; i < newsDetails.length; i++) {
      news.add(Articles(
          source: newsSource[i],
          author: newsDetails[i].author,
          title: newsDetails[i].title,
          description: newsDetails[i].description,
          url: newsDetails[i].url,
          urlToImage: newsDetails[i].urlToImage,
          publishedAt: newsDetails[i].publishedAt,
          content: newsDetails[i].content));
    }
    return NewsModel(status: '', totalResults: 0, articles: news);
  }
}
