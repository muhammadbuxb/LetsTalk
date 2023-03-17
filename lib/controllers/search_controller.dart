import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:lets_talk/database/user.dart';
import 'package:lets_talk/resources/string.dart';

class SearchController extends GetxController {
  RxBool busy = false.obs;
  final RxList<UserModel> users = <UserModel>[].obs;

  search(String pattern) async {
    try {
      _toggle();
      var usersFromFisebase = await FirebaseFirestore.instance
          .collection(StringUtils.kUsers)
          .where('email', isEqualTo: pattern)
          .get();
      users.clear();
      for (var data in usersFromFisebase.docs) {
        users.add(UserModel.fromJson(data.data()));
      }
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Searching Failed', e.message.toString());
    } finally {
      _toggle();
    }
  }

  _toggle() {
    busy.toggle();
    update();
  }
}
