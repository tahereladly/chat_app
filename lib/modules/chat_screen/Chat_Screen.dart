import 'package:chat_app/components/Custom_Chat_Bubble.dart';
import 'package:chat_app/components/Constant.dart';
import 'package:chat_app/components/Custom_AppBar.dart';
import 'package:chat_app/components/Custom_TextField.dart';
import 'package:chat_app/models/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({Key? key}) : super(key: key);
  static String id = 'Chat Screen';

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessages);

  var messageController = TextEditingController();
  var scrollController =  ScrollController();


  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
      stream:messages.orderBy(kCreateAt,descending: true).snapshots() ,
      builder: (context,snapshot){
        if(snapshot.hasData){
         List<Message> messageList=[];
         for(int i =0;i<snapshot.data!.docs.length;i++){
           messageList.add(Message.fromJson(snapshot.data!.docs[i]));
         }
        return Scaffold(
            backgroundColor: Colors.white,
            appBar: CustomAppBar(
              background: kBackGroundColor,
              title: 'Chat',
              logo: KLogo,
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    reverse: true,
                    controller: scrollController,
                    itemBuilder: (context, index) {
                      return  messageList[index].id ==email ?  ChatBubble(message: messageList[index]) : ChatBubbleForFriends(message: messageList[index]);
                    },
                    itemCount: messageList.length,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextField(
                    hintText: 'send message',
                    style: const TextStyle(color: Colors.grey),
                    suffix: IconButton(
                      icon: const Icon(
                        Icons.send,
                      ),
                      onPressed: () {},
                    ),
                    controller: messageController,
                    onSubmitted: (data) {
                      messages.add({
                        kMessage: data,
                        kCreateAt:DateTime.now(),
                        'id':email,
                      });
                      messageController.clear();
                      scrollController.animateTo(
                        0,
                        curve: Curves.easeIn,
                        duration: const Duration(milliseconds: 500),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }else{
          return  const CircularProgressIndicator();

        }
      },
    );
  }
}
