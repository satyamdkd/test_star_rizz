import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class TestOne extends StatefulWidget {
  const TestOne({super.key});

  @override
  State<TestOne> createState() => _TestOneState();
}

class _TestOneState extends State<TestOne> {
  final translator = GoogleTranslator();

  String one = "THIS IS A SAMPLE TEXT.";

  translateText() async {
    if (kDebugMode) {
      var o = await translator.translate(one, from: 'en', to: 'ar');
      one = o.text;
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    translateText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          one,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
