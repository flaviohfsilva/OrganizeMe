import 'package:flutter/material.dart';
import 'package:organizeme/constants/colors.dart';

import 'components/body_perfil.dart';

class Perfil extends StatelessWidget {
  const Perfil({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: offWhite,
      body: BodyPerfil(),
    );
  }
}
