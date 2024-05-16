import 'package:flutter/material.dart';
import 'package:organizeme/constants/colors.dart';


class BottomNavegation extends StatefulWidget {
  const BottomNavegation({Key? key}) : super(key: key);

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
      body: PageView(
        controller: pc,
        children: [ // Aqui onde vamos colocar as telas para a navegação
        ],
        onPageChanged: setPaginaAtual,
      ),
      bottomNavigationBar: BottomNavigationBar(

        currentIndex: paginaAtual,
        fixedColor: strongBlue,
        unselectedIconTheme: IconThemeData(color: gray),
        unselectedItemColor: gray,
        unselectedFontSize: 15,

        onTap: (pagina) {
          pc.animateToPage(
            pagina,
            duration: Duration(milliseconds: 400),
            curve: Curves.ease,
          );
        },

        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.done_outline_outlined),
              label: "Home"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.border_color_outlined),
              label: "Hábitos"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: "Biblioteca"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: "Perfil"
          ),
        ],
      ),
    );
  }
}