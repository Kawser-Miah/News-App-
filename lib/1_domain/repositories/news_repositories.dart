import 'package:dartz/dartz.dart';
import '../entities/news_entity.dart';
import '../failures/failure.dart';

abstract class NewsRepository {
  Future<Either<Failure, NewsEntity>> getNewsFromDatasource();
}
