import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lets_talk/resources/string.dart';
import 'package:lets_talk/controllers/bindings.dart';
import 'package:lets_talk/ui/auth/auth.dart';
import 'package:lets_talk/ui/pages/home.dart';
import 'package:get/get.dart';
import 'package:lets_talk/ui/views/login.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  State<WelcomePage> createState() => _WelcomePage();
}

class _WelcomePage extends State<WelcomePage> {
   @override
  void initState() {

    Timer (const Duration (seconds: 3), () {
      Get.to(()=>HomePage(), duration: const Duration (milliseconds: 900));
      }); 

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Hero(
        tag: 'logo',
        child: Image.asset(
          StringUtils.logo,
          width: Get.width * .4,
          height: Get.height * .4,
        ),
      )),
    );
  }
}
