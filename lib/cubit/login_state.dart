part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class PassWordVisible extends LoginState {}

class PassWordInvisible extends LoginState {}

class EmailValidated extends LoginState {}

class EmailInValidated extends LoginState {}

class PassWordLenght extends LoginState {
  String message;
  PassWordLenght({required this.message});
}

class UserAuthenticated extends LoginState {
  UserAuthenticated();
}

class WrongUserCredentials extends LoginState {
  String message;
  WrongUserCredentials({required this.message});
}

class LoggingInUser extends LoginState {}
