import 'dart:async';

import 'package:cheraphy/constants/enum.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {
  late IO.Socket socket;
  static final SocketService _socketService = SocketService._internal();

  StreamController<int> controller = StreamController<int>.broadcast();
  StreamController<bool> matchController = StreamController<bool>.broadcast();
  StreamController<Map<String, dynamic>> messageController =
      StreamController<Map<String, dynamic>>.broadcast();
  StreamController<bool> quitMessageController =
      StreamController<bool>.broadcast();

  Sink<int> get setListenerCount => controller.sink;
  Sink<int> get setNarratorCount => controller.sink;
  Sink<bool> get setMatchState => matchController.sink;
  Sink<Map<String, dynamic>> get setMessageState => messageController.sink;

  //This is where your "number" go out
  Stream<int> get getListenerCount => controller.stream;
  Stream<int> get getNarratorCount => controller.stream;
  Stream<bool> get getMatchState => matchController.stream;
  Stream<Map<String, dynamic>> get getMessagesState => messageController.stream;

  late ChatUserType userType;
  String? messageTarget;
  List<Map<String, dynamic>> messagesList = [];

  factory SocketService({required ChatUserType userType}) {
    _socketService.userType = userType;
    return _socketService;
  }
  SocketService._internal();

  void connectToServer() {
    try {
      // Configure socket transports must be sepecified
      socket = IO.io(
          'http://localhost:3001',
          IO.OptionBuilder()
              .setTransports(['websocket']) // for Flutter or Dart VM
              .build());

      // Connect to websocket
      if (socket.id == null) socket.connect();

      // Handle socket events
      socket.on('connect', (_) => print('connect: ${socket.id}'));
      socket.on('disconnect', (_) => disconnectHandler());
      socket.on('fromServer', (_) => print(_));
      socket.on('listener-count', (data) => handleListenerCount(data));
      socket.on('narrator-count', (data) => handleNarratorCount(data));
      socket.on('room-connect', (data) => handleMatchState(data));
      socket.on('handle-message', (data) => handleMessage(data));
      socket.on("disconnect-chat-handle", (data) => disconnectHandle(data));
    } catch (e) {
      print(e.toString());
    }
  }

  void disconnect() {
    socket.emit("destroy-connection", socket.id);
  }

  void joinAsListener() {
    if (userType != ChatUserType.narrator) socket.emit("join-as-listener");
  }

  void joinAsNarrator() {
    if (userType != ChatUserType.listener) socket.emit("join-as-narrator");
  }

  void handleListenerCount(int response) {
    print("total $response listener");
    setListenerCount.add(response);
  }

  void handleNarratorCount(int response) {
    setNarratorCount.add(response);
  }

  handleMatchState(data) {
    messageTarget = data;
    setMatchState.add(true);
  }

  disconnectHandler() {
    messagesList.clear();
    socket.dispose();
  }

  disconnectChat() {
    messagesList.clear();
    socket.emit("disconnect-chat", messageTarget);
    disconnect();
  }

  void sendMessage(String message) {
    socket.emit("send-message",
        {"from": socket.id, "to": messageTarget, "message": message});
    messagesList.add(
      {
        "author": {
          "firstName": "John",
          "id": socket.id,
          "imageUrl": "https://avatars.githubusercontent.com/u/14123304?v=4"
        },
        "createdAt": DateTime.now().millisecond,
        "id": "e7a673e9-86eb-4572-936f-2882b0183cdc",
        "status": "seen",
        "text": message,
        "type": "text"
      },
    );
    setMessageState.add(
      {
        "author": {
          "firstName": "John",
          "id": socket.id,
          "imageUrl": "https://avatars.githubusercontent.com/u/14123304?v=4"
        },
        "createdAt": DateTime.now().millisecond,
        "id": "e7a673e9-86eb-4572-936f-2882b0183cdc",
        "status": "seen",
        "text": message,
        "type": "text"
      },
    );
  }

  handleMessage(data) {
    messagesList.add(
      {
        "author": {
          "firstName": "John",
          "id": data["from"],
          "imageUrl": "https://avatars.githubusercontent.com/u/14123304?v=4"
        },
        "createdAt": DateTime.now().millisecond,
        "id": "e7a673e9-86eb-4572-936f-2882b0183cdc",
        "status": "seen",
        "text": data["message"],
        "type": "text"
      },
    );
    setMessageState.add(
      {
        "author": {
          "firstName": "John",
          "id": data["from"],
          "imageUrl": "https://avatars.githubusercontent.com/u/14123304?v=4"
        },
        "createdAt": DateTime.now().microsecond,
        "id": "e7a673e9-86eb-4572-936f-2882b0183cdc",
        "status": "seen",
        "text": data["message"],
        "type": "text"
      },
    );
  }

  disconnectHandle(data) {
    quitMessageController.add(true);
    messagesList.clear();
    messageTarget = null;
    print("target disconnected");
  }
}
