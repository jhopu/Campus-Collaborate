import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'chat_splash_screen.dart';
import 'group_message_screen.dart';

class GroupChatScreen extends StatefulWidget {
  @override
  _GroupChatScreen createState() => _GroupChatScreen();
}

class _GroupChatScreen extends State<GroupChatScreen> {
  TextEditingController textController1 = TextEditingController();
  final Stream<QuerySnapshot> _chatStream =
      FirebaseFirestore.instance.collection('GroupConversations').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: Icon(
          Icons.graphic_eq,
          color: Color.fromRGBO(224, 140, 56, 1),
        ),
        backgroundColor: Color.fromRGBO(85, 85, 85, 1),
        title: Center(
          child: Container(
            width: 250, // Adjust the width as needed
            decoration: BoxDecoration(
              color: Color.fromRGBO(102, 102, 102, 1),
              borderRadius:
                  BorderRadius.circular(30.0), // Set the desired radius
            ),
            child: TextField(
              controller: textController1,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                hintText: 'Search...',
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none, // Remove the default border
              ),
              style: TextStyle(color: Colors.black), // Set the text color
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: Color.fromRGBO(224, 140, 56, 1),
            ),
            onPressed: () {
              // Handle the action when the three dots icon is pressed
              print('Three dots icon pressed');
            },
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _chatStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
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
              String chatname = data['chatName'];
              if (data['members'].includes(userId) &&
                  chatname.contains(textController1.text)) {
                isContain = true;
              }
              return isContain;
            }).map((DocumentSnapshot document) {
              String GroupId = document.id;
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GroupMessageScreen(
                        groupId: GroupId,
                        team: data['chatName'],
                      ),
                    ),
                  );
                },
                child: Container(
                  width: 10,
                  height: 60,
                  margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.fromLTRB(5, 5, 20, 20),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(85, 85, 85, 1),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        child: Icon(Icons
                            .group_sharp), // You can use any icon you prefer
                      ),
                      SizedBox(width: 10.0),
                      Column(
                        children: [
                          Text(
                            data['chatName'],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
