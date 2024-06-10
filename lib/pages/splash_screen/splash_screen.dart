
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:organizeme/constants/colors.dart';
import 'package:organizeme/pages/advertising/advertising.dart';
import 'package:organizeme/pages/introduction/first_introduction.dart';

import '../home/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    _goHome();
  }

  _goHome() async {
    await Future.delayed(const Duration(seconds: 5), () {});
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const Presentation()
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: offWhite
      ),
      child: Image.asset(
        "assets/images/organizeme-logo.png",
        width: 900,
      ),
    );
  }
}
