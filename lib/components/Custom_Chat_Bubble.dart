// ignore: file_names
// ignore: file_names
// ignore: file_names
import 'package:chat_app/components/Constant.dart';
import 'package:chat_app/models/message_model.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
  super.key, required this.message,
  });
final  Message message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 18,horizontal: 16,
        ),
        margin: const EdgeInsets.only(
          top: 8,bottom: 8,left: 14,right: 8,
        ),
        decoration: const BoxDecoration(
          color: kBackGroundColor,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(20),
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),

          ),
        ),
        child:  Text(
          message.userMessage,style: const TextStyle(
          color: Colors.white,
        ),
        ),
      ),
    );
  }
}

class ChatBubbleForFriends extends StatelessWidget {
  const ChatBubbleForFriends({
  super.key, required this.message,
  });
  final  Message message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 18,horizontal: 16,
        ),
        margin: const EdgeInsets.only(
          top: 8,bottom: 8,left: 14,right: 8,
        ),
        decoration: const BoxDecoration(
          color: Color(0xff006D84),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),

          ),
        ),
        child:  Text(
          message.userMessage,style: const TextStyle(
          color: Colors.white,
        ),
        ),
      ),
    );
  }
}
