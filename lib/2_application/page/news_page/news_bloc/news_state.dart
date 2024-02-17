import 'package:equatable/equatable.dart';
import '../../../../0_data/models/news_model.dart';

abstract class NewsState extends Equatable {
  @override
  List<Object> get props => [];
}

class NewsInitialState extends NewsState {}

class NewsLoadingState extends NewsState {}

class NewsLoadedState extends NewsState {
  final List<Articles> news;
  NewsLoadedState({required this.news});
}

class NewsErrorState extends NewsState {
  final String errorMessage;
  NewsErrorState({required this.errorMessage});
}
