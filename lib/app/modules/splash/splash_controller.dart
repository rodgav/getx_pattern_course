import 'package:get/get.dart';
import 'package:getx_pattern_course/app/data/models/request_token.dart';
import 'package:getx_pattern_course/app/data/repositorys/local/local_authentication_repository.dart';
import 'package:getx_pattern_course/routes/routes.dart';

class SplashController extends GetxController {
  final LocalAuthRepository _localAuthRepository =
      Get.find<LocalAuthRepository>();

  @override
  void onReady() {
    _init();
    super.onReady();
  }

  _init() async {
    try {
      final RequestTokenModel? requestTokenModel =
          await _localAuthRepository.session;
      Get.offNamed(requestTokenModel != null ? Routes.HOME : Routes.LOGIN);
    } catch (e) {
      print(e);
    }
  }
}
