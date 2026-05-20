class ApiErrorModel {
  final int? statusCode;
  final String? message;
  final Map<String, dynamic>? errors;

  ApiErrorModel({this.statusCode, this.message, this.errors});

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) {
    return ApiErrorModel(
      statusCode: json['statusCode'],
      message: json['message'] ?? json['title'] ?? json['detail'],
      errors: json['errors'],
    );
  }
}
