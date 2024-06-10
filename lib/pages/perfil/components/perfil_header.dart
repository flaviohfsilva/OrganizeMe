import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:organizeme/constants/colors.dart';

class PerfilHeader extends StatelessWidget {
  const PerfilHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: blue,
      width: double.maxFinite,
      height: 200,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 20, bottom: 20),
      child: Container(
        child: Text(
          "Perfil",
          style: GoogleFonts.sora(
            color: black,
            fontSize: 28
          ),
        ),
      ),

    );
  }
}
