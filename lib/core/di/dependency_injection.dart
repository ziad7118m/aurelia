import 'package:aurelia/core/api/dio_factory.dart';
import 'package:aurelia/features/auth/data/repos/auth_repo.dart';
import 'package:aurelia/features/auth/logic/cubit/login_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/data/remote/auth_remote_data_source.dart';

final getIt = GetIt.instance;

void setupDependencyInjection() {
  getIt.registerLazySingleton<Dio>(() => DioFactory.createDio());
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSource(getIt<Dio>()),
  );
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepo(getIt<AuthRemoteDataSource>()),
  );
  getIt.registerFactory<LoginCubit>(
        () => LoginCubit(getIt<AuthRepo>()),
  );
}
