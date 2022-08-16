import 'package:colorbracket_assignment/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../constants/strings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final GlobalKey<FormFieldState> field1key = GlobalKey();
  final GlobalKey<FormFieldState> field2key = GlobalKey();
  late FocusNode focusNode1;
  late FocusNode focusNode2;
  LoginPage({Key? key}) : super(key: key);
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    focusNode1 = FocusNode();
    focusNode2 = FocusNode();
    // BlocProvider.of<LoginCubit>(context).passwordVisibility();

    focusNode1.addListener(() {
      if (!focusNode1.hasFocus) {
        field1key.currentState?.validate();
      }
    });

    focusNode2.addListener(() {
      if (!focusNode2.hasFocus) {
        field2key.currentState?.validate();
      }
    });

    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        SchedulerBinding.instance.addPostFrameCallback((_) {
          if (state is UserAuthenticated) {
            Navigator.popAndPushNamed(context, kHomeUrl);
          }
        });

        return Scaffold(
          body: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: MediaQuery.of(context).size.width,
                minHeight: MediaQuery.of(context).size.height,
              ),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image(image: AssetImage(kLogo)),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 35.00, vertical: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome',
                            style: TextStyle(
                              color: Color(
                                0xff394D81,
                              ),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Fill this form to continue',
                            style: TextStyle(
                              color: Color(0xff394D81),
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: BottomModal(
                        columnChild: Column(
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 40,
                                        top: 50,
                                        right: 40,
                                        bottom: 10,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          state is WrongUserCredentials
                                              ? Center(
                                                  child: Text(
                                                    state.message,
                                                    style: TextStyle(
                                                        color: Colors.red),
                                                  ),
                                                )
                                              : Text(""),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            'Enter your username or Email adress',
                                            style: kFormTextStyle,
                                          ),
                                          TextFormField(
                                            key: field1key,
                                            focusNode: focusNode1,
                                            onSaved: (value) {
                                              email = value!;
                                              print(value);
                                            },
                                            validator: (value) {
                                              BlocProvider.of<LoginCubit>(
                                                      context)
                                                  .validateEmail(value!);
                                              print(value);
                                            },
                                            cursorColor: Colors.white,
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                            decoration: kInputDecoration,
                                          ),
                                          state is EmailInValidated
                                              ? Text(
                                                  "Please enter the correct email address",
                                                  style: TextStyle(
                                                      color: Colors.red),
                                                )
                                              : Text("")
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 40,
                                        top: 30,
                                        right: 40,
                                        bottom: 10,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Enter your Password',
                                            style: kFormTextStyle,
                                          ),
                                          TextFormField(
                                            key: field2key,
                                            focusNode: focusNode2,
                                            validator: (value) {
                                              BlocProvider.of<LoginCubit>(
                                                      context)
                                                  .passwordValidation(value!);
                                              print(value);
                                            },
                                            onSaved: (value) {
                                              password = value!;
                                              print(value);
                                            },
                                            obscureText:
                                                state is PassWordInvisible
                                                    ? false
                                                    : true,
                                            cursorColor: Colors.white,
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                            decoration:
                                                _inputDecorationPassword(
                                                    state, context),
                                          ),
                                          state is PassWordLenght
                                              ? Text(
                                                  state.message,
                                                  style: TextStyle(
                                                      color: Colors.red),
                                                )
                                              : Text("")
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            state is LoggingInUser
                                ? Transform.scale(
                                    scale: 0.6,
                                    child: CircularProgressIndicator())
                                : TextButton(
                                    onPressed: () async {
                                      _formKey.currentState?.save();
                                      print(email);
                                      print(password);

                                      await BlocProvider.of<LoginCubit>(context)
                                          .credentialValidation(
                                              email, password);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 40,
                                      ),
                                      child: Text(
                                        'SIGN IN',
                                        style: TextStyle(
                                          color: Color(0xff162B77),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.white),
                                    ),
                                  )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  InputDecoration _inputDecorationPassword(LoginState state, context) {
    print(state);
    return InputDecoration(
        isCollapsed: true,
        contentPadding: EdgeInsets.fromLTRB(0, 10, 5, 10),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
          color: Colors.white,
        )),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
          color: Colors.white,
        )),
        suffixIcon: InkWell(
          onTap: () {
            BlocProvider.of<LoginCubit>(context).passwordVisibility();
          },
          child: state is PassWordInvisible
              ? _visibilityIcon()
              : _inVisibilityIcon(),

          //  _inVisibilityIcon(),
        ));
  }

  Icon _visibilityIcon() {
    return Icon(
      Icons.visibility_outlined,
      color: Colors.white,
      size: 20.5,
    );
  }

  Icon _inVisibilityIcon() {
    return Icon(
      Icons.visibility_off,
      color: Colors.white,
      size: 20.5,
    );
  }
}

class BottomModal extends StatelessWidget {
  Column columnChild;
  BottomModal({required this.columnChild});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xff162B77),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25))),
      child: columnChild,
    );
  }
}
