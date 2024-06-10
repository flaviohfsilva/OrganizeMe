import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:organizeme/widgets/options_config.dart';

import '../../../constants/colors.dart';

class PerfilMenu extends StatefulWidget {
  const PerfilMenu({super.key});

  @override
  State<PerfilMenu> createState() => _PerfiMenuState();
}

class _PerfiMenuState extends State<PerfilMenu> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: offWhite,
          borderRadius: BorderRadius.circular(30)
        ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20,),
          Text(
            "Configurações",
            style: GoogleFonts.sora(
              fontSize: 16,
              color: black
            ),
          ),
          Container(
            width: 396,
            height: 182,
            margin: EdgeInsets.only(bottom: 50, top: 8),
            padding: EdgeInsets.only(top: 4, bottom: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: lightBlue2.withOpacity(0.2),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OptionsConfig(
                    hint: 'Semana começa em',
                    icon: Icon(
                        Icons.list,
                      color: strongBlue,
                    ),
                    widget:
                    IconButton(
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                      ),
                      onPressed: () {  },
                 )
                ),
                Divider(
                  color: lightBlue2.withOpacity(0.1),
                  thickness: 3, // Espessura da linha
                  indent: 18, // Espaço à esquerda
                  endIndent: 18, // Espaço à direita
                ),
                OptionsConfig(
                    hint: 'Alterar idioma',
                    icon: Icon(
                        Icons.g_translate,
                      color: strongBlue,
                    ),
                    widget:
                    IconButton(
                      icon: Icon(Icons.arrow_forward_ios, size: 18,),
                      onPressed: () {  },
                    )
                ),
                Divider(
                  color: lightBlue2.withOpacity(0.1),
                  thickness: 3, // Espessura da linha
                  indent: 18, // Espaço à esquerda
                  endIndent: 18, // Espaço à direita
                ),
                OptionsConfig(
                    hint: 'Redefinir toda a rotina',
                    icon: Icon(
                        Icons.autorenew,
                      color: strongBlue,
                    ),
                    widget:
                    IconButton(
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                      ),
                      onPressed: () {  },
                    )
                ),
              ],
            ),
          ),
          Text(
            "Ajuda e Feedback",
            style: GoogleFonts.sora(
                fontSize: 16,
                color: black
            ),
          ),
          Container(
            width: 396,
            height: 300,
            margin: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: lightBlue2.withOpacity(0.2),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OptionsConfig(
                    hint: 'Central de ajuda',
                    icon: Icon(
                      Icons.book_outlined,
                      color: strongBlue,
                    ),
                    widget:
                    IconButton(
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                      ),
                      onPressed: () {  },
                    )
                ),
                Divider(
                  color: lightBlue2.withOpacity(0.1),
                  thickness: 3, // Espessura da linha
                  indent: 18, // Espaço à esquerda
                  endIndent: 18, // Espaço à direita
                ),
                OptionsConfig(
                    hint: 'Feedback',
                    icon: Icon(
                      Icons.chat_outlined,
                      color: strongBlue,
                    ),
                    widget:
                    IconButton(
                      icon: Icon(Icons.arrow_forward_ios, size: 18,),
                      onPressed: () {  },
                    )
                ),
                Divider(
                  color: lightBlue2.withOpacity(0.1),
                  thickness: 3, // Espessura da linha
                  indent: 18, // Espaço à esquerda
                  endIndent: 18, // Espaço à direita
                ),
                OptionsConfig(
                    hint: 'Avalia-nos',
                    icon: Icon(
                      Icons.favorite_outline,
                      color: strongBlue,
                    ),
                    widget:
                    IconButton(
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                      ),
                      onPressed: () {  },
                    )
                ),
                Divider(
                  color: lightBlue2.withOpacity(0.1),
                  thickness: 3, // Espessura da linha
                  indent: 18, // Espaço à esquerda
                  endIndent: 18, // Espaço à direita
                ),
                OptionsConfig(
                    hint: 'Política de privacidade',
                    icon: Icon(
                      Icons.local_police_outlined,
                      color: strongBlue,
                    ),
                    widget:
                    IconButton(
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                      ),
                      onPressed: () {  },
                    )
                ),
                Divider(
                  color: lightBlue2.withOpacity(0.1),
                  thickness: 3, // Espessura da linha
                  indent: 18, // Espaço à esquerda
                  endIndent: 18, // Espaço à direita
                ),
                OptionsConfig(
                    hint: 'Termos de serviço',
                    icon: Icon(
                      Icons.article_outlined,
                      color: strongBlue,
                    ),
                    widget:
                    IconButton(
                      icon: Icon(Icons.arrow_forward_ios, size: 18,),
                      onPressed: () {  },
                    )
                ),
              ],
            ),
          ),
        ],
      )
      );
  }
}
