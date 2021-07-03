import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'detail_logic.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailLogic>(
      builder: (_) {
        return Scaffold();
      },
    );
  }
}
