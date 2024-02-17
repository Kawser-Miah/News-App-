import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../1_domain/failures/failure.dart';
import '../../../../1_domain/usecases/news_use_case.dart';
import 'news_event.dart';
import 'news_state.dart';
export 'news_event.dart';
export 'news_state.dart';

const serverFailureMessage = 'Ups, API Error.Please try again!';
const generalFailureMessage = 'Ups, Something gone wrong.Please try again!';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsUseCase newsUseCase = NewsUseCase();
  NewsBloc() : super(NewsInitialState()) {
    on<NewsFetchRequestEvent>((event, emit) async {
      emit(NewsLoadingState());

      final news = await newsUseCase.getNews();
      Future.delayed(const Duration(seconds: 3), () {});
      news.fold(
          (failure) =>
              emit(NewsErrorState(errorMessage: _mapFailureToMessage(failure))),
          (news) => emit(NewsLoadedState(news: news.news)));
    });
  }
  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return serverFailureMessage;
      default:
        return generalFailureMessage;
    }
  }
}
