import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:organizeme/constants/colors.dart';

class HabitsHeader extends StatelessWidget {
  const HabitsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 200,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 20),
      child: Container(
        padding: EdgeInsets.only(top: 80),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Plano de rotina",
              style: GoogleFonts.sora(
                  color: strongBlue,
                  fontWeight: FontWeight.w600,
                  fontSize: 28
              ),
            ),
            Text(
              "Nós preparamos uma rotina para te ajudar\nna organização do seu dia.",
              style: GoogleFonts.sora(
                  color: black,
                  fontSize: 12
              ),
            ),
          ],
        ),
      ),

    );
  }
}
