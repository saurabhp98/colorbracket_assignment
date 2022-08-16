import 'package:colorbracket_assignment/constants/strings.dart';
import 'package:colorbracket_assignment/cubit/employee_cubit.dart';
import 'package:colorbracket_assignment/data/models/employee_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<EmployeeCubit>(context).fetchEmployeeList();
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xff162B77),
          title: Center(
            child: Text("Employee List"),
          )),
      body: BlocBuilder<EmployeeCubit, EmployeeState>(
        builder: (context, state) {
          if (state is! EmployeeLoaded) {
            return Center(child: CircularProgressIndicator());
          }

          final employees = state.employee;

          return SingleChildScrollView(
            child: Column(
              children: employees
                  .map((e) => EmployeeListCard(
                      employeeList: e,
                      name: e.name,
                      designation: e.designation,
                      logoUrl: e.logoUrl,
                      companyName: e.companyName))
                  .toList(),
            ),
          );
        },
      ),
    );
  }
}

class EmployeeListCard extends StatelessWidget {
  EmployeeList employeeList;
  String name;
  String designation;
  String? logoUrl;
  String companyName;
  EmployeeListCard(
      {Key? key,
      required this.name,
      required this.designation,
      required this.logoUrl,
      required this.companyName,
      required this.employeeList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, arguments: employeeList, kEmployeeDetail);
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Container(
          padding: EdgeInsets.only(left: 5, right: 5, top: 15, bottom: 15),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 4,
                // offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CompanyLogoIcon(logoUrl: logoUrl),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "$name",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  Text("$designation"),
                  Text("$companyName")
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CompanyLogoIcon extends StatelessWidget {
  const CompanyLogoIcon({
    Key? key,
    required this.logoUrl,
  }) : super(key: key);

  final String? logoUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 100,
      // height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FadeInImage.assetNetwork(
          placeholder: 'assets/broken-image.png',
          image: logoUrl!,
          height: 40,
          width: 40,
          imageErrorBuilder: (context, error, stackTrace) {
            return Image.asset(
              'assets/broken-image.png',
              height: 50,
              width: 50,
            );
          },
        ),
      ),
    );
  }
}
