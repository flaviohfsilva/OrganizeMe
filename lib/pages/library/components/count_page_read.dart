import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:organizeme/widgets/input_field.dart';

import '../../../constants/colors.dart';

class CountPageRead extends StatefulWidget {
  const CountPageRead({super.key});

  @override
  State<CountPageRead> createState() => _CountPageReadState();
}

class _CountPageReadState extends State<CountPageRead> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              color: blue,
              width: double.maxFinite,
              height: 200,
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 20, bottom: 10),
              child: Text(
                "Atualizar Leitura",
                style: GoogleFonts.sora(
                  color: white,
                  fontSize: 28
                ),
              ),
            ),
            Container(
              height: 480, // Altura extra para exibir o PerfilMenu sem corte
            ),
          ],
        ),
        Positioned(
          top: 180, // Ajuste este valor conforme necessário para o efeito desejado
          left: 0,
          right: 0,
          child: Container(
            decoration: BoxDecoration(
                color: offWhite,
                borderRadius: BorderRadius.circular(30)
            ),
            padding: EdgeInsets.only(left: 20, right: 20, top: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Qual página você está ?",
                  style: GoogleFonts.sora(
                    color: black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total de páginas: ",
                        style: GoogleFonts.sora(
                            color: black,
                            fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 16,),
                      Text(
                        "Página Anterior: ",
                        style: GoogleFonts.sora(
                          color: black,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: [

                      Container(
                        width: 155,
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top: 100),
                        child: TextFormField(
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: lightBlue3, width: 2.0),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: strongBlue, width: 2.0),
                            ),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: lightBlue3, width: 2.0),
                            ),
                            hintText: 'Página de livros',
                            hintStyle: GoogleFonts.sora(color: gray, fontWeight: FontWeight.bold,),

                          ),
                          style: GoogleFonts.sora(color: black, fontWeight: FontWeight.bold),
                          cursorColor: strongBlue,
                        ),
                      ),

                      SizedBox(height: 180,),

                      SizedBox(
                        width: 200,
                        height: 34,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: lightBlue3
                          ),
                          child: Text(
                            "Salvar",
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
          ),
        ),
      ],
    );
  }
}
