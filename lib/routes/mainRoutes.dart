import 'package:flutter/cupertino.dart';
import 'package:lets_talk/ui/auth/auth.dart';
import 'package:lets_talk/ui/pages/chat.dart';
import 'package:lets_talk/ui/pages/home.dart';
import 'package:lets_talk/ui/pages/welcome.dart';
import 'package:lets_talk/ui/views/PostView.dart';
import 'package:lets_talk/ui/views/chatList.dart';
import 'package:lets_talk/ui/views/forget.dart';
import 'package:lets_talk/ui/views/login.dart';
import 'package:lets_talk/ui/views/profile.dart';
import 'package:lets_talk/ui/views/search.dart';
import 'package:lets_talk/ui/views/signup.dart';

class MainRoutes {
  Map<String, Widget Function(BuildContext)> Routes = {

    '/':(Context)=>WelcomePage(),
    '/home':(context) => HomePage(),
    AuthPage.route:(Context) => AuthPage(),
    ChatPage.route:(context) => ChatPage(),
    ChatListView.route:(context) => ChatListView(),
    PostView.route:(context) => PostView(),
    SearchView.route:(context) => SearchView(),
    ProfileView.route:(context) => ProfileView(),
    
    
  };
}
