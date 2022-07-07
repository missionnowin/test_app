import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:test_app/logic/components/models/sign_in_form_model.dart';
import 'package:test_app/logic/components/models/sign_up_form_model.dart';
import '../../logic/components/models/employer_update_form_model.dart';


 class  ApiService{
  final Dio _api = Dio();
  final String _url = 'http://80.78.245.111:8085/staging/api';

  Future<String> auth(SignInFormModel signInFormModel) async{
    var response = await _api.post('$_url/employer/login',
        data: {
          "email": signInFormModel.email,
          "password": signInFormModel.password,
        },
        options: Options(
         headers: {"Content-Type": "application/json"},
        )
    );
    return response.data['data']['token'];

  }

  Future<EmployerUpdateModel> getData() async{
    // ignore: prefer_typing_uninitialized_variables
    var employer;
    String accessToken = await const FlutterSecureStorage().read(key: 'token') as String;
    var response = await _api.get('$_url/employer/data',
    options:
      Options(
        headers: {'X-Auth-Token' : accessToken},
      )
    );
    if(response.statusCode == 200){
      Map<String, dynamic> json = response.data;
      employer = EmployerUpdateModel.fromJson(json['data']);
    }
    return employer;
  }

  Future<int?> saveData(EmployerUpdateModel employer) async{
    String accessToken = await const FlutterSecureStorage().read(key: 'token') as String;
    var response = await _api.post('$_url/employer/update',
        options:
          Options(
            headers: {
              'X-Auth-Token' : accessToken,
              "Content-Type": "application/json"
            },
          ),
        data: employer,
    );
    return response.statusCode;
  }

  Future<String?> signUp(SignUpFormModel signUpData) async {
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

  Future<void> logout() async {
    print(await const FlutterSecureStorage().read(key: 'token'));
    await const FlutterSecureStorage().deleteAll();
  }
}

