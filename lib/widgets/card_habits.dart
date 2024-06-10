import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:organizeme/pages/habits/components/habits_selectade.dart';

import '../constants/colors.dart';
import '../data/models/habits_model.dart';
import '../data/models/tarefas_model.dart';

class CardHabits extends StatefulWidget {
  final HabitsModel habitos;

  const CardHabits({super.key, required this.habitos});

  @override
  State<CardHabits> createState() => _CardHabitsState();
}

class _CardHabitsState extends State<CardHabits> {
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HabitsSelectade(habitos: widget.habitos),
          ),
        );
      },
      child: Container(
        alignment: Alignment.centerLeft,
        width: double.infinity,
        height: 94,
        decoration: BoxDecoration(
          color: colorFromString(widget.habitos.corHabito),
          borderRadius: BorderRadius.circular(30)
        ),
        padding: EdgeInsets.all(20),
        child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.habitos.nome,
                    style: GoogleFonts.sora(
                      color: strongBlue,
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                    ),
                  ),
                  Container(
                    width: 180,
                    child: Text(
                        widget.habitos.subTitulo,
                      style: GoogleFonts.sora(
                        color: black,
                        fontSize: 10
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Image.asset(
                "assets/images/${widget.habitos.thumbImg}",
              width: 110,
            )
          ],
        ),
      
      ),
    );
  }

  Color? colorFromString(String? colorString) {
    if (colorString == null || colorString.isEmpty) {
      return null;
    }
    final buffer = StringBuffer();
    if (colorString.length == 6 || colorString.length == 7) buffer.write('ff');
    buffer.write(colorString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
