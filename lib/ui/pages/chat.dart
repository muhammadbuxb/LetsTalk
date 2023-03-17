
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:chat_bubbles/message_bars/message_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

class ChatPage extends StatefulWidget {
  static String route = '/chat';
  @override
  State<ChatPage> createState() => _ChatPage();
}

class _ChatPage extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
final args = ModalRoute.of(context)?.settings.arguments;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title:Text('$args'),
        actions: [],
      ),
      body: Padding(
          padding: EdgeInsets.all(2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  
                  SizedBox(
                    height: Get.height * .8,
                    child: 
                    Padding(padding:EdgeInsets.only(top: 10),
                    child:ListView(
                      children: [
                        BubbleSpecialThree(
                          text: 'Please try and give some feedback on it!',
                          color: Color(0xFF1B97F3),
                          tail: true,
                          isSender: false,
                          textStyle:
                              TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        BubbleSpecialThree(
                          text: 'Sure',
                          color: Color(0xFFE8E8EE),
                          tail: true,
                          isSender: true,
                        ),
                        BubbleSpecialThree(
                          text: 'Please try and give some feedback on it!',
                          color: Color(0xFF1B97F3),
                          tail: true,
                          isSender: false,
                          textStyle:
                              TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      
                        BubbleSpecialThree(
                          text: "I tried. It's awesome!!!",
                          color: Color(0xFFE8E8EE),
                          tail: false,
                          isSender: true,
                        ),
                        BubbleSpecialThree(
                          text: "Thanks",
                          color: Color(0xFFE8E8EE),
                          tail: true,
                          isSender: false,
                        ),
                        BubbleSpecialThree(
                          text: "I tried. It's awesome!!!",
                          color: Color(0xFFE8E8EE),
                          tail: false,
                          isSender: true,
                        ),
                        BubbleSpecialThree(
                          text: "Thanks",
                          color: Color(0xFFE8E8EE),
                          tail: true,
                          isSender: false,
                        ),
                      ],
                    ),
                    )
                  ),
                  MessageBar(
                    onSend: (_) => print(_),
                    actions: [
                      Padding(
                        padding: EdgeInsets.only(left: 8, right: 8),
                        child: InkWell(
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.deepPurple,
                            size: 24,
                          ),
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                ],
              ))),
    );
  }
}
