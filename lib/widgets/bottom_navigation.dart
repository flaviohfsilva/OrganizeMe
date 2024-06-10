import 'package:flutter/material.dart';
import 'package:organizeme/constants/colors.dart';
import 'package:organizeme/pages/habits/habits.dart';
import 'package:organizeme/pages/library/components/count_page_read.dart';
import 'package:organizeme/pages/library/library.dart';
import 'package:organizeme/widgets/button_new_task.dart';

import '../pages/home/components/body_home.dart';
import '../pages/home/home.dart';
import '../pages/perfil/perfil.dart';


class BottomNavegation extends StatefulWidget {
  const BottomNavegation({super.key});

  @override
  State<BottomNavegation> createState() => _bottomNavegationState();
}

class _bottomNavegationState extends State<BottomNavegation> {

  int paginaAtual = 0;
  late PageController pc;

  @override
  void initState() {
    super.initState();
    pc = PageController(initialPage: paginaAtual);
  }

  setPaginaAtual(pagina) {
    setState(() {
      paginaAtual = pagina;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: offWhite,
      body: PageView(
        controller: pc,
        children: [ // Aqui onde vamos colocar as telas para a navegação
          BodyHome(),
          Habits(),
          Biblioteca(),
          Perfil()
        ],
        onPageChanged: setPaginaAtual,
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: begeWhite,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: BottomNavigationBar(
            backgroundColor: begeWhite,
            currentIndex: paginaAtual,
            fixedColor: strongBlue,
            unselectedIconTheme: const IconThemeData(color: gray),
            unselectedItemColor: gray,
            unselectedFontSize: 15,

            onTap: (pagina) {
              pc.animateToPage(
                pagina,
                duration: const Duration(milliseconds: 400),
                curve: Curves.ease,
              );
            },

            items: const [
              BottomNavigationBarItem(
                  backgroundColor: begeWhite,
                  icon: Icon(Icons.done_outline_outlined),
                  label: "Rotina"
              ),
              BottomNavigationBarItem(
                  backgroundColor: begeWhite,
                  icon: Icon(Icons.border_color_outlined),
                  label: "Hábitos",
              ),
              BottomNavigationBarItem(
                  backgroundColor: begeWhite,
                  icon: Icon(Icons.book_outlined),
                  label: "Biblioteca"
              ),
              BottomNavigationBarItem(
                  backgroundColor: begeWhite,
                  icon: Icon(Icons.person_outline),
                  label: "Perfil"
              ),
            ],
          ),
        ),
      ),
    );
  }
}