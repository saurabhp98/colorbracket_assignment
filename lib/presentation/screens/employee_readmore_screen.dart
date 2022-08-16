import 'package:colorbracket_assignment/cubit/employee_read_more_cubit.dart';
import 'package:colorbracket_assignment/data/models/employee_view_more_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class EmployeReadMore extends StatelessWidget {
  int employeeId;
  EmployeReadMore({Key? key, required this.employeeId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<EmployeeReadMoreCubit>(context)
        .fetchEmployeeReadMore(employeeId);
    return Scaffold(
      body: BlocBuilder<EmployeeReadMoreCubit, EmployeeReadMoreState>(
        builder: (context, state) {
          if (state is! EmployeeReadMoreLoaded) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final employeeReadMore = state.employeeReadMoreModel;
          return SafeArea(
            child: Center(
              child: Container(
                color: Colors.grey.shade200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(100)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: FadeInImage.assetNetwork(
                              placeholder: 'assets/broken-image.png',
                              image: employeeReadMore.logoUrl!,
                              height: 50,
                              width: 50,
                              imageErrorBuilder: (context, error, stackTrace) {
                                return Image.asset(
                                  'assets/broken-image.png',
                                  height: 50,
                                  width: 50,
                                );
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextDescription(
                                  textHeading: "Name : ",
                                  textDescription: employeeReadMore.name,
                                  color1: Colors.black,
                                  color2: Color.fromARGB(255, 16, 35, 104),
                                  fontsize1: 20,
                                  fontsize2: 20,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextDescription(
                                    textHeading: "Designation : ",
                                    textDescription:
                                        employeeReadMore.designation,
                                    color1: Colors.black,
                                    color2: Colors.teal,
                                    fontsize1: 15,
                                    fontsize2: 15),
                                SizedBox(
                                  height: 10,
                                ),
                                TextDescription(
                                    textHeading: "Company Name : ",
                                    textDescription:
                                        employeeReadMore.companyName,
                                    color1: Colors.black,
                                    color2: Colors.blueGrey,
                                    fontsize1: 15,
                                    fontsize2: 15),
                                SizedBox(
                                  height: 10,
                                ),
                                TextDescription(
                                    textHeading: "Ratings : ",
                                    textDescription: employeeReadMore.rating,
                                    color1: Colors.black,
                                    color2: Colors.black,
                                    fontsize1: 15,
                                    fontsize2: 15),
                                SizedBox(
                                  height: 10,
                                ),
                                TextDescription(
                                    textHeading: "Interests : ",
                                    textDescription: employeeReadMore.interests,
                                    color1: Colors.black,
                                    color2: Color.fromARGB(255, 16, 35, 104),
                                    fontsize1: 15,
                                    fontsize2: 15),
                                SizedBox(
                                  height: 10,
                                ),
                                TextDescription(
                                    textHeading: "Description : ",
                                    textDescription:
                                        employeeReadMore.jobDescripton,
                                    color1: Colors.black,
                                    color2: Colors.black,
                                    fontsize1: 10,
                                    fontsize2: 10),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "To know more visit ",
                                      style: TextStyle(
                                          fontSize: 10, color: Colors.grey),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        launch(employeeReadMore.viewMore);
                                      },
                                      // launch(employeeReadMore.viewMore),
                                      child: Text(
                                        employeeReadMore.viewMore,
                                        style: TextStyle(
                                            fontSize: 10, color: Colors.blue),
                                      ),
                                    ),
                                  ],
                                )
                              ]),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class TextDescription extends StatelessWidget {
  TextDescription(
      {Key? key,
      required this.textHeading,
      required this.textDescription,
      required this.color1,
      required this.color2,
      required this.fontsize1,
      required this.fontsize2})
      : super(key: key);

  final double fontsize1;
  final double fontsize2;
  final Color color1;
  final Color color2;
  final String textHeading;
  final String textDescription;

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        textHeading,
        style: TextStyle(
            fontSize: fontsize1, fontWeight: FontWeight.bold, color: color1),
      ),
      Expanded(
        child: Text(
          textDescription,
          style: TextStyle(
            fontSize: fontsize2,
            fontWeight: FontWeight.bold,
            color: color2,
          ),
        ),
      )
    ]);
  }
}
