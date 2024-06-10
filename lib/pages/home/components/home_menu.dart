import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:organizeme/constants/colors.dart';
import 'package:organizeme/data/repositories/tarefas_repository.dart';
import 'package:organizeme/pages/home/components/page_new_task.dart';
import 'package:organizeme/stores/tarefas_store.dart';

import '../../../data/http/http_client.dart';
import '../../../widgets/card_abandonei.dart';
import '../../../widgets/card_lendo.dart';
import '../../../widgets/card_lido.dart';
import '../../../widgets/card_quero_ler.dart';

class HomeMenu extends StatefulWidget {
  const HomeMenu({super.key});

  @override
  State<HomeMenu> createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> {


  bool isContainerVisible = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          color: offWhite,
          borderRadius: BorderRadius.circular(30)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 126,
              width: 380,
              margin: EdgeInsets.only(top: 50, bottom: 40),
              padding: const EdgeInsets.only(
                top: 10,
                right: 15,
                left: 15
              ),
              decoration: BoxDecoration(
                color: green,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.only(top: 2, left: 2, right: 2, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Olá! Vamos \n organizar o seu dia?",
                            style: GoogleFonts.sora(
                              textStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            )
                          ),
                        IconButton(
                          onPressed: () {  },
                          icon: new Icon(MdiIcons.closeCircle),
                          color: Colors.white,

                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 32,
                    child: ElevatedButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => const PageTask(),
                          );
                        },
                      style: ElevatedButton.styleFrom(

                      ),
                        child: Text(
                          "Adicionar tarefa",
                          style: GoogleFonts.sora(
                            textStyle: const TextStyle(
                              color: black
                            )
                          ),
                        ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 380,
              padding: EdgeInsets.all(25),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Seus Livros",
                      style: GoogleFonts.sora(
                          color: black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                      ),
                    ),
                    CardLendo(),
                    CardQueroLer(),
                    CardLido(),
                    CardAbandonei()
                
                  ],
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
