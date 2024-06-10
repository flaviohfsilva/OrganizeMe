import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:organizeme/constants/colors.dart';
import 'package:organizeme/pages/habits/components/routine_habits.dart';

import '../../../data/models/habits_model.dart';

class HabitsSelectade extends StatefulWidget {

  final HabitsModel habitos;

  const HabitsSelectade({super.key, required this.habitos});

  @override
  State<HabitsSelectade> createState() => _HabitsSelectadeState();
}

class _HabitsSelectadeState extends State<HabitsSelectade> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(
            16.0), // Afasta o Container principal dos cantos da tela
        child: Container(
          decoration: BoxDecoration(
            color: iceWhite,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 1.0),
                        Center(
                          child: Image.asset(
                            'assets/images/${widget.habitos.img}',
                            width: 400.0,
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Text(
                          widget.habitos.titulo,
                          style: TextStyle(
                            color: strongBlue,
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          widget.habitos.descricao,
                          style: GoogleFonts.sora(
                            fontSize: 16.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'Aperte no botão e adicione na sua rotina',
                          style: GoogleFonts.sora(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(height: 20.0),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    bottom: 20.0), // Espaço entre o botão e a borda inferior
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RoutineHabits(tarefas: widget.habitos.tarefas, habitos: widget.habitos,),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10), // Tamanho reduzido
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: BorderSide(
                          color: strongGreen
                        ),
                      ),
                      backgroundColor: green,
                    ),
                    child: Text(
                      'Adicionar nova rotina',
                      style: GoogleFonts.sora(
                        color: black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0, // Fonte reduzida
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
