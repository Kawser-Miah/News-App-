import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '2_application/page/news_page/news_bloc/news_bloc.dart';
import '2_application/page/news_page/news_page.dart';
import '2_application/page/login/login_page.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {

  static const KEYLOGIN = 'login';
  @override
  void initState() {

    whereToGo();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Color.fromRGBO(76, 255, 33, 1.0),
              Color.fromRGBO(68, 185, 41, 1.0),
              Color.fromRGBO(49, 141, 49, 1.0),
            ]
          )
        ),
        child: const Center(child: Icon(Icons.newspaper_rounded,color: Colors.white70,size: 100,)),
      ),
    );
  }

  void whereToGo() async{

    final sharedPref = await SharedPreferences.getInstance();
    final isLoggedIn = sharedPref.getString(KEYLOGIN);

    Timer(const Duration(seconds: 1),(){
      if(isLoggedIn != null){
        BlocProvider.of<NewsBloc>(context).add(NewsFetchRequestEvent());
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>NewsHomePage(email: isLoggedIn)));
      }else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const LoginPage()));
      }
    });

  }
}
