import 'package:cheraphy/constants/enum.dart';
import 'package:cheraphy/constants/routes.dart';
import 'package:cheraphy/view-models/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, professionalPageRoute);
            },
            child: const Text("Chat with a professional"),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, chatWaitingRoomPageRoute,
                  arguments: ChatUserType.narrator);
            },
            child: const Text("Start a chat with random listener(Free)"),
          ),
          if (Provider.of<AuthViewModel>(context, listen: false)
              .user!
              .isVolunteer!)
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, chatWaitingRoomPageRoute,
                        arguments: ChatUserType.listener);
                  },
                  child: const Text("Start a chat as a listener")),
            )
        ],
      ),
    );
  }
}
