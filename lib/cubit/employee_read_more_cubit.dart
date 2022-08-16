import 'package:bloc/bloc.dart';
import 'package:colorbracket_assignment/data/models/employee_view_more_model.dart';
import 'package:colorbracket_assignment/data/repository/user_repository.dart';
import 'package:colorbracket_assignment/presentation/screens/employee_readmore_screen.dart';
import 'package:meta/meta.dart';

part 'employee_read_more_state.dart';

class EmployeeReadMoreCubit extends Cubit<EmployeeReadMoreState> {
  UserRepository repository;
  EmployeeReadMoreCubit({required this.repository})
      : super(EmployeeReadMoreInitial());
  void fetchEmployeeReadMore(int id) async {
    EmployeeReadMoreModel fetchedEmployeeReadMore =
        await repository.fetchEmployeeReadMore(id);
    emit(
        EmployeeReadMoreLoaded(employeeReadMoreModel: fetchedEmployeeReadMore));
    print(fetchedEmployeeReadMore.companyName);
  }
}
