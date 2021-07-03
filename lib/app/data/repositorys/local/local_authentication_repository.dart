import 'package:get/get.dart';
import 'package:getx_pattern_course/app/data/models/request_token.dart';
import 'package:getx_pattern_course/app/data/providers/local/local_auth.dart';

class LocalAuthRepository {
  final LocalAuth _localAuth = Get.find<LocalAuth>();

  Future<void> setSession(RequestTokenModel requestTokenModel) =>
      _localAuth.setSession(requestTokenModel);

  Future<void> clearSession() =>
      _localAuth.clearSession();

  Future<RequestTokenModel?> get session => _localAuth.getSession();
}
