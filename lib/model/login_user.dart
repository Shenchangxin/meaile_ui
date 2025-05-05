class LoginUser {
  final int id;
  final String nickName;
  final String token;
  final String expiredAt;

  LoginUser({
    required this.id,
    required this.nickName,
    required this.token,
    required this.expiredAt,
  });

  factory LoginUser.fromJson(Map<String, dynamic> json) {
    return LoginUser(
      id: json['id'],
      nickName: json['nick_name'],
      token: json['token'],
      expiredAt: json['expired_at'],
    );
  }
}