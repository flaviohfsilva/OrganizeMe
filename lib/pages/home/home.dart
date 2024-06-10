import 'package:flutter/material.dart';
import 'package:organizeme/pages/home/components/body_home.dart';
import 'package:organizeme/widgets/button_new_task.dart';

import '../../constants/colors.dart';
import '../../widgets/bottom_navigation.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: offWhite,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: BodyHome(),
      bottomNavigationBar: const BottomNavegation(),
    );
  }
}