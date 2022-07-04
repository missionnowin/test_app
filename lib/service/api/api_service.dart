import 'package:dio/dio.dart';
import '../../components/models/employer.dart';
import '../../components/models/sign_up.dart';

 class  ApiService{
  final Dio _api = Dio();
  String? _accessToken;
  final String _url = 'http://80.78.245.111:8085/staging/api';

  Future<int?> auth(String username, String password) async{
    var response = await _api.post('$_url/employer/login',
        data: {
          "email": username,
          "password": password,
        },
        options: Options(
         headers: {"Content-Type": "application/json"},
        )
    );
    if(response.statusCode == 200){
      Map<String, dynamic> json = response.data;
      _accessToken = json['data']['token'] as String;
    }
    return response.statusCode;
  }

  Future<Employer> getData() async{
    // ignore: prefer_typing_uninitialized_variables
    var employer;
    var response = await _api.get('$_url/employer/data',
    options:
      Options(
        headers: {'X-Auth-Token' : _accessToken},
      )
    );
    if(response.statusCode == 200){
      Map<String, dynamic> json = response.data;
      employer = Employer.fromJson(json['data']);
    }
    return employer;
  }

  Future<int?> saveData(Employer employer) async{
    var response = await _api.post('$_url/employer/update',
        options:
          Options(
            headers: {
              'X-Auth-Token' : _accessToken,
              "Content-Type": "application/json"
            },
          ),
        data: employer,
    );
    return response.statusCode;
  }

  Future<String?> signUp(SignUpData signUpData) async {
    var response = await _api.post('$_url/employer/register',
        options:
          Options(
            headers: {
              "Content-Type": "application/json"
            }
        ),
      data:signUpData,
    );
    return response.data['msg'];
  }
}

