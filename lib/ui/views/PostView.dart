import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lets_talk/resources/string.dart';
import 'package:lets_talk/ui/pages/chat.dart';

class PostView extends StatelessWidget {
  static String route = '/post';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Text(
                "Let's Talk",
                style: TextStyle(fontSize: 20),
              ),
              actions: [],
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: Get.width,
                  height: Get.height * .8,
                  child: Padding(
                      padding: EdgeInsets.only(top: 25),
                      child: ListView(
                        children: [
                          Card(
                            child: Padding(
                              padding: EdgeInsets.all(20),
                              child: Column(children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Icon(
                                        Icons.person_outline_sharp,
                                        size: 35,
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      'Ahmed Bux',
                                      style: TextStyle(
                                          fontSize: 25, color: Colors.blue),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                        width: Get.width * .8,
                                        child: Padding(
                                          padding: EdgeInsets.all(15),
                                          child: Text(
                                            'onGenerateRoute seems apt here. I had not considered it. You may put this as an answer so that I may accept it. Overall onGenerateRoute seems more convenient. It can also be used with initialRoute which was not clear from the example given on the page.',
                                            style: TextStyle(
                                              fontSize: 18,
                                            ),
                                          ),
                                        ))
                                  ],
                                ),
                                Padding(
                                    padding: EdgeInsets.all(2),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        GestureDetector(
                                          child: Row(children: [
                                            Icon(Icons.thumb_up),
                                            Text('Like')
                                          ]),
                                        ),
                                        GestureDetector(
                                          child: Row(children: [
                                            Icon(Icons.mode_comment_outlined),
                                            Text('Comment')
                                          ]),
                                        ),
                                        GestureDetector(
                                          child: Row(children: [
                                            Icon(Icons.share_outlined),
                                            Text('Share')
                                          ]),
                                        ),
                                      ],
                                    )),
                              ]),
                            ),
                          ),
                          Card(
                            child: Padding(
                              padding: EdgeInsets.all(20),
                              child: Column(children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Icon(
                                        Icons.person_outline_sharp,
                                        size: 35,
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      'Awais Meo',
                                      style: TextStyle(
                                          fontSize: 25, color: Colors.blue),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                        width: Get.width * .8,
                                        child: Padding(
                                          padding: EdgeInsets.all(15),
                                          child: Text(
                                            "Therefore, even someone without any technical knowledge can become a great web designer using platforms like Mockplus, Figma or Sketch. Of course, it would be great if you know some coding language (HTML, CSS, Java), but you can't get yourself deep into front-end development, that's not the core of web design.",
                                            style: TextStyle(
                                              fontSize: 18,
                                            ),
                                          ),
                                        ))
                                  ],
                                ),
                                Padding(
                                    padding: EdgeInsets.all(2),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        GestureDetector(
                                          child: Row(children: [
                                            Icon(Icons.thumb_up),
                                            Text('Like')
                                          ]),
                                        ),
                                        GestureDetector(
                                          child: Row(children: [
                                            Icon(Icons.mode_comment_outlined),
                                            Text('Comment')
                                          ]),
                                        ),
                                        GestureDetector(
                                          child: Row(children: [
                                            Icon(Icons.share_outlined),
                                            Text('Share')
                                          ]),
                                        ),
                                      ],
                                    )),
                              ]),
                            ),
                          ),
                          Card(
                            child: Padding(
                              padding: EdgeInsets.all(20),
                              child: Column(children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Icon(
                                        Icons.person_outline_sharp,
                                        size: 35,
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      'Muhammad Taha',
                                      style: TextStyle(
                                          fontSize: 25, color: Colors.blue),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                        width: Get.width * .8,
                                        child: Padding(
                                          padding: EdgeInsets.all(15),
                                          child: Text(
                                            "A mobile app (or mobile application) is a software application developed specifically for use on small, wireless computing devices, such as smartphones and tablets, rather than desktop or laptop computers.",
                                            style: TextStyle(
                                              fontSize: 18,
                                            ),
                                          ),
                                        ))
                                  ],
                                ),
                                Padding(
                                    padding: EdgeInsets.all(2),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        GestureDetector(
                                          child: Row(children: [
                                            Icon(Icons.thumb_up),
                                            Text('Like')
                                          ]),
                                        ),
                                        GestureDetector(
                                          child: Row(children: [
                                            Icon(Icons.mode_comment_outlined),
                                            Text('Comment')
                                          ]),
                                        ),
                                        GestureDetector(
                                          child: Row(children: [
                                            Icon(Icons.share_outlined),
                                            Text('Share')
                                          ]),
                                        ),
                                      ],
                                    )),
                              ]),
                            ),
                          ),
                          Card(
                            child: Padding(
                              padding: EdgeInsets.all(20),
                              child: Column(children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Icon(
                                        Icons.person_outline_sharp,
                                        size: 35,
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      'Hassan Ali',
                                      style: TextStyle(
                                          fontSize: 25, color: Colors.blue),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                        width: Get.width * .8,
                                        child: Padding(
                                          padding: EdgeInsets.all(15),
                                          child: Text(
                                            "Data science combines math and statistics, specialized programming, advanced analytics, artificial intelligence (AI), and machine learning with specific subject matter expertise to uncover actionable insights hidden in an organization's data. These insights can be used to guide decision making and strategic planning.",
                                            style: TextStyle(
                                              fontSize: 18,
                                            ),
                                          ),
                                        ))
                                  ],
                                ),
                                Padding(
                                    padding: EdgeInsets.all(2),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        GestureDetector(
                                          child: Row(children: [
                                            Icon(Icons.thumb_up),
                                            Text('Like')
                                          ]),
                                        ),
                                        GestureDetector(
                                          child: Row(children: [
                                            Icon(Icons.mode_comment_outlined),
                                            Text('Comment')
                                          ]),
                                        ),
                                        GestureDetector(
                                          child: Row(children: [
                                            Icon(Icons.share_outlined),
                                            Text('Share')
                                          ]),
                                        ),
                                      ],
                                    )),
                              ]),
                            ),
                          ),
                        ],
                      )),
                )
              ],
            )));
  }
}
