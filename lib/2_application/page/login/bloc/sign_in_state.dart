import 'package:equatable/equatable.dart';

abstract class SignInState extends Equatable {
  @override
  List<Object> get props => [];
}

class SignInInitial extends SignInState {}

class SignInInvalidEmailState extends SignInState {
  final String errorMessage;
  SignInInvalidEmailState(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}

class SignInInvalidPassState extends SignInState {
  final String errorMessage;
  SignInInvalidPassState(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}

class SignInValidState extends SignInState {
  final String email;
  final String password;
  SignInValidState({required this.email, required this.password});
  @override
  List<Object> get props => [email, password];
}

class SignInLoadedState extends SignInState {
  final String email;
  final String password;
  SignInLoadedState(this.email, this.password);
  @override
  List<Object> get props => [email, password];
}
