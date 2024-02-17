import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'sign_in_event.dart';
import 'sign_in_state.dart';
export 'sign_in_event.dart';
export 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial()) {
    on<SignInTextChangeEvent>((event, emit) {
      if (event.emailValue == "" ||
          EmailValidator.validate(event.emailValue) == false) {
        emit(SignInInvalidEmailState("Please enter a valid email address"));
      } else if (event.passwordValue.length < 8) {
        emit(SignInInvalidPassState("Password must contains 8 character"));
      } else {
        emit(SignInValidState(
            email: event.emailValue, password: event.passwordValue));
      }
    });

    on<SignInSubmittedEvent>((event, emit) {
      emit(SignInLoadedState(event.email, event.password));
    });
  }
}
