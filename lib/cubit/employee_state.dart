part of 'employee_cubit.dart';

@immutable
abstract class EmployeeState {}

class EmployeeInitial extends EmployeeState {}

class EmployeeLoaded extends EmployeeState {
  List<EmployeeList> employee;
  EmployeeLoaded({required this.employee});
}
