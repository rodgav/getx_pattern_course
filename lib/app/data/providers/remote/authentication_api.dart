import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:getx_pattern_course/app/data/models/request_token.dart';
import 'package:getx_pattern_course/utils/constants.dart';

class AuthenticacionApi {
  final Dio _dio = Get.find<Dio>();

  Future<RequestTokenModel> newRequestToken() async {
    final response = await _dio.get('/authentication/token/new',
        queryParameters: {'api_key': Constants.THE_MOVIE_DB_API_KEY});
    return RequestTokenModel.fromJson(response.data);
  }

  Future<RequestTokenModel> validateWhitLogin(
      {required String username,
      required String password,
      required String requestToken}) async {
    final response = await _dio
        .post('/authentication/token/validate_with_login', queryParameters: {
      'api_key': Constants.THE_MOVIE_DB_API_KEY
    }, data: {
      'username': username,
      'password': password,
      'request_token': requestToken
    });
    return RequestTokenModel.fromJson(response.data);
  }
}
