import 'package:lets_talk/controllers/auth.dart';
import 'package:lets_talk/database/user.dart';
import 'package:lets_talk/ui/pages/home.dart';
import 'package:lets_talk/resources/string.dart';
import 'package:lets_talk/ui/views/login.dart';
import 'package:lets_talk/ui/views/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPassView extends StatefulWidget {
  static String route = '/forget';
  ForgetPassView({super.key});

  @override
  State<ForgetPassView> createState() => _ForgetPassViewPage();
}

class _ForgetPassViewPage extends State<ForgetPassView> {
   final _formKey = GlobalKey<FormState>();
  final UserModel userModel = UserModel();
  final _controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return 
   Container(
      width: Get.width,
      // height: Get.height * .9,
      padding: const EdgeInsets.all(10),
      child: Form(
        key: _formKey,
        child: Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(15),
          ),
          child: ListView(
            shrinkWrap: true,
            children: [
              Padding(padding: const EdgeInsets.only(top: 20)),
              Hero(
                tag: 'logo',
                child: Image.asset(
                  StringUtils.logo,
                  width: Get.width * .2,
                  height: Get.height * .2,
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                validator: (Value) {
                  if (Value!.contains("@") &&
                      Value.contains(".") &&
                      Value.length >= 5) {
                    return null;
                  }
                  return "Invalid Email Type";
                },
                onChanged: (value) => {},
                decoration: InputDecoration(
                  labelText: "Email",
                ),
              ),
              const SizedBox(height: 25),
              FloatingActionButton.extended(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    // Get.offAllNamed(LoginView.route);
                  }
                },
                label: Text(
                  "Send Mail",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(height: 25),
              GestureDetector(
                onTap: () async {
                  AuthController auth = Get.find();
                  auth.changeView(0);
                },
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Text.rich(TextSpan(
                        text: "Back to ",
                        style: TextStyle(fontSize: 16),
                        children: [
                          TextSpan(
                            text: "  Login ",
                            style: TextStyle(
                                color: Colors.deepPurple,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          )
                        ])),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
