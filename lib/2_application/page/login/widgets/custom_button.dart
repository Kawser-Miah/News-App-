import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_news_app/splash_page.dart';
import '../../news_page/news_bloc/news_bloc.dart';
import '../bloc/sign_in_bloc.dart';
import '../../../core/services/text_controller_class.dart';
import '../../news_page/news_page.dart';

class CustomLogInButton extends StatefulWidget {
  const CustomLogInButton({super.key});

  @override
  State<CustomLogInButton> createState() => _CustomLogInButtonState();
}

class _CustomLogInButtonState extends State<CustomLogInButton> {
  TextController controller = TextController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        if (state is SignInValidState) {
          BlocProvider.of<SignInBloc>(context)
              .add(SignInSubmittedEvent(state.email, state.password));
        }
        return InkResponse(
          onTap: () async {
            if (state is SignInLoadedState) {
              final sharedPref = await SharedPreferences.getInstance();
              sharedPref.setString(SplashPageState.KEYLOGIN, state.email);

              if (context.mounted) {
                BlocProvider.of<NewsBloc>(context).add(NewsFetchRequestEvent());

                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => NewsHomePage(
                              email: state.email,
                            )));
              }
            } else if (state is SignInInitial) {
              BlocProvider.of<SignInBloc>(context)
                  .add(SignInTextChangeEvent('0', '0'));
            }
          },
          child: Container(
            height: 50,
            margin: const EdgeInsets.symmetric(horizontal: 50),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: const Color.fromRGBO(76, 255, 33, 1),
            ),
            child: const Center(
                child: Text('LOG IN',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 19))),
          ),
        );
      },
    );
  }
}

class CustomSocialMediaLoginButton extends StatelessWidget {
  const CustomSocialMediaLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkResponse(
            onTap: () {},
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50), color: Colors.blue),
              child: const Center(
                  child: Padding(
                padding: EdgeInsets.only(right: 23, left: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.facebook,
                      color: Colors.white,
                    ),
                    Text('Facebook',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              )),
            ),
          ),
        ),
        const SizedBox(
          width: 30,
        ),
        Expanded(
          child: InkResponse(
            onTap: () {},
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50), color: Colors.black),
              child: const Center(
                  child: Padding(
                padding: EdgeInsets.only(right: 38, left: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      FontAwesomeIcons.github,
                      color: Colors.white,
                    ),
                    Text('Github',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 19)),
                  ],
                ),
              )),
            ),
          ),
        ),
      ],
    );
  }
}
