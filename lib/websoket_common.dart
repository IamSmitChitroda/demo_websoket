import 'package:web_socket_channel/io.dart';

class WebsocketCommon {
  WebsocketCommon._();
  static final instance = WebsocketCommon._();

  final IOWebSocketChannel channel = IOWebSocketChannel.connect(
    "wss://stream.binance.com:9443/ws/btcusdt@trade",
  );
}
