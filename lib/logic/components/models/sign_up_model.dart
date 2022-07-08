class SignUpModel{
  String email;
  String password;
  String phone;
  String orgName;

  SignUpModel({
    required this.orgName,
    required this.email,
    required this.password,
    required this.phone,
  });
  Map<String, dynamic> toJson() =>
      {
        'orgName': orgName,
        'email': email,
        'phone' : phone,
        'password' : password,
      };
}