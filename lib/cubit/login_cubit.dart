import 'package:bloc/bloc.dart';
import 'package:colorbracket_assignment/constants/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../data/repository/user_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  UserRepository userRepository;
  LoginCubit({required this.userRepository}) : super(LoginInitial());

  void passwordVisibility() {
    final currentState = state;
    if (currentState is! PassWordInvisible) {
      emit(PassWordInvisible());
    } else {
      emit(PassWordVisible());
    }
  }

  // emailValidation
  void validateEmail(String value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value)) {
      emit(EmailInValidated());
      print("email is Invalid");
    } else {
      emit(EmailValidated());
      print("email is valid");
    }
  }

  void passwordValidation(String value) {
    if (value == null || value.isEmpty || value.length < 6) {
      print("password is less than 6 digit");
      emit(PassWordLenght(message: "Password should be more than 5 digit"));
    } else {
      print("valid password");
    }
  }

  Future credentialValidation(String email, String password) async {
    emit(LoggingInUser());
    final responseCode = await userRepository.validateUser(email, password);

    if (responseCode == 200) {
      emit(UserAuthenticated());
    } else {
      emit(WrongUserCredentials(message: "Wrong User Credentials"));
    }
  }
}
