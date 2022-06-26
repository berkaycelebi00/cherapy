import 'dart:async';

import 'package:cheraphy/constants/enum.dart';
import 'package:cheraphy/constants/routes.dart';
import 'package:cheraphy/helpers/random_name_generator.dart';
import 'package:cheraphy/services/socket-service.dart';
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
  late SocketService service;
  RandomNameGenerator rng = RandomNameGenerator();
  late StreamSubscription subscription;
  int totalListener = 0;
  late StreamController matchStreamController;

  @override
  void initState() {
    super.initState();
    service = SocketService(userType: widget.userType);
    service.connectToServer();
    joinAsRole();
    matchStreamController = service.matchController;
    subscription = matchStreamController.stream.listen((event) {
      if (event == true) {
        Navigator.popAndPushNamed(context, freeChatPageRoute,
            arguments: widget.userType);
      }
    });
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                service.disconnect();
                Navigator.pop(context);
              },
              icon: Icon(Icons.stop))
        ],
        title: Text(widget.userType == ChatUserType.listener
            ? "Waiting as Listener"
            : "Waiting as Narrator"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: Text(
                rng.createRandomName(),
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ),
          Expanded(
              child: StreamBuilder<Object>(
                  stream: widget.userType == ChatUserType.listener
                      ? service.getListenerCount
                      : service.getNarratorCount,
                  builder: (context, snapshot) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(service.socket.id ?? ""),
                        Text(snapshot.hasData
                            ? "${snapshot.data.toString()} ${widget.userType == ChatUserType.listener ? 'listeners' : 'narrators'} are waiting on queue..."
                            : 'No data'),
                      ],
                    );
                  })),
          const Expanded(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        ],
      ),
    );
  }

  void joinAsRole() {
    if (widget.userType == ChatUserType.listener) {
      service.joinAsListener();
    } else {
      service.joinAsNarrator();
    }
  }
}
