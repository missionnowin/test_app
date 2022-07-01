import 'package:test_app/service/api/api_service.dart';

class ApiSingleTon{
  static final ApiService _singleTon = ApiService();
  static ApiService get instance => _singleTon;
}