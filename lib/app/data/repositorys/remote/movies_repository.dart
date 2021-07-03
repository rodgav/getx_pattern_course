import 'package:get/get.dart';
import 'package:getx_pattern_course/app/data/models/movie_model.dart';
import 'package:getx_pattern_course/app/data/providers/remote/movies_api.dart';

class MoviesRepository {
  final MoviesApi _moviesApi = Get.find<MoviesApi>();

  Future<MovieModel> getTopMovies() => _moviesApi.getTopMovies();
}
