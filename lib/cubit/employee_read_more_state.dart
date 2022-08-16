part of 'employee_read_more_cubit.dart';

@immutable
abstract class EmployeeReadMoreState {}

class EmployeeReadMoreInitial extends EmployeeReadMoreState {}

class EmployeeReadMoreLoaded extends EmployeeReadMoreState {
  EmployeeReadMoreModel employeeReadMoreModel;
  EmployeeReadMoreLoaded({required this.employeeReadMoreModel});
}
