import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';
import '../pages/library/library.dart';

class CardLido extends StatefulWidget {
  const CardLido({super.key});

  @override
  State<CardLido> createState() => _CardLido();
}

class _CardLido extends State<CardLido> {
  @override
  Widget build(BuildContext context) {
    return   GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Biblioteca()),
        );
      },
      child: Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Lidos",
              style: GoogleFonts.sora(
                  color: gray,
                  fontSize: 14
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 6),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: lightBlue3,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 44,
                          height: 49,
                          margin: EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  color: black,
                                  width: 1
                              )
                          ),
                          child: Icon(Icons.add),
                        ),
                        Text(
                          "Adicione aqui os livros que você\nestá lendo.",
                          style: GoogleFonts.sora(
                              fontSize: 14,
                              color: black
                          ),
                        )
                      ],
                    ),
                  )

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
