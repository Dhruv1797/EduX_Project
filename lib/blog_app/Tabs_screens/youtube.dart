import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class youtubeScreen extends StatelessWidget {
  const youtubeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          'Youtube',
          style: TextStyle(color: Colors.black),
        ),
      ),
      // resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: WebView(
          initialUrl: "https://m.youtube.com",
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
