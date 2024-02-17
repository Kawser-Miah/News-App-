import 'package:flutter/material.dart';
import '../../page/login/login_page.dart';
import '../../page/news_page/widgets/news_details_page.dart';
import '../../page/login/widgets/forget_pass_page.dart';
import '../../../splash_page.dart';

class Routes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'splash_page':
        return MaterialPageRoute(builder: (context) => const SplashPage());
      case '/login_page':
        return MaterialPageRoute(builder: (context) => const LoginPage());
      case '/news_details_page':
        Map<String, dynamic> arguments =
            settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
            builder: (context) => NewsDetails(
                title: arguments['title'],
                url: arguments['url'],
                author: arguments['author'],
                source: arguments['source'],
                time: arguments['time'],
                content: arguments['content'],
                description: arguments['description']));
      case '/forget_pass_page':
        return MaterialPageRoute(builder: (context) => const ForgetPassword());
    }
    return null;
  }
}
