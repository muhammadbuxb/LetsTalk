import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/_http/_html/_file_decoder_html.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lets_talk/controllers/auth.dart';
import 'package:lets_talk/database/user.dart';
import 'package:lets_talk/resources/string.dart';
import 'package:lets_talk/ui/auth/auth.dart';

class UserContollers extends GetxController {
  RxBool busy = false.obs;
  Rx<UserModel> user = UserModel().obs;
  Rx<String> imagePath = ''.obs;

  toggle() {
    busy.toggle();
    update();
  }

  loadUser() {
    var data = GetStorage().read(StringUtils.kUsers);
    if (data != null) {
      user.value = UserModel.fromJson(jsonDecode(data));
    }
  }

  logout() {
    FirebaseAuth.instance.signOut();
    GetStorage().remove(StringUtils.kUsers);
    Get.offAllNamed(AuthPage.route);
  }


  updateImage(XFile file) {
    user.value.photo = file.path;
    update();
  }
  uploadProfileImage(File file) async {
    try {
      toggle();

      Reference data = FirebaseStorage.instance
          .ref(StringUtils.kUsers)
          .child("${DateTime.now().microsecondsSinceEpoch}.jpg");

      var response = await data.putData(
          await file.readAsBytes(), SettableMetadata(contentType: "image/jpg"));

      if (response.state == TaskState.success) {
        // uploaded

        user.value.photo = await data.getDownloadURL();
        await FirebaseFirestore.instance
            .collection(StringUtils.kUsers)
            .doc(user.value.email)
            .update({'photo':user.value.photo});
        GetStorage().write(StringUtils.kUsers, jsonEncode(user.value.toJson()));

        Get.back();
      }
    } catch (e) {}
  }
}
