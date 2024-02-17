import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:simple_news_app/0_data/datasources/local/app_database.dart';
import '2_application/core/services/theme.dart';
import '2_application/core/services/routes_service.dart';
import '2_application/core/services/theme_service.dart';
import '2_application/page/login/bloc/sign_in_bloc.dart';
import '2_application/page/news_page/news_bloc/news_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final database = await $FloorAppDatabase.databaseBuilder('newsDatabase.db').build();
  final dao = database.newsDao;
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeService(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(builder: (context, themeService, child) {
      return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => SignInBloc()),
          BlocProvider(create: (context)=> NewsBloc()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode:
              themeService.isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          // home: NewsHomePage(),
          onGenerateRoute: Routes.onGenerateRoute,
          initialRoute: 'splash_page',
        ),
      );
    });
  }
}
