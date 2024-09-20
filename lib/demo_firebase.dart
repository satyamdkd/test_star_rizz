import 'package:demo_firebase/const/constants.dart';
import 'package:demo_firebase/ui/home/home.dart';
import 'package:flutter/material.dart';

class DemoFirebase extends StatefulWidget {
  const DemoFirebase({super.key});

  @override
  State<DemoFirebase> createState() => _DemoFirebaseState();
}

class _DemoFirebaseState extends State<DemoFirebase> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Constants.one == "HOME"
            ? const Home()
            : const Center(child: Text("DEMO")),
      ),
    );
  }
}
