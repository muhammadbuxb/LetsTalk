import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lets_talk/controllers/auth.dart';
import 'package:lets_talk/controllers/user_controller.dart';
import 'package:lets_talk/resources/string.dart';
import 'package:lets_talk/resources/string.dart';
import 'package:permission_handler/permission_handler.dart';

class ProfileView extends StatelessWidget {
  static String route = '/profile';
  final _controller = UserContollers();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) => _controller.loadUser(),
    );
   
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Obx(() => Text(_controller.user.value.name.toString())),
          actions: [],
        ),
        body: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: InkWell(
                        onTap: () async {
                          if (await Permission.storage.isDenied) {
                            await Permission.storage.request();
                            return;
                          }

                          var image = await ImagePicker()
                              .pickImage(source: ImageSource.gallery);
                          if (image != null) {
                            _controller.updateImage(image);
                            Get.dialog(AlertDialog(
                              title: Text('Do you wish to Upload Image ?'),
                              actions: [
                                TextButton(
                                    onPressed: () => {Get.back()},
                                    child: const Text('No')),
                                TextButton(
                                    onPressed: () => {
                                          _controller.uploadProfileImage(
                                              File(image.path))
                                        },
                                    child: const Text('Yes'))
                              ],
                            ));
                          }
                        },
                        child: 
                        Obx(
                          () => 
                          Container(
                            alignment: Alignment.center,
                            width: Get.width * .4,
                            height: Get.height * .3,
                            decoration: BoxDecoration(
                                border: Border.all(),
                                shape: BoxShape.circle,
                                image: getImage()
                                // image:  DecorationImage(image: NetworkImage(_controller.imagePath.value),
                                // )
                                ),
                          ),
                        )),
                  ),
                
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Card(
                        child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.person_outlined,
                                  size: 30,
                                ),
                                Obx(() => Text(
                                      _controller.user.value.name.toString(),
                                      style: TextStyle(
                                          color: Colors.blueGrey, fontSize: 25),
                                    )),
                                Icon(
                                  Icons.edit,
                                  size: 30,
                                ),
                              ],
                            )),
                      ),
                      const SizedBox(height: 20),
                      Card(
                        child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.mail_lock_outlined,
                                  size: 30,
                                ),
                                Obx(() => Text(
                                      _controller.user.value.email.toString(),
                                      style: TextStyle(
                                          color: Colors.blueGrey, fontSize: 20),
                                    )),
                                Icon(
                                  Icons.pending_outlined,
                                  size: 30,
                                ),
                              ],
                            )),
                      ),
                    ],
                  ),
                  
                  SizedBox(height:Get.height * .1),
                  GestureDetector(
                      onTap: () async {
                        _controller.logout();
                      },
                      child: Card(
                        
                        child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.logout_outlined,
                                  size: 30,
                                ),
                                Text(
                                  'LogOut',
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 25),
                                ),
                              ],
                            )),
                      )),
                ])));
  }

  DecorationImage? getImage() {
    if (_controller.imagePath.value.isNotEmpty) {
      return DecorationImage(
        image: FileImage(
          File(_controller.imagePath.value),
        ),
      );
    }
    if (_controller.user.value.photo != null) {
      return DecorationImage(
        image: NetworkImage(_controller.user.value.photo),
      );
    }

    return null;
  }
}
