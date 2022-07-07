class SignUpFormModel{
  String email;
  String password;
  String phone;
  String orgName;

  SignUpFormModel({
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