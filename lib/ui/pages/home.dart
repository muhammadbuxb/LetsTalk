import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lets_talk/controllers/auth.dart';
import 'package:lets_talk/controllers/user_controller.dart';
import 'package:lets_talk/resources/string.dart';
import 'package:lets_talk/ui/views/PostView.dart';
import 'package:lets_talk/ui/views/chatList.dart';
import 'package:lets_talk/ui/views/profile.dart';
import 'package:lets_talk/ui/views/search.dart';
import 'package:shaped_bottom_bar/models/shaped_item_object.dart';
import 'package:shaped_bottom_bar/shaped_bottom_bar.dart';
import 'package:shaped_bottom_bar/utils/arrays.dart';

class HomePage extends StatefulWidget {
  static String route = '/home';

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
 String data = 'inital';
  @override
  void initState() {
    super.initState();
    _controller.loadUser();
  }

  late final AuthController _controller = Get.find();
  @override
  void dispose() {
    //close it here
    super.dispose();
  }


  int currentTab = 0;
  final List<Widget> homeViews = [PostView(),ChatListView(),SearchView(), ProfileView()];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = PostView();

  @override
  Widget build(BuildContext context) {
    final _controller = UserContollers();
    return Scaffold(
      body: 
      PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),

      bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 20,
          child: Container(
              height: 55,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                          
                        MaterialButton(
                            minWidth: 50,
                            onPressed: () {
                              setState(() {
                                currentScreen = PostView();
                                currentTab = 0;
                              });
                            },
                          child: Column(
                            mainAxisAlignment:MainAxisAlignment.center,
                            children: [
                              Icon(
                                  Icons.home_rounded,
                                  size: 35,
                                  color: currentTab == 0 ? Colors.deepPurple: Colors.grey,
                                  ), // Icon
                                Text (
                                  'Home',
                                  style: TextStyle(
                                  color: currentTab == 0 ? Colors.deepPurple: Colors.grey),
                                  ) // Text 
                          ]),  
                            ),
                        
                          
                        MaterialButton(
                            minWidth: 50,
                            onPressed: () {
                              setState(() {
                                currentScreen = ChatListView();
                                currentTab = 1;
                              });
                            },
                          child: Column(
                            mainAxisAlignment:MainAxisAlignment.center,
                            children: [
                              Icon(
                                  Icons.sms_outlined,
                                  size: 35,
                                  color: currentTab == 1 ? Colors.deepPurple: Colors.grey,
                                  ), // Icon
                                Text (
                                  'Chat',
                                  style: TextStyle(
                                  color: currentTab == 1 ? Colors.deepPurple: Colors.grey),
                                  ) // Text 
                          ]),  
                            ),
                        
                          
                        MaterialButton(
                            minWidth: 50,
                            onPressed: () {
                              setState(() {
                                currentScreen = SearchView();
                                currentTab = 2;
                              });
                            },
                          child: Column(
                            mainAxisAlignment:MainAxisAlignment.center,
                            children: [
                              Icon(
                                  Icons.person_search_outlined,
                                  size: 35,
                                  color: currentTab == 2 ? Colors.deepPurple: Colors.grey,
                                  ), // Icon
                                Text (
                                  'Search',
                                  style: TextStyle(
                                  color: currentTab == 2 ? Colors.deepPurple: Colors.grey),
                                  ) // Text 
                          ]),  
                            ),
                        
                        
                        MaterialButton(
                            minWidth: 50,
                            onPressed: () {
                              setState(() {
                                currentScreen = ProfileView();
                                currentTab = 3;
                              });
                            },
                          child: Column(
                            mainAxisAlignment:MainAxisAlignment.center,
                            children: [
                              Icon(
                                  Icons.person_pin,
                                  size: 35,
                                  color: currentTab == 3 ? Colors.deepPurple: Colors.grey,
                                  ), // Icon
                                Text (
                                  'Profile',
                                  style: TextStyle(
                                  color: currentTab == 3 ? Colors.deepPurple: Colors.grey),
                                  ) // Text 
                          ]),  
                            ),
                       
                      ],
                    ),
                  ]))),
    
    );
  }
}
