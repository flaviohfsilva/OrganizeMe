import 'package:flutter/material.dart';
import 'package:organizeme/constants/colors.dart';

import 'components/body_habits.dart';

class Habits extends StatelessWidget {
  const Habits({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: offWhite,
      body: BodyHabits(),
    );
  }
}
