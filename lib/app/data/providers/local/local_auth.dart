import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:getx_pattern_course/app/data/models/request_token.dart';

class LocalAuth {
  static const KEY = 'session';
  final FlutterSecureStorage _storage = Get.find<FlutterSecureStorage>();

  setSession(RequestTokenModel requestTokenModel) async {
    await _storage.write(
        key: KEY, value: jsonEncode(requestTokenModel.toJson()));
  }
  clearSession() async {
    await _storage.delete(key: KEY);
  }

  Future<RequestTokenModel?> getSession() async {
    final data = await _storage.read(key: KEY);
    if (data != null) {
      final RequestTokenModel requestTokenModel =
          RequestTokenModel.fromJson(jsonDecode(data));
      if (DateTime.now().isBefore(requestTokenModel.expiresAt)) {
        return requestTokenModel;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }
}
