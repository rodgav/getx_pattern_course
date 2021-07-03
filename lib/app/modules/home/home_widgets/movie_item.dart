import 'package:flutter/material.dart';
import 'package:getx_pattern_course/app/data/models/movie_model.dart';
import 'package:getx_pattern_course/utils/constants.dart';

class MovieItem extends StatelessWidget {
  final Result result;

  const MovieItem({Key? key, required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
          '${Constants.THE_MOVIE_DB_IMG_PATH}${result.posterPath}'),
      title: Text(result.title),
      subtitle: Text(
        result.overview,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
