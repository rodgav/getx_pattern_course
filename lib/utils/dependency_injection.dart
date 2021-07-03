import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:getx_pattern_course/app/data/providers/local/local_auth.dart';
import 'package:getx_pattern_course/app/data/providers/remote/movies_api.dart';
import 'package:getx_pattern_course/app/data/repositorys/local/local_authentication_repository.dart';
import 'package:getx_pattern_course/app/data/repositorys/remote/authentication_repository.dart';
import 'package:getx_pattern_course/app/data/providers/remote/authentication_api.dart';
import 'package:getx_pattern_course/app/data/repositorys/remote/movies_repository.dart';

class DependencyInjection {
  static void init() {
    Get.put<FlutterSecureStorage>(FlutterSecureStorage());
    Get.put<Dio>(Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      /* followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          },*/
    )));
    // providers
    Get.put<AuthenticacionApi>(AuthenticacionApi());
    Get.put<LocalAuth>(LocalAuth());
    Get.put<MoviesApi>(MoviesApi());
    // repositories
    Get.put<AuthenticationRepository>(AuthenticationRepository());
    Get.put<LocalAuthRepository>(LocalAuthRepository());
    Get.put<MoviesRepository>(MoviesRepository());
  }
}
