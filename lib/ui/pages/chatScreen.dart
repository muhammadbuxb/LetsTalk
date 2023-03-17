import 'package:chat_bubbles/bubbles/bubble_special_two.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lets_talk/controllers/user_controller.dart';
import 'package:lets_talk/database/chatRoomModel.dart';
import 'package:lets_talk/database/messageModel.dart';
import 'package:lets_talk/database/user.dart';
import 'package:uuid/uuid.dart';

class ChatDetailPage extends StatefulWidget {
  final _controller = UserContollers();
  final UserModel targetUser;
  final ChatRoomModel chatRoomModel;
  final UserModel userModel;

  ChatDetailPage({
    Key? key,
    required this.targetUser,
    required this.chatRoomModel,
    required this.userModel,
  }) : super(key: key);
  @override
  _ChatDetailPageState createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  final uuid = Uuid();
  void sendMessage() async {
    String msg = messageEditingController.text.trim();
    messageEditingController.clear();
    if (msg != '') {
      //send Message
      MessageModel newMessage = MessageModel(
        messageId: uuid.v1(),
        sender: widget.userModel.email,
        createdon: Timestamp.now(),
        text: msg,
        seen: false,
      );
      FirebaseFirestore.instance
          .collection('chatRooms')
          .doc(widget.chatRoomModel.chatRoomId)
          .collection('messages')
          .doc(newMessage.messageId)
          .set(newMessage.toMap());
      widget.chatRoomModel.lastMessage = msg;
      FirebaseFirestore.instance
          .collection('chatRooms')
          .doc(widget.chatRoomModel.chatRoomId)
          .set(widget.chatRoomModel.toMap());
      Get.snackbar('', 'Message Sent!');
      // Fluttertoast.showToast(msg: 'Message Sent!');
    } else {}
  }

  TextEditingController messageEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        flexibleSpace: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "${widget.targetUser.name}",
                        style: const TextStyle(
                            letterSpacing: 2,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                      Text(
                        "${widget.targetUser.email}",
                        style: TextStyle(
                            letterSpacing: 2,
                            color: Colors.deepPurple,
                            fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('chatRooms')
                    .doc(widget.chatRoomModel.chatRoomId)
                    .collection('messages')
                    .orderBy('createdon', descending: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    if (snapshot.hasData) {
                      QuerySnapshot dataSnapshot =
                          snapshot.data as QuerySnapshot;
                      return ListView.builder(
                        reverse: true,
                        itemCount: dataSnapshot.docs.length,
                        itemBuilder: (context, index) {
                          MessageModel currentMessage = MessageModel.fromMap(
                              dataSnapshot.docs[index].data()
                                  as Map<String, dynamic>);
                          return currentMessage.sender == widget.userModel.email
                              ? BubbleSpecialTwo(
                                  text: currentMessage.text.toString(),
                                  textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1.3),
                                  isSender: true,
                                  color: Colors.deepPurple,
                                  tail: false,
                                )
                              : BubbleSpecialTwo(
                                  text: currentMessage.text.toString(),
                                  textStyle: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                      letterSpacing: 1.3),
                                  isSender: false,
                                  color: Color(0xFFE8E8EE),
                                  tail: false,
                                );
                          //  return Text(currentMessage.text.toString());
                        },
                      );
                    } else if (snapshot.hasError) {
                      return const Center(
                        child: Text(
                          'An error occured! Please check your internet connection',
                          style: TextStyle(
                            letterSpacing: 1.5,
                            color: Colors.blueAccent,
                          ),
                        ),
                      );
                    } else {
                      return const Center(
                        child: Text(
                          'Say hi to your new friend',
                          style: TextStyle(
                            letterSpacing: 1.5,
                            color: Colors.blueAccent,
                          ),
                        ),
                      );
                    }
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.deepPurple,
                      ),
                    );
                  }
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: const EdgeInsets.only(left: 16, bottom: 10),
              height: 80,
              width: double.infinity,
              color: Colors.blueGrey,
              child: Row(
                children: <Widget>[
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: TextField(
                      controller: messageEditingController,
                      onSubmitted: (val) {
                        messageEditingController.text = val;
                      },
                      cursorColor: Colors.blueAccent,
                      maxLines: null,
                      style: const TextStyle(
                        fontSize: 15,
                        letterSpacing: 1.4,
                        color: Colors.black,
                      ),
                      decoration: const InputDecoration(
                          hintText: "Type message...",
                          hintStyle:
                              TextStyle(letterSpacing: 2, color: Colors.black),
                          border: InputBorder.none),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {});
                      sendMessage();
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.send_rounded,
                        color: Colors.white,
                        size: 21,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
