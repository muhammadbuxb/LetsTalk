import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:lets_talk/controllers/chat_controller.dart';
import 'package:lets_talk/controllers/search_controller.dart';
import 'package:lets_talk/database/user.dart';
import 'package:lets_talk/resources/string.dart';
import 'package:lets_talk/ui/views/loading.dart';

class SearchView extends StatelessWidget {
  static String route = '/search';
  final _search = TextEditingController();
  final _controller = SearchController();
  final _addFriend = ChatController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Search User'),
          actions: [],
        ),
        body: Padding(
            padding: EdgeInsets.all(20),
            child: Wrap(
              children: [
                TextFormField(
                    controller: _search,
                    decoration: InputDecoration(
                        hintText: 'Search For user email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        suffixIcon: Obx(
                          () => _controller.busy.isTrue
                              ? LoadingView()
                              : IconButton(
                                  onPressed: () async {
                                    _controller.search(_search.text);
                                  },
                                  icon: const Icon(Icons.search),
                                ),
                        ))),
                Obx(() => _controller.busy.isTrue
                    ? const LoadingView()
                    : Expanded(
                        flex: 2,
                        child: ListView.separated(
                          shrinkWrap: true,
                          separatorBuilder: ((context, index) =>
                              const Divider()),
                          itemBuilder: ((context, index) => ListTile(
                              trailing: Obx(
                                () => _addFriend.busy.isTrue
                                    ? const LoadingView()
                                    : IconButton(
                                        icon: Icon(Icons.person_add),
                                        onPressed: () async {
                                          ChatController().addPersonToChat(
                                              _controller.users[index]
                                                  as UserModel);
                                          Get.snackbar("Add Friend", "Friend Added Successfully");
                                        },
                                      ),
                              ),
                              title: Text(
                                  _controller.users[index].name.toString()))),
                          itemCount: _controller.users.length,
                        )))
              ],
            )));
  }
}
