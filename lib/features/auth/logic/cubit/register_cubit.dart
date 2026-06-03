import 'package:aurelia/core/api/api_result.dart';
import 'package:aurelia/features/auth/data/repos/auth_repo.dart';
import 'package:aurelia/features/auth/logic/cubit/register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepo authRepo;
  RegisterCubit(this.authRepo) : super(RegisterInitial());
  Future<void> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    emit(RegisterLoading());
    final result = await authRepo.register(
      email: email,
      password: password,
      firstName: firstName,
      lastName: lastName,
    );
    if(result is ApiSuccess<void>){
      emit(RegisterSuccess());
    }else if(result is ApiError<void>){
      emit(RegisterFailure(result.message));
    }
  }

}
