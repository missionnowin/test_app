class SignInModel{
  String email;
  String password;

  SignInModel({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() =>
      {
        'email': email,
        'password' : password,
      };

  factory SignInModel.fromJson(Map<String, dynamic> json){
    return SignInModel(
      email : json['email'] as String,
      password: json['password'] as String,
    );
  }
}