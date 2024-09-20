import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CarDashBoardWebView extends StatefulWidget {
  const CarDashBoardWebView({
    super.key,
    required this.webUrl,

    ///required this.type,
  });

  final String webUrl;

  ///final String type;

  @override
  State<CarDashBoardWebView> createState() => _CarDashBoardWebViewState();
}

class _CarDashBoardWebViewState extends State<CarDashBoardWebView> {
  late final WebViewController _controller;

  initializeWebView() async {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
        ),
      )
      ..loadRequest(Uri.parse(widget.webUrl));
  }

  @override
  void initState() {
    super.initState();
    initializeWebView();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
            height: MediaQuery.of(context).size.height - 150,
            child: WebViewWidget(
              controller: _controller,
            )),
      ],
    ));
  }
}
