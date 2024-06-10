import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';
import '../data/models/library_model.dart';
import '../pages/library/components/count_page_read.dart';

class StatusCardLendo extends StatefulWidget {

   final int id;
   final String nome;
   final bool ativo;
   final List<LibraryModel> livros;


  const StatusCardLendo({
    super.key,
    required this.id,
    required this.nome,
    required this.ativo,
    required this.livros
  });

  @override
  State<StatusCardLendo> createState() => _StatusCardLendo();
}

class _StatusCardLendo extends State<StatusCardLendo> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Quero Ler",
            style: GoogleFonts.sora(
                color: gray,
                fontSize: 14
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              margin: EdgeInsets.only(top: 6),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: pastelYellow2,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                children: widget.livros.map((livro) => _bookCard(livro)).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _bookCard(LibraryModel livro) {
    return  Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.network(
              livro.img
          ),
          Container(
            child: Column(
              children: [
                Text(
                  livro.nome,
                  style: GoogleFonts.sora(
                      fontSize: 16,
                      color: black
                  ),
                ),
                Text(
                  livro.autor,
                  style: GoogleFonts.sora(
                    fontSize: 12,
                    color: black,
                  ),
                ),

                Container(
                  child: Column(
                    children: [
                      Text(
                        'Páginas: ${livro.paginaAtual}/${livro.paginaTotal}',
                        style: GoogleFonts.sora(
                            color: gray,
                            fontSize: 8
                        ),
                      ),
                      Container(
                        child: Row(

                        ),
                      )
                    ],
                  ),
                ),

                SizedBox(
                  width: 120,
                  height: 34,
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => const CountPageRead(),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: pastelYellow2
                    ),
                    child: Text(
                      "Iniciar Leitura",
                      style: GoogleFonts.sora(
                          color: black,
                          fontSize: 16
                      ),
                    ),
                  ),
                )
              ],
            ),
          )

        ],
      ),
    );
  }
}
