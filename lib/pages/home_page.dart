import 'package:demo_websoket/services/web_socket_service.dart';
import 'package:demo_websoket/websocket_modal.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late WebSocketService _webSocketService;
  WebSocketModal? _webSocketData;

  @override
  void initState() {
    super.initState();
    _webSocketService = WebSocketService(
      url: "wss://stream.binance.com:9443/ws/btcusdt@trade",
      onDataReceived: (data) {
        setState(() {
          _webSocketData = data;
        });
      },
    );
  }

  @override
  void dispose() {
    _webSocketService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Web Socket For Bitcoin")),
      body: Center(
        child: _webSocketData != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    _webSocketData!.webSocketE.toString(),
                    style: const TextStyle(fontSize: 30),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    _webSocketData!.p,
                    style: const TextStyle(fontSize: 30),
                  ),
                ],
              )
            : const CircularProgressIndicator(),
      ),
    );
  }
}
