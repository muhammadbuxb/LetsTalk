import 'package:lets_talk/controllers/auth.dart';
import 'package:lets_talk/database/user.dart';
import 'package:lets_talk/ui/pages/home.dart';
import 'package:lets_talk/resources/string.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/src/material/icons.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:lets_talk/ui/views/loading.dart';
import 'package:lets_talk/ui/views/login.dart';

class SignUpView extends StatefulWidget {
  
  SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewPage();
}

class _SignUpViewPage extends State<SignUpView> {
 final _formKey = GlobalKey<FormState>();
  final UserModel userModel = UserModel();
  final _controller = Get.find<AuthController>();

  final emailController = TextEditingController();
  final passController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
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
             TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Name";
                    }
                  },
                  controller: nameController,
                   onChanged: (value) => _controller.userModel.value.name = value,
                  decoration: InputDecoration(labelText: "Full Name")),
              const SizedBox(height: 10),
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
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                ),
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty && value.length <= 6) {
                    return "Enter Password of 6 Digits ";
                  }
                },
                controller: passController,
                obscureText: true,
                onChanged: (value) => _controller.userModel.value.password = value,
                decoration: InputDecoration(labelText: "Password"),
              ),
              const SizedBox(height: 20),
               Obx((() => _controller.busy.isTrue ? const LoadingView():
              FloatingActionButton.extended(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            // Signup
                             _controller.signUp();
                          }
                        },
                        label: const Text("SignUp"),
                      )
               )),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () async {
                   AuthController auth = Get.find();
                  auth.changeView(0);
                },
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text.rich(TextSpan(
                      text: "Already have an account ?",
                      style: TextStyle(fontSize: 16),
                      children: [
                        TextSpan(
                          text: "  Login",
                          style: TextStyle(
                              color: Colors.deepPurple,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        )
                      ])),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
