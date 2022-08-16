import 'package:colorbracket_assignment/constants/strings.dart';
import 'package:colorbracket_assignment/data/models/employee_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class EmployeeScreen extends StatelessWidget {
  EmployeeList employeeList;
  EmployeeScreen({Key? key, required this.employeeList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print(employeeList);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 15),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FadeInImage.assetNetwork(
                          placeholder: 'assets/broken-image.png',
                          image: employeeList.logoUrl!,
                          height: 150,
                          width: 150,
                          imageErrorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                              'assets/broken-image.png',
                              height: 200,
                              width: 200,
                            );
                          },
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "${employeeList.name}",
                          style: TextStyle(
                              fontSize: 35, color: Colors.blueGrey.shade900),
                        ),
                        Text(
                          "${employeeList.designation}",
                          style: TextStyle(
                              fontSize: 20, color: Colors.blueGrey.shade900),
                        ),
                        Text(
                          "${employeeList.companyName}",
                          style: TextStyle(
                              fontSize: 20, color: Colors.blueGrey.shade900),
                        ),
                        SizedBox(
                          height: 100,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context,
                                arguments: employeeList.id,
                                kEmployeeReadMore);
                          },
                          child: Text('Read more'),
                        ),
                        SizedBox(
                          height: 40,
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
