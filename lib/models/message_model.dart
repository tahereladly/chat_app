import 'package:chat_app/components/Constant.dart';

class Message {
  Message(this.userMessage, this.id);

  final String userMessage;
  final String id;

  factory Message.fromJson(jsonData) {
    return Message(jsonData[kMessage],jsonData['id']);
  }
}
