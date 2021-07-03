import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_pattern_course/app/data/repositorys/local/local_authentication_repository.dart';
import 'package:getx_pattern_course/app/data/repositorys/remote/authentication_repository.dart';
import 'package:getx_pattern_course/routes/routes.dart';

class LoginController extends GetxController {
  final AuthenticationRepository _repository =
      Get.find<AuthenticationRepository>();
  final LocalAuthRepository _localAuthRepository = Get.find<LocalAuthRepository>();

  String _username = '', _password = '';

  void onUsernameChange(String text) {
    _username = text;
  }

  void onPasswordChange(String text) {
    _password = text;
  }

  submit() async {
    try {
      final requestTokenModel = await _repository.newRequestToken();
     final authRequestToken = await _repository.authWhitLogin(
          username: _username,
          password: _password,
          requestToken: requestTokenModel.requestToken);
      await _localAuthRepository.setSession(authRequestToken);
      Get.offNamed(Routes.HOME);
    } catch (e) {
      print('Error $e');
      String message = '';
      if (e is DioError) {
        if (e.response != null) {
          message = e.response!.statusMessage!;
        } else {
          message = e.message;
        }
      }
      Get.dialog(AlertDialog(
        title: Text('ERROR'),
        content: Text(message),
        actions: [TextButton(onPressed: () => Get.back(), child: Text('OK'))],
      ));
    }
  }
}
