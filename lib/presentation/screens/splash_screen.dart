import 'dart:async';

import 'package:colorbracket_assignment/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(
      Duration(seconds: 2),
      () => Navigator.popAndPushNamed(context, kLoginPage),
    );
    return Scaffold(
      body: Center(child: Image.asset('assets/logo.png')),
    );
  }
}
