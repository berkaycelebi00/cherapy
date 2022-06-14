import 'package:cheraphy/constants/enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ChatWaitingRoom extends StatefulWidget {
  const ChatWaitingRoom({Key? key, required this.userType}) : super(key: key);

  final ChatUserType userType;

  @override
  State<ChatWaitingRoom> createState() => _ChatWaitingRoomState();
}

class _ChatWaitingRoomState extends State<ChatWaitingRoom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.userType == ChatUserType.listener
            ? "Waiting as listener"
            : "Waiting as Narrator"),
      ),
    );
  }
}
