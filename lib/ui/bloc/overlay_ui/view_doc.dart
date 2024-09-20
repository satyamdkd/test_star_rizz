import 'package:demo_firebase/ui/bloc/splash/ui/splash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ViewDoc extends ModalRoute {
  @override
  Duration get transitionDuration => const Duration(milliseconds: 500);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => true;

  @override
  Color get barrierColor => Colors.black.withOpacity(0.2);

  @override
  String? get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Widget buildPage(
    BuildContext context,
    Animation animation,
    Animation secondaryAnimation,
  ) {
    return Material(
      type: MaterialType.transparency,
      child: SafeArea(
        child: _buildOverlayContent(context),
      ),
    );
  }

  WebViewController? _controller;
  final myController = Get.put(MyController());

  bool isLoaded = false;

  initializeWebView(webUrl) async {
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
      ..loadRequest(Uri.parse(webUrl));
  }

  Widget _buildOverlayContent(BuildContext context) {
    initializeWebView(
        'https://stackoverflow.com/questions/73837911/frameevents31583-updateacquirefence-did-not-find-frame');
    return Obx(
      () => Center(
        child: Container(
          height: MediaQuery.of(context).size.height / 1.85,
          width: MediaQuery.of(context).size.width / 1.06,
          decoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width / 1.16,
                padding: EdgeInsets.all(MediaQuery.of(context).size.width / 50),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft:
                        Radius.circular(MediaQuery.of(context).size.width / 20),
                    bottomRight:
                        Radius.circular(MediaQuery.of(context).size.width / 20),
                    bottomLeft:
                        Radius.circular(MediaQuery.of(context).size.width / 20),
                  ),
                ),
                child: !myController.isLoaded.value
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: Colors.blue,
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(
                            MediaQuery.of(context).size.width / 20),
                        child: WebViewWidget(
                          controller: _controller!,
                        ),
                      ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: InkWell(
                  onTap: () {
                    myController.toggle();
                    if (kDebugMode) {
                      print(myController.isLoaded.value);
                    }

                    /// Navigator.pop(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.width),
                    ),
                    padding:
                        EdgeInsets.all(MediaQuery.of(context).size.width / 100),
                    child: Icon(CupertinoIcons.clear_circled,
                        color: Colors.black,
                        size: MediaQuery.of(context).size.height / 34),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(
      opacity: animation,
      child: ScaleTransition(
        scale: animation,
        child: child,
      ),
    );
  }
}
