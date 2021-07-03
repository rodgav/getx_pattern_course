import 'package:get/get.dart';
import 'package:getx_pattern_course/app/data/models/movie_model.dart';
import 'package:getx_pattern_course/app/data/repositorys/local/local_authentication_repository.dart';
import 'package:getx_pattern_course/app/data/repositorys/remote/movies_repository.dart';
import 'package:getx_pattern_course/routes/routes.dart';

class HomeLogic extends GetxController {
  final LocalAuthRepository _localAuthRepository =
      Get.find<LocalAuthRepository>();
  final MoviesRepository _moviesRepository = Get.find<MoviesRepository>();

  MovieModel? _movieModel;

  MovieModel? get movieModel => _movieModel;

  Future<void> logOut() async {
    await _localAuthRepository.clearSession();
    Get.offNamedUntil(Routes.LOGIN, (route) => false);
  }

  @override
  void onReady() {
    _load();
    super.onReady();
  }

  Future<void> _load() async {
    try {
      _movieModel =await _moviesRepository.getTopMovies();
      update();
    } catch (e) {
      print('Error $e');
    }
  }
}
