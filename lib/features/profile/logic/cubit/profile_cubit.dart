import 'package:aurelia/core/api/api_result.dart';
import 'package:aurelia/features/auth/data/models/user_model.dart';
import 'package:aurelia/features/auth/data/repos/auth_repo.dart';
import 'package:aurelia/features/profile/logic/cubit/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final AuthRepo authRepo;
  ProfileCubit(this.authRepo) : super(ProfileInitial());
  Future<void> GetCurrentUser() async {
    emit(ProfileLoading());
    final result = await authRepo.getCurrentUser();
    if (result is ApiSuccess<UserModel>) {
      emit(ProfileSuccess(result.data));
    } else if (result is ApiError<UserModel>) {
      emit(ProfileFailure(result.message));
    }
  }
}
