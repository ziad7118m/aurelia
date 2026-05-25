import 'package:aurelia/core/api/dio_factory.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupDependencyInjection(){
  getIt.registerLazySingleton<Dio>(()=>DioFactory.createDio() );
}