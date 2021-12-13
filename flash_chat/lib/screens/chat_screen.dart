import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flash_chat/utilities/messages.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);
  static String id = "chat_screen";
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;
  late User loggedInUser;
  late String messageText;
  final _firestore = FirebaseFirestore.instance;
  var messageController = TextEditingController();


  void getCurrentUser() {
    try {
      final user =  _auth.currentUser;
    if (user != null) {
      loggedInUser = user;
      print(loggedInUser.email);
    }
    }
    catch (e) {
      print(e);
    }
    }

    void messagesStream() async {
      await for(var snapshot in _firestore.collection("messages").snapshots()) {
        for (var message in snapshot.docs) {
          print(message.data());
        }
      }

    }

    
  @override 
  void initState() {
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryGrey,
      appBar: AppBar(
        leading: null,
        backgroundColor: kSecondaryGrey,
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);
              }),
        ],
        title: const Text('💌👫 Flash Chat'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            StreamBuilder<QuerySnapshot>(
            stream: _firestore.collection("messages").snapshots(),
            builder: (context, snapshot) {
              List<Widget> messageWidgets = [];
              if (!snapshot.hasData) {
               return const Center(
                 child: CircularProgressIndicator(
                   backgroundColor: Colors.deepPurple,
                 ),
               );
              }
               
                final messages = snapshot.data!.docs.reversed;
                for (var message in messages) {
                  final messageText = message["text"];
                  final sender = message["sender"];
                  final isUsercurrent = loggedInUser.email == sender;
                  final messageWidget = MessageBubble(messageText: messageText, 
                  sender: sender, 
                  bubbleColor: isUsercurrent ? kPrimaryRed: kSecondaryGrey, 
                  alignment: isUsercurrent? CrossAxisAlignment.end: CrossAxisAlignment.start,
                  topLeft: isUsercurrent? 30.0: 0.0,
                  topRight: isUsercurrent? 0.0: 30.0,);
                  messageWidgets.add(messageWidget);

                }
              return Expanded(
                child: ListView(
                  reverse: true,
                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                children: messageWidgets,
              ),
              );
            }
            ),
            Container(
              
              decoration: kMessageContainerDecoration,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messageController,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      onChanged: (value) {
                       messageText = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      _firestore.collection("messages").add({
                          'text': messageText,
                          'sender': loggedInUser.email,
                        }
                      );
                      messageController.clear();
                    },
                    child: const Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
                      
          ],
        ),
      ),
    );
  }
}