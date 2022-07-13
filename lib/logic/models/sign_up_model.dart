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
  factory SignUpModel.fromJson(Map<String, dynamic> json){
    return SignUpModel(
        orgName: json['orgName'],
        email: json['email'],
        password : json['password'] ,
        phone: json['phone']);
  }
}