import 'package:floor/floor.dart';
import 'package:simple_news_app/0_data/datasources/local/dao/articles_model.dart';
import '../../models/news_model.dart';
import 'dao/news_model_dao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';


part 'app_database.g.dart';

@Database(version: 1, entities: [ArticlesModel,Source])

abstract class AppDatabase extends FloorDatabase{
  NewsDao get newsDao;
}