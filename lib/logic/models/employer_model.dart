class EmployerModel{
  String id;
  String orgName;
  String? email;
  String? name;
  String? surname;
  String? lastName;
  String? post;
  String? orgDetails;
  String? legalAddress;
  String? actualAddress;
  String logoPath;
  String? companyDescription;
  int companyRate;

  EmployerModel({
    required this.id,
    required this.orgName,
    required this.email,
    required this.name,
    required this.surname,
    required this.lastName,
    required this.post,
    required this.orgDetails,
    required this.legalAddress,
    required this.actualAddress,
    required this.logoPath,
    required this.companyDescription,
    required this.companyRate,
  });

  factory EmployerModel.fromJson(Map<String, dynamic> json){
    return EmployerModel(
        id: (json['id'])  as String,
        orgName: (json['orgName'] ?? '') as String,
        email: (json['email']) as String,
        name: (json['name'] ?? '') as String,
        surname: (json['surname'] ?? '') as String,
        lastName: (json['lastName'] ?? '') as String,
        post: (json['post'] ?? '') as String,
        orgDetails: (json['orgDetails'] ?? '') as String,
        legalAddress: (json['legalAddress'] ?? '') as String,
        actualAddress: (json['actualAddress'] ?? '') as String,
        logoPath: (json['logoPath'] ?? '') as String,
        companyDescription: (json['companyDescription'] ?? '') as String,
        companyRate: (json['companyRate']) as int,
    );
  }
  Map<String, dynamic> toJson() =>
      {
        'id': id,
        'orgName': orgName,
        'email': email,
        'name': name,
        'surname': surname,
        'lastName': lastName,
        'post': post,
        'orgDetails' : orgDetails,
        'legalAddress' : legalAddress,
        'actualAddress' : actualAddress,
        'logoPath' : logoPath,
        'companyDescription' : companyDescription,
        'companyRate' : companyRate,
      };

  void update(Map<String, dynamic> json)
  {
    name = json['name'];
    companyDescription = json['companyDescription'];
    email = json['email'];
    legalAddress = json['legalAddress'];
    actualAddress = json['actualAddress'];
    post = json['post'];
    orgName = json['orgName'];
  }

  void updateImage(String logoPath){
    this.logoPath = logoPath;
  }
  factory EmployerModel.copyWith(EmployerModel employerModel){
    return EmployerModel(
        id: employerModel.id,
        orgName: employerModel.orgName,
        email: employerModel.email,
        name: employerModel.name,
        surname: employerModel.surname,
        lastName: employerModel.lastName,
        post: employerModel.post,
        orgDetails: employerModel.orgDetails,
        legalAddress: employerModel.legalAddress,
        actualAddress: employerModel.actualAddress,
        logoPath: employerModel.logoPath,
        companyDescription: employerModel.companyDescription,
        companyRate: employerModel.companyRate);
  }
}
