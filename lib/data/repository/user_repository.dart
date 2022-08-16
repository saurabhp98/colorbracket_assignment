import 'package:colorbracket_assignment/data/models/employee_model.dart';
import 'package:colorbracket_assignment/data/models/employee_view_more_model.dart';
import 'package:colorbracket_assignment/data/services/user_network_service.dart';

import '../models/user_model.dart';

class UserRepository {
  UserNetworkService networkService;
  UserRepository({required this.networkService});

  Future<int> validateUser(String email, String password) async {
    int validatedUser = await networkService.validateUser(email, password);
    return validatedUser;
  }

  Future<List<EmployeeList>> fetchEmployeeList() async {
    List employeeList = await networkService.fetchEmployeeList();
    return employeeList.map((e) => EmployeeList.fromJson(e)).toList();
  }

  Future<EmployeeReadMoreModel> fetchEmployeeReadMore(int id) async {
    List<dynamic> fetchedEmployeeReadMore =
        await networkService.fetchEmployeeReadMore(id);
    List<EmployeeReadMoreModel> employeeReadMoreModel = fetchedEmployeeReadMore
        .map((e) => EmployeeReadMoreModel.fromJson(e))
        .toList();

    EmployeeReadMoreModel employeeReadMore = employeeReadMoreModel[0];
    return employeeReadMore;
  }
}
