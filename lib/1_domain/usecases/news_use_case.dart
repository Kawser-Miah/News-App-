import 'package:dartz/dartz.dart';
import '../../0_data/repositories/news_repository_iml.dart';
import '../entities/news_entity.dart';
import '../failures/failure.dart';

class NewsUseCase {
  final newsRepository = NewsRepositoryIml();
  Future<Either<Failure, NewsEntity>> getNews() async {
    return newsRepository.getNewsFromDatasource();
  }
}
