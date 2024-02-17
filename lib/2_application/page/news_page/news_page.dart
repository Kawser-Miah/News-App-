import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/services/theme_service.dart';
import '../news_page/widgets/list_view_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../news_page/news_bloc/news_bloc.dart';
import '../news_page/widgets/error_message.dart';
import 'drawer_menu.dart';

class NewsHomePage extends StatelessWidget {
  final String email;
  const NewsHomePage({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    // BlocProvider.of<NewsBloc>(context).add(NewsFetchRequestEvent());
    final themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        // centerTitle: true,
        title: Text(
          "Home Page",
          style: themeData.textTheme.displayMedium,
        ),
        actions: [
          Switch(
              value: Provider.of<ThemeService>(context).isDarkModeOn,
              onChanged: (_) {
                Provider.of<ThemeService>(context, listen: false).toggleTheme();
              })
        ],
      ),
      drawer: DrawerMenu(email: email,),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: RefreshIndicator(
          onRefresh: () async{BlocProvider.of<NewsBloc>(context).add(NewsFetchRequestEvent());},
          child: BlocBuilder<NewsBloc, NewsState>(
            builder: (context, state) {
              if (state is NewsInitialState) {
                return CircularProgressIndicator(
                  color: themeData.colorScheme.secondary,
                );
              } else if (state is NewsLoadingState) {
                return Center(
                  child: CircularProgressIndicator(
                    color: themeData.colorScheme.secondary,
                  ),
                );
              } else if (state is NewsLoadedState) {
                return ListViewScreen(
                  news: state.news,
                );
              } else if (state is NewsErrorState) {
                return ErrorMessage(errorMessage: state.errorMessage);
              }
              return const ErrorMessage(
                errorMessage: 'Uuups something gone wrong!!!',
              );
            },
          ),
        ),
        // child: ErrorMessage(),
      ),
    );
  }
}
