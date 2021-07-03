import 'package:get/get.dart';
import 'package:getx_pattern_course/app/data/models/request_token.dart';
import 'package:getx_pattern_course/app/data/providers/remote/authentication_api.dart';

class AuthenticationRepository {
  final AuthenticacionApi _api = Get.find<AuthenticacionApi>();

  Future<RequestTokenModel> newRequestToken() => _api.newRequestToken();

  Future<RequestTokenModel> authWhitLogin(
          {required String username,
          required String password,
          required String requestToken}) =>
      _api.validateWhitLogin(
          username: username, password: password, requestToken: requestToken);
}
