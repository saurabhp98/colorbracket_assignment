import 'package:colorbracket_assignment/constants/strings.dart';
import 'package:colorbracket_assignment/cubit/employee_read_more_cubit.dart';
import 'package:colorbracket_assignment/cubit/login_cubit.dart';
import 'package:colorbracket_assignment/data/models/employee_model.dart';
import 'package:colorbracket_assignment/data/repository/user_repository.dart';
import 'package:colorbracket_assignment/data/services/user_network_service.dart';
import 'package:colorbracket_assignment/presentation/screens/employee_readmore_screen.dart';
import 'package:colorbracket_assignment/presentation/screens/employee_screen.dart';
import 'package:colorbracket_assignment/presentation/screens/home_screen.dart';
import 'package:colorbracket_assignment/presentation/screens/login_screen.dart';
import 'package:colorbracket_assignment/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/employee_cubit.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case kSplashScreen:
        // Splash Screen return to Login Page after 2 seconds
        return MaterialPageRoute(builder: (_) => SplashScreen());

      case kHomeUrl:
        // After Validating User from Login
        // List of Employee would be shown on this route
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => EmployeeCubit(
                      repository:
                          UserRepository(networkService: UserNetworkService())),
                  child: HomeScreen(),
                ));

      case kLoginPage:
        // Validating User and Login them.
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => LoginCubit(
                          userRepository: UserRepository(
                              networkService: UserNetworkService())),
                    ),
                  ],
                  child: LoginPage(),
                ));

      case kEmployeeDetail:
        // Employee Details Are shon On this route
        return MaterialPageRoute(
            builder: (_) => EmployeeScreen(
                  employeeList: settings.arguments as EmployeeList,
                ));
      case kEmployeeReadMore:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => EmployeeReadMoreCubit(
                      repository:
                          UserRepository(networkService: UserNetworkService())),
                  child: EmployeReadMore(
                    employeeId: settings.arguments as int,
                  ),
                ));

      default:
    }
  }
}
