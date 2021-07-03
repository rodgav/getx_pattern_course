import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_pattern_course/app/modules/home/home_widgets/movie_item.dart';

import 'home_logic.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GetBuilder<HomeLogic>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(onPressed: _.logOut, icon: Icon(Icons.exit_to_app))
            ],
          ),
          body: Container(
            width: size.width,
            height: size.height,
            color: Colors.transparent,
            padding: EdgeInsets.all(20),
            child: _.movieModel != null
                ? ListView.builder(
                    itemBuilder: (__, index) {
                      return MovieItem(result: _.movieModel!.results[index]);
                    },
                    itemCount: _.movieModel!.results.length,
                  )
                : Center(
                    child: Text('Ocurrio un error'),
                  ),
          ),
        );
      },
    );
  }
}
