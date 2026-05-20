import 'package:aurelia/core/errors/api_error_model.dart';
import 'package:dio/dio.dart';

class ApiErrorHandler {
  ApiErrorHandler._();

  static String handleError(dynamic error){
    if(error is DioException){
      switch (error.type){
        case DioExceptionType.connectionTimeout:
          return 'Connection timeout. Please check your internet connection.';
        case DioExceptionType.sendTimeout:
          return 'Send timeout. Please try again.';
        case DioExceptionType.receiveTimeout:
          return 'Receive timeout. Please try again.';

        case DioExceptionType.badResponse:
          return _handleBadResponse(error);

        case DioExceptionType.cancel:
          return 'Request was cancelled.';

        case DioExceptionType.connectionError:
          return 'No internet connection.';

        case DioExceptionType.unknown:
          return 'Something went wrong. Please try again.';

        case DioExceptionType.badCertificate:
          return 'Bad certificate error.';
      }
    }
    return 'Something went wrong. Please try again.';
  }

  static String _handleBadResponse(DioException error){
    final responseData = error.response?.data;

    if(responseData is Map<String,dynamic>){
      final apiError = ApiErrorModel.fromJson(responseData);
      return apiError.message ?? 'Something went wrong. Please try again.';
    }

    switch (error.response?.statusCode){
      case 400:
        return 'Bad request.';
      case 401:
        return 'Unauthorized. Please login again.';
      case 403:
        return 'Access denied.';
      case 404:
        return 'Not found.';
      case 500:
        return 'Server error. Please try again later.';
      default:
        return 'Something went wrong.';
    }
  }
}