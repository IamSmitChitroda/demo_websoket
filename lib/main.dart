import 'dart:convert';

import 'package:demo_websoket/websocket_modal.dart';
import 'package:demo_websoket/websoket_common.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:web_socket_channel/io.dart';

void main() {
  runApp(
    Myapp(),
  );
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.teal,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WebSocketModal? webSocket;

  void streamListener() {
    WebsocketCommon.instance.channel.stream.listen(
      (event) {
        setState(
          () {
            webSocket = WebSocketModal.fromJson(jsonDecode(event));
          },
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    streamListener();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Web Socket For BitCoin"),
      ),
      body: webSocket != null
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    webSocket!.webSocketE.toString(),
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    webSocket!.p,
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
