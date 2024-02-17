import'package:equatable/equatable.dart';

abstract class NewsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class NewsFetchRequestEvent extends NewsEvent{}
