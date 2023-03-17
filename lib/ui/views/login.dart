import 'package:lets_talk/controllers/auth.dart';
import 'package:lets_talk/controllers/bindings.dart';
import 'package:lets_talk/database/user.dart';
import 'package:lets_talk/ui/pages/home.dart';
import 'package:lets_talk/resources/string.dart';
import 'package:lets_talk/ui/views/forget.dart';
import 'package:lets_talk/ui/views/loading.dart';
import 'package:lets_talk/ui/views/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends StatefulWidget {
  LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewPage();
}

class _LoginViewPage extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final UserModel userModel = UserModel();
  final _controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
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
              Text(
                'Login',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 35, color: Colors.deepPurple),
              ),
              TextFormField(
                validator: (Value) {
                  if (Value!.contains("@") &&
                      Value.contains(".") &&
                      Value.length >= 5) {
                    return null;
                  }
                  return "Invalid Email Type";
                },
                onChanged: (value) => _controller.userModel.value.email = value,
                decoration: InputDecoration(
                  labelText: "Email",
                ),
              ),
              const SizedBox(height: 25),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(labelText: "Password"),
                onChanged: (value) =>
                    _controller.userModel.value.password = value,
              ),
              const SizedBox(height: 15),
              TextButton(
                  onPressed: () {
                    AuthController auth = Get.find();
                    auth.changeView(2);
                  },
                  child: Text(
                    "Forget Password",
                    style: TextStyle(fontSize: 20),
                  )),
              const SizedBox(height: 25),
              Obx((() => _controller.busy.isTrue ? const LoadingView():
              FloatingActionButton.extended(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    //login
                    _controller.login();
                  }
                },
                label: const Text("SignIn"),
              )
               )),
              const SizedBox(height: 25),
              GestureDetector(
                onTap: () async {
                  AuthController auth = Get.find();
                  auth.changeView(1);
                },
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text.rich(TextSpan(
                      text: "Didn't have an account?",
                      style: TextStyle(fontSize: 16),
                      children: [
                        TextSpan(
                          text: "  SignUp",
                          style: TextStyle(
                              color: Colors.deepPurple,
                              fontSize: 15,
                              fontWeight: FontWeight.w700),
                        )
                      ])),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
