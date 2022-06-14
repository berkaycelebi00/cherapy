import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {
  late IO.Socket socket;

  SocketService() {
    connectToServer();
  }

  void connectToServer() {
    try {
      // Configure socket transports must be sepecified
      socket = IO.io(
          'http://localhost:3001',
          IO.OptionBuilder()
              .setTransports(['websocket']) // for Flutter or Dart VM
              .setExtraHeaders({'foo': 'bar'}) // optional
              .build());

      // Connect to websocket
      socket.connect();

      // Handle socket events
      socket.on('connect', (_) => print('connect: ${socket.id}'));
      socket.on('location', handleLocationListen);
      socket.on('typing', handleTyping);
      socket.on('message', handleMessage);
      socket.on('disconnect', (_) => print('disconnect'));
      socket.on('fromServer', (_) => print(_));
    } catch (e) {
      print(e.toString());
    }
  }

  // Send Location to Server
  sendLocation(Map<String, dynamic> data) {
    socket.emit("location", data);
  }

  // Listen to Location updates of connected usersfrom server
  handleLocationListen(data) async {
    print(data);
  }

  // Send update of user's typing status
  sendTyping(typing) {
    socket.emit("typing", {
      "id": socket.id,
      "typing": typing,
    });
  }

  // Listen to update of typing status from connected users
  void handleTyping(data) {
    print(data);
  }

  // Send a Message to the server
  sendMessage(message) {
    socket.emit(
      "message",
      {
        "id": socket.id,
        "message": message, // Message to be sent
        "type": "narrator",
        "timestamp": DateTime.now().millisecondsSinceEpoch,
      },
    );
  }

  joinAsListener() {
    socket.emit("join-as-listener", socket.id);
  }

  // Listen to all message events from connected users
  void handleMessage(data) {
    print(data);
  }
}
