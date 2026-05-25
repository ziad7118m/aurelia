class AuthTokenModel {
  final String accessToken;
  final String refreshToken;
  final DateTime expiresAtUtc;

  AuthTokenModel({
    required this.accessToken,
    required this.refreshToken,
    required this.expiresAtUtc,
  });

  factory AuthTokenModel.fromJson(Map<String, dynamic> json) {
    return AuthTokenModel(
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
      expiresAtUtc: DateTime.parse(json['expiresAtUtc']),
    );
  }
}