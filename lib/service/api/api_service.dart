import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:test_app/logic/models/sign_in_model.dart';
import 'package:test_app/logic/models/sign_up_model.dart';
import '../../logic/models/employer_model.dart';


 class  ApiService{
  final Dio _api = Dio();
  final String _url = 'http://80.78.245.111:8085/staging/api';

  Future<String> auth(SignInModel signInFormModel) async{
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

  Future<EmployerModel> getData() async{
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
      employer = EmployerModel.fromJson(json['data']);
    }
    return employer;
  }

  Future<int?> saveData(EmployerModel employer) async{
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

  Future<String?> signUp(SignUpModel signUpData) async {
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
    await const FlutterSecureStorage().delete(key: 'token');
  }

  Future<String> uploadFile(String imagePath) async {
    final multipartFile = await MultipartFile.fromFile(
      imagePath,
      filename: imagePath.split('/').last,
    );
    final formData = FormData.fromMap({
      "file": multipartFile,
    });
    var response = await _api.post('$_url/file/upload', data: formData);
    return response.data['data']['url'];
  }
}

