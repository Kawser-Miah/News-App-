import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/sign_in_bloc.dart';
import '../../../core/services/text_controller_class.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({super.key});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  TextController controller = TextController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
                color: Color.fromRGBO(125, 241, 128, 0.8),
                blurRadius: 20,
                offset: Offset(0, 10))
          ]),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: Colors.grey.shade300))),
            child: BlocBuilder<SignInBloc, SignInState>(
              builder: (context, state) {
                return TextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: controller.emailController,
                  onChanged: (value) {
                    BlocProvider.of<SignInBloc>(context).add(
                        SignInTextChangeEvent(controller.emailController.text,
                            controller.passwordController.text));
                  },
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.normal),
                  decoration: InputDecoration(
                      hintText: 'Email Address',
                      hintStyle: const TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.w500),
                      border: InputBorder.none,
                      errorText: (state is SignInInvalidEmailState)
                          ? state.errorMessage
                          : null),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: BlocBuilder<SignInBloc, SignInState>(
              builder: (context, state) {
                return TextField(
                  controller: controller.passwordController,
                  onChanged: (value) {
                    BlocProvider.of<SignInBloc>(context).add(
                        SignInTextChangeEvent(controller.emailController.text,
                            controller.passwordController.text));
                  },
                  style: const TextStyle(
                      color: Colors.black,
                      fontStyle: FontStyle.normal,
                      fontSize: 18,
                      fontWeight: FontWeight.normal),
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: const TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.w500),
                    border: InputBorder.none,
                    errorText: (state is SignInInvalidPassState)
                        ? state.errorMessage
                        : null,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
