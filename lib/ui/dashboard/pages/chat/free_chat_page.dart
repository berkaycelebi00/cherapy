import 'dart:async';
import 'dart:convert';

import 'package:bot_toast/bot_toast.dart';
import 'package:cheraphy/constants/enum.dart';
import 'package:cheraphy/constants/routes.dart';
import 'package:cheraphy/services/socket-service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter/services.dart' show rootBundle;

class FreeChatPage extends StatefulWidget {
  const FreeChatPage({Key? key, required this.userType}) : super(key: key);

  final ChatUserType userType;

  @override
  _FreeChatPageState createState() => _FreeChatPageState();
}

class _FreeChatPageState extends State<FreeChatPage> {
  List<types.Message> _messages = [];
  late final _user;
  late SocketService service;
  late ChatUserType userType;
  late StreamSubscription subscription;
  late StreamSubscription quitListener;

  @override
  void initState() {
    super.initState();
    service = SocketService(userType: widget.userType);
    subscription = service.messageController.stream.listen((event) {
      setState(() {
        print("oldu muu?");
      });
    });
    quitListener = service.quitMessageController.stream.listen((event) {
      if (event == true) {
        BotToast.showText(text: "User disconnected");
        service.disconnect();
        Navigator.popAndPushNamed(context, dashboardPage);
      }
    });
    _user = types.User(id: service.socket.id ?? "no");
  }

  @override
  void dispose() {
    subscription.cancel();
    quitListener.cancel();
    super.dispose();
  }

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: '06c33e8b-e835-4736-80f4-63f44b66666c',
      text: message.text,
    );
    service.sendMessage(message.text);
    _addMessage(textMessage);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Quit?"),
                content: Text("Are you sure wanted to left the chat"),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        service.disconnectChat();
                        Navigator.popAndPushNamed(context, dashboardPage);
                      },
                      child: Text("Yes")),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("No"))
                ],
              );
            });
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("FreeChat"),
        ),
        body: Chat(
          messages: service.messagesList
              .map((e) => types.Message.fromJson(e as Map<String, dynamic>))
              .toList()
              .reversed
              .toList(),
          onSendPressed: _handleSendPressed,
          user: _user,
        ),
      ),
    );
  }
}
