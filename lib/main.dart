import 'package:colorbracket_assignment/constants/strings.dart';
import 'package:colorbracket_assignment/presentation/router.dart';
import 'package:colorbracket_assignment/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  AppRouter appRouter;
  MyApp({Key? key, required this.appRouter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ColorBracket AssignMent",
      onGenerateRoute: appRouter.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
