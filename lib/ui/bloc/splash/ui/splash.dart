import 'dart:io';
import 'package:demo_firebase/ui/bloc/overlay_ui/view_doc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_filex/open_filex.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:url_launcher/url_launcher.dart';

class MyWebView extends StatefulWidget {
  const MyWebView({super.key});

  @override
  State<MyWebView> createState() => _MyWebViewState();
}

class _MyWebViewState extends State<MyWebView> {
  WebViewController? _controller;

  bool isLoaded = false;

  load() {
    if (kDebugMode) {
      print(_controller);
    }

    late final PlatformWebViewControllerCreationParams params;

    params = const PlatformWebViewControllerCreationParams();

    final WebViewController controller =
        WebViewController.fromPlatformCreationParams(params);


    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            debugPrint(
                'IS LOADED -> $isLoaded  WebView is loading (progress : $progress%)');
            if (progress == 100) {
              isLoaded = true;
            } else {
              isLoaded = false;
            }
          },
          onPageStarted: (String url) {
            debugPrint('Page started loading: $url');
          },
          onPageFinished: (String url) {
            debugPrint('Page finished loading: $url');
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint('''
                       Page resource error:
                       code: ${error.errorCode}
                       description: ${error.description}
                       errorType: ${error.errorType}
                       isForMainFrame: ${error.isForMainFrame}
                       ''');
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              debugPrint('blocking navigation to ${request.url}');
              return NavigationDecision.prevent;
            }
            debugPrint('allowing navigation to ${request.url}');
            return NavigationDecision.navigate;
          },
          onUrlChange: (UrlChange change) {
            debugPrint('url change to ${change.url}');
          },
        ),
      )
      ..loadRequest(Uri.parse(
          'https://snaptask.s3.ap-south-1.amazonaws.com/doc_10/1723102482_Group%2076075.png'));

    _controller ??= controller;
    setState(() {});
  }

  File? file;
  FilePickerResult? result;

  pickFile() async {
    result = await FilePicker.platform.pickFiles();
    if (result != null) {
      file = File(result!.files.single.path!);
      setState(() {});
      return file;
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: InkWell(
        onTap: () {
          pickFile();
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.green, borderRadius: BorderRadius.circular(1000)),
          child: Text(
            "ADD",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontWeight: FontWeight.w600, color: Colors.white),
          ),
        ),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              file?.path != null ? result!.files.single.name : "",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(width: 20),
            InkWell(
              onTap: () async {
                if (!await launchUrl(Uri.parse(
                    'https://snaptask.s3.ap-south-1.amazonaws.com/pan_doc/1723112145_Screenshot%202024-05-29%20at%2012.28.18%E2%80%AFPM.pdf'))) {}

                // Navigator.of(context).push(ViewDoc());
                // OpenFilex.open(file!.path);
              },
              child: Text(
                "VIEW",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w900,
                    color: Colors.blueAccent,
                    fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyController extends GetxController {
  var isLoaded = false.obs;

  toggle() {
    isLoaded.value = true;
  }
}
