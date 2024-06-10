import 'package:flutter/cupertino.dart';
import 'package:organizeme/pages/perfil/components/perfi_menu.dart';
import 'package:organizeme/pages/perfil/components/perfil_header.dart';

class BodyPerfil extends StatelessWidget {
  const BodyPerfil({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            children: [
              PerfilHeader(),
              Container(
                height: 605, // Não vai cortar o PerfilMenu
              ),
            ],
          ),
          Positioned(
            top: 130,
            left: 0,
            right: 0,
            bottom: 0,
            child: PerfilMenu(),
          ),
        ],
      ),
    );
  }
}
