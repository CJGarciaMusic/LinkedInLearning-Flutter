import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
final _firestore = FirebaseFirestore.instance;
late User loggedInUser;

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  static const id = 'chat_screen';
  @override
  _ChatScreenState createState() {
    return _ChatScreenState();
  }
}

class _ChatScreenState extends State<ChatScreen> {

  final messageTextController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  late String messageText;


  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = _auth.currentUser!;
      loggedInUser = user;
      print(loggedInUser.email);
    } catch (e) {
      print(e);
    }
  }



  // void getMessages() async {
  //   final messages = await _firestore.collection('messages').get();
  //   for (var message in messages.docs) {
  //     print(message.data());
  //   }
  // }

  void messageStream() async {
    await for (var snapshot in _firestore.collection('messages').snapshots()) {
      for (var message in snapshot.docs) {
        print(message.data());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                messageStream();
                // getMessages();
                // _auth.signOut();
                // Navigator.pop(context);
              }),
        ],
        title: const Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const MessagesStream(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[

                  Expanded(
                    child: TextField(
                      controller: messageTextController,
                      onChanged: (value) {
                        messageText = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                    ),
                    onPressed: () {
                      messageTextController.clear();
                      _firestore.collection('messages').add({
                        'text': messageText,
                        'sender': loggedInUser.email,
                      });
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

class MessagesStream extends StatelessWidget {
  const MessagesStream({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('messages').snapshots(),
      builder: (context, snapshot) {
        List<MessageBubble> messageBubbles = [];
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        final messages = snapshot.data?.docs;
        for (var message in messages!) {
          final messageText = message['text'];
          final messageSender = message['sender'];

          final currentUser = loggedInUser.email;



          final messageWidget = MessageBubble(
            text: messageText,
            sender: messageSender,
            isMe: currentUser == messageSender,
          );
          messageBubbles.add(messageWidget);
        }
        return Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            children: messageBubbles,
          ),
        );
      },
    );
  }
}


class MessageBubble extends StatelessWidget {
  const MessageBubble({Key? key, required this.sender, required this.text, required this.isMe}) : super(key: key);

  final String sender;
  final String text;

  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            sender,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black54
            ),
          ),
          Material(
            elevation: 5,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)),
            color: isMe ? Colors.lightBlueAccent : Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                child: Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
          ),
        ],
      ),
    );
  }
}

