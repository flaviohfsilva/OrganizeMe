import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:organizeme/constants/colors.dart';
import 'package:organizeme/pages/home/components/body_home.dart';
import 'package:provider/provider.dart';

import '../pages/home/home.dart';
import '../stores/tarefas_store.dart';

class DialogDelete extends StatefulWidget {

  final int? id;

  const DialogDelete({super.key, this.id});

  @override
  State<DialogDelete> createState() => _DialogDeleteState();
}

class _DialogDeleteState extends State<DialogDelete> {
  @override
  Widget build(BuildContext context) {
    return  Dialog(
      child: Container(
        height: 190,
        width: 500,
        decoration: BoxDecoration(
          color: begeWhite,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 32
        ),
        child: Column(
          children: [
            Text(
              "Tem certeza que deseja excluir essa tarefa ?",
              textAlign: TextAlign.start,
              style: GoogleFonts.sora(
                color: black,
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),

            SizedBox(height: 30,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 28
                        ),
                      foregroundColor: blue,
                      side: const BorderSide(
                        color: blue,
                      )
                    ),
                    child: Text(
                      "Cancelar",
                      style: GoogleFonts.sora(
                          color: black,
                      ),
                    ),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      _deleteTask(widget.id);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: red,
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 32
                      ),
                    ),
                    child: Text(
                      "Excluir",
                      style: GoogleFonts.sora(
                          color: white,
                      ),
                    ),
                  ),
              ],
            )

          ],
        ),
      ),
    );
  }

  void _deleteTask(int? id) async {
    print('Id da tarefa excluída: ${id}');
    await context.read<TarefasStore>().deleteTarefa(id!);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Home(),
      ),
    );
  }
}
