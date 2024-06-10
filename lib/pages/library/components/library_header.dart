import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/colors.dart';

class LibraryHeader extends StatelessWidget {
  const LibraryHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: blue,
      padding: EdgeInsets.symmetric(vertical: 40.0),
      child: Column(
        children: [
          Text(
            'Viaje pelas páginas e\nexplore novos mundos',
            textAlign: TextAlign.start,
            style: GoogleFonts.sora(
              fontSize: 20.0,
              color: white,
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.0),
            child: Container(
              margin: EdgeInsets.only(top: 20.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Busque por autor, título ou ISBN',
                  hintStyle: GoogleFonts.sora(color: strongBlue, fontSize: 12),
                  suffixIcon: Icon(
                    Icons.search,
                    color: strongBlue,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: white,
                ),
                style: TextStyle(
                  color: strongBlue, // Cor do texto
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
