import 'package:bloc/bloc.dart';
import 'package:colorbracket_assignment/data/models/employee_model.dart';
import 'package:colorbracket_assignment/data/repository/user_repository.dart';
import 'package:meta/meta.dart';

part 'employee_state.dart';

class EmployeeCubit extends Cubit<EmployeeState> {
  UserRepository repository;
  EmployeeCubit({required this.repository}) : super(EmployeeInitial());
  Future fetchEmployeeList() async {
    List<EmployeeList> employeeList = await repository.fetchEmployeeList();
    emit(EmployeeLoaded(employee: employeeList));
  }
}
