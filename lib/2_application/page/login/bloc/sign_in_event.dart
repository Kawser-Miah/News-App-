import 'package:equatable/equatable.dart';

abstract class SignInEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignInTextChangeEvent extends SignInEvent {
  final String emailValue;
  final String passwordValue;
  SignInTextChangeEvent(this.emailValue, this.passwordValue);
  @override
  List<Object?> get props => [emailValue, passwordValue];
}

class SignInSubmittedEvent extends SignInEvent {
  final String email;
  final String password;
  SignInSubmittedEvent(this.email, this.password);

  @override
  List<Object?> get props => [email, password];
}
