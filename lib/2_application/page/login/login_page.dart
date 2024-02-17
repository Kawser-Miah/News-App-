import 'package:flutter/material.dart';
import 'package:simple_news_app/2_application/page/login/widgets/custom_button.dart';
import 'package:simple_news_app/2_application/page/login/widgets/custom_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(begin: Alignment.topCenter, colors: [
            Color.fromRGBO(76, 255, 33, 1.0),
            Color.fromRGBO(68, 185, 41, 1.0),
            Color.fromRGBO(49, 141, 49, 1.0),
            // Colors.green.shade900,
            // Colors.green.shade800,
            // Colors.green.shade500
          ])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 80,
              ),
              const Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 40),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Welcome Back!',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 20),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                  child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        const CustomTextField(),
                        const SizedBox(
                          height: 30,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/forget_pass_page');
                          },
                          child: const Text('Forget Password?',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 16)),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const CustomLogInButton(),
                        const SizedBox(
                          height: 40,
                        ),
                        const Text('Continue with social media',
                            style: TextStyle(color: Colors.grey, fontSize: 16)),
                        const SizedBox(
                          height: 30,
                        ),
                        const CustomSocialMediaLoginButton(),
                      ],
                    ),
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
