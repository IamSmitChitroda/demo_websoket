import 'dart:convert';

import 'package:demo_websoket/modal/websocket_modal.dart';
import 'package:logger/logger.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketService {
  final String url;
  late WebSocketChannel _channel;
  Function(WebSocketModal)? onDataReceived;

  WebSocketService({required this.url, this.onDataReceived}) {
    _channel = IOWebSocketChannel.connect(url);
    _listenToStream();
  }

  void _listenToStream() {
    _channel.stream.listen(
      (event) {
        if (onDataReceived != null) {
          onDataReceived!(WebSocketModal.fromJson(jsonDecode(event)));
        }
      },
      onError: (error) => Logger().e("WebSocket Error: $error"),
      onDone: () => Logger().i("WebSocket Connection Closed"),
    );
  }

  void dispose() {
    _channel.sink.close();
  }
}
