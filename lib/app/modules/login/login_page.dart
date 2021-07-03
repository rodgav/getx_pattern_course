import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_pattern_course/app/modules/login/login_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GetBuilder<LoginController>(
      builder: (_) {
        return Scaffold(
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Container(
              width: size.width,
              height: size.height,
              color: Colors.transparent,
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    onChanged: _.onUsernameChange,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(labelText: 'username'),
                  ),
                  TextField(
                    onChanged: _.onPasswordChange,
                    obscureText: true,
                    decoration: InputDecoration(labelText: 'password'),
                  ),
                  TextButton(
                      style:
                          TextButton.styleFrom(backgroundColor: Colors.black),
                      onPressed: _.submit,
                      child: Text(
                        'Send',
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
