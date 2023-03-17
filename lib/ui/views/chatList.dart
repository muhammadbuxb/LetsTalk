import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lets_talk/controllers/user_controller.dart';
import 'package:lets_talk/database/chatRoomModel.dart';
import 'package:lets_talk/database/user.dart';
import 'package:lets_talk/resources/string.dart';
import 'package:lets_talk/ui/pages/chat.dart';
import 'package:lets_talk/ui/pages/chatScreen.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:uuid/uuid.dart';

class ChatListView extends StatelessWidget {
  static String route = '/chatlist';
  final _controller = UserContollers();

  // I have Created targetUserUid in obs 
  // RxString targetUserUid = ''.obs;
  
  final uuid = Uuid();
 Future<ChatRoomModel?> getChatRoomModel(targetUserUid) async {
    ChatRoomModel? chatRoom;
    final UserId = _controller.user.value.email.toString();
   
    // I want to print targetUserUid here 
    print(targetUserUid);
    print(UserId);
    
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('chatRooms')
        .where('participants.$UserId', isEqualTo: true)
        .where('participants.$targetUserUid', isEqualTo: true)
        .get();
    print(targetUserUid);

    if (snapshot.docs.length > 0) {
      // fetch the existing one
      var docData = snapshot.docs[0].data();
      ChatRoomModel existingChatRoom =
          ChatRoomModel.fromMap(docData as Map<String, dynamic>);

      chatRoom = existingChatRoom;
      Get.snackbar('', 'Already Created');
      //  Fluttertoast.showToast(msg: 'ChatRoom already created!');
    } else {
      // create a new one
      print('print before Creating Chat Room');
      print(UserId);
      print(targetUserUid);
      ChatRoomModel newchatRoom = ChatRoomModel(
        chatRoomId: uuid.v1(),
        participants: {
          targetUserUid.toString(): true,
          _controller.user.value.email.toString(): true,
        },
        lastMessage: '',
      );
      await FirebaseFirestore.instance
          .collection('chatRooms')
          .doc(newchatRoom.chatRoomId)
          .set(newchatRoom.toMap());

      chatRoom = newchatRoom;
      Get.snackbar('Chat Room', 'New chatRoom created!');
      // Fluttertoast.showToast(msg: 'New chatRoom created!');
    }
    return chatRoom;
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) => _controller.loadUser(),
    );
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Obx(() => Text(
                    _controller.user.value.name.toString(),
                    style: TextStyle(fontSize: 25),
                  )),
              actions: [],
            ),
            body: Center(
              child: PaginateFirestore(
                //item builder type is compulsory.
                itemBuilder: (context, documentSnapshots, index) {
                  final data = documentSnapshots[index].data() as Map?;
                  
                  // Updated value of targetUserUid here inside the ItemBuilder
                  final targetUserUid =data?['email'].toString();

                  return ListTile(
                    leading: Container(
                      alignment: Alignment.center,
                      width: Get.width * .2,
                      height: Get.height * .2,
                      decoration: BoxDecoration(
                          border: Border.all(),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(data?['photo']),
                          )),
                    ),
                    title: data == null
                        ? Text('Error in data')
                        : Text(data['name']),
                    subtitle: Text(documentSnapshots[index].id),
                    onLongPress: () async {
                      print(targetUserUid);
                      print(_controller.user.value.email);
                      print('OnLongPress Print DOne');
                      //     UserModel? targetUser = await FirbaseHelper.getUserModelById(
                      // data?[index]);

                      // UserModel targetUser = data?[index];
                      UserModel targetUser =
                          UserModel.fromJson(data as Map<String, dynamic>);

                      ChatRoomModel? chatRoomModel =
                          await getChatRoomModel(targetUserUid);
                      if (chatRoomModel != null) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChatDetailPage(
                                      targetUser: targetUser,
                                      chatRoomModel: chatRoomModel,
                                      userModel: _controller.user.value,
                                    )));
                      }
                      ;
                    },
                  );
                },
              
                // orderBy is compulsory to enable pagination
                query: FirebaseFirestore.instance
                    .collection(StringUtils.kUsers)
                    .doc(FirebaseAuth.instance.currentUser!.email)
                    .collection(StringUtils.kFriends)
                    .orderBy('name'),
                //Change types accordingly
                itemBuilderType: PaginateBuilderType.listView,
                // to fetch real-time data
                isLive: true,
              ),
              
            )));
  }

 }
