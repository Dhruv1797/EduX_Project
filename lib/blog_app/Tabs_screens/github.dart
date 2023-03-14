import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class githubScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          'Github',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: WebView(
          initialUrl: "https://github.com",
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
