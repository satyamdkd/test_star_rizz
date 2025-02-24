import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:starrizz/app/modules/authentication/star_user/star_login_in.dart';
import 'package:starrizz/app/modules/firstPage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(2.seconds, () {
      navigatePage();
    });
  }

  navigatePage() {


    Navigator.pushAndRemoveUntil(context,    MaterialPageRoute(
      builder: (context) => const FirstPage(),
    ),  ModalRoute.withName('/first'),);

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      color: Colors.white,
      child: Center(
        child: Image.asset(
          "assets/image/logo.png",
          scale: 4,
        ).animate().scale(),
      ),
    );
  }
}
