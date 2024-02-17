import 'package:equatable/equatable.dart';
import '../../0_data/models/news_model.dart';

class NewsEntity extends Equatable {
  final List<Articles> news;

  const NewsEntity({required this.news});

  @override
  List<Object?> get props => [news];
}
