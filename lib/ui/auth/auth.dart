import 'package:lets_talk/controllers/auth.dart';
import 'package:lets_talk/controllers/bindings.dart';
import 'package:lets_talk/database/user.dart';
import 'package:lets_talk/resources/string.dart';
import 'package:lets_talk/ui/pages/home.dart';
import 'package:lets_talk/ui/views/forget.dart';
import 'package:lets_talk/ui/views/loading.dart';
import 'package:lets_talk/ui/views/login.dart';
import 'package:lets_talk/ui/views/signup.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/material/colors.dart';
import 'package:flutter/src/widgets/media_query.dart';
import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:lets_talk/ui/auth/auth.dart';

class AuthPage extends StatefulWidget {
  static String route = '/auth';
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  final AuthController _controller = Get.find();
  final List<Widget> authViews = [LoginView(), SignUpView(),ForgetPassView()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(10),
          child: ListView(
            shrinkWrap: true,
            children: [
              Hero(
                tag: 'logo',
                child: Image.asset(
                  StringUtils.logo,
                  width: Get.width * .2,
                  height: Get.height * .2,
                ),
              ),
               Obx(
              () => _controller.authViews[_controller.selectedIndex.value],
            )
            ],
          )),
    );
  }
}
