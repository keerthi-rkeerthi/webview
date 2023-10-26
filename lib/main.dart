import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyHomePage(),
  ));
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final WebViewController _controller = WebViewController()
    ..setNavigationDelegate(NavigationDelegate(
      onProgress: (int progress) {},
      onWebResourceError: (error) {},
      onNavigationRequest: (request) {
        if (request.url.startsWith('www.google.com')) {
          return NavigationDecision.prevent;
        }
        return NavigationDecision.navigate;
      },
    ))
    ..loadRequest(Uri.parse("https://www.w3schools.com/"));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter webview'),
        backgroundColor: Color(0xFF04AA6D),
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}
