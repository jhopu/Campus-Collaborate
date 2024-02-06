import 'package:campus_collaborate/chats/screens/chat_splash_screen.dart';
import 'package:campus_collaborate/widgets/commonWidgets/common_text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../constants/themes.dart';
import '../../locator.dart';
import 'dm_message_screen.dart';

class DmChatScreen extends StatefulWidget {
  const DmChatScreen({super.key});

  @override
  DmChatScreenState createState() => DmChatScreenState();
}

class DmChatScreenState extends State<DmChatScreen> {
  TextEditingController textController1 = TextEditingController();
  final Stream<QuerySnapshot> _chatStream =
      FirebaseFirestore.instance.collection('DmConversations').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          backgroundColor: Themes.getColors(ColorsValues.LIGHT_GREY_COLOR),
          leading: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                GestureDetector(
                  child: Image.asset(
                    'assets/back_arrow.png',
                  ),
                  onTap: () {
                    navigationService.pop();
                  },
                ),
              ],
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 25),
              child: CommonTextField(textEditingController: textController1,
                hintText: 'Search...',
                backgroundColor: Themes.getColors(ColorsValues.SEARCH_BAR_COLOR),
                width: 310,
                height: 35,
                suffix: Image.asset('assets/funnel.png'),
              ),
            ),
          ],
          elevation: 0,
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _chatStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return SplashScreen1();
          }

          return ListView(
            children: snapshot.data!.docs.where((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              var isContain = false;
              String userId = "user1";
              if (data['user1'] == userId || data['user2'] == userId) {
                isContain = true;
              }
              return isContain;
            }).map((DocumentSnapshot document) {
              String GroupId = document.id;
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              if (data['user1'] == "user1") {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DmMessageScreen(
                          groupId: GroupId,
                          user: data['user2'],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.all(30.0),
                    padding: const EdgeInsets.fromLTRB(5, 5, 20, 20),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(217, 217, 217, 1),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          child: Icon(
                              Icons.person), // You can use any icon you prefer
                        ),
                        const SizedBox(width: 10.0),
                        Column(
                          children: [
                            Text(
                              data['user2'],
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DmMessageScreen(
                          groupId: GroupId,
                          user: data['user1'],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.all(8.0),
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          child: Icon(
                              Icons.person), // You can use any icon you prefer
                        ),
                        const SizedBox(width: 10.0),
                        Column(
                          children: [
                            Text(data['user2']),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }
            }).toList(),
          );
        },
      ),
    );
  }
}
