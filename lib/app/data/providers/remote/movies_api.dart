import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:getx_pattern_course/app/data/models/movie_model.dart';
import 'package:getx_pattern_course/utils/constants.dart';

class MoviesApi {
  final Dio _dio = Get.find<Dio>();

  Future<MovieModel> getTopMovies() async {
    final response = await _dio.get('/movie/top_rated', queryParameters: {
      'api_key': Constants.THE_MOVIE_DB_API_KEY,
      'language': 'es'
    });
    return MovieModel.fromJson(response.data);
  }
}
