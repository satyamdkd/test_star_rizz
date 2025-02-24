import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with WidgetsBindingObserver {
  AppLifecycleState? state;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState appLifecycleState) {
    state = appLifecycleState;
    super.didChangeAppLifecycleState(state!);
    if (kDebugMode) {
      print(state);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: state == AppLifecycleState.inactive
            ? Container(
                color: Colors.black,
              )
            : const Text("Foreground"),
      ),
    );
  }
}
