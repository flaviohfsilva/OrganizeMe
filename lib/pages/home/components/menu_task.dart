import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:organizeme/data/models/tarefas_model.dart';
import 'package:organizeme/widgets/card_abandonei.dart';
import 'package:organizeme/widgets/status_card_lendo.dart';
import '../../../constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data/models/status_model.dart';
import '../../../widgets/card_lendo.dart';
import '../../../widgets/card_lido.dart';
import '../../../widgets/card_quero_ler.dart';
import '../../../widgets/card_task.dart';


class MenuTask extends StatefulWidget {

  final List<TarefasModel> tasks;
  final List<StatusModel> status;


  const MenuTask({super.key, required this.tasks, required this.status});

  @override
  State<MenuTask> createState() => _MenuTaskState();
}

class _MenuTaskState extends State<MenuTask> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final lendoBooks = filterBooksByStatus('Lendo');
    final queroLerBooks = filterBooksByStatus('Quero Ler');
    final lidoBooks = filterBooksByStatus('Lido');
    final abandoneiBooks = filterBooksByStatus('Abandonei');

    return  SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(25),
        margin: EdgeInsets.only(top: 15),
        decoration: BoxDecoration(
            color: offWhite,
            borderRadius: BorderRadius.circular(30)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Suas Tarefas",
              style: GoogleFonts.sora(
                color: black,
                fontWeight: FontWeight.bold,
                fontSize: 16
              ),
            ),
              Container(
                height: 310,
                margin: EdgeInsets.only(top: 20, bottom: 50),
                child: SingleChildScrollView(
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final task = widget.tasks[index];
                      return CardTask(
                        id: task.id,
                        nome: task.nome,
                        nomeTag: task.nomeTag,
                        tagColor: task.corTag,
                        taskColor: task.corTarefa,
                        status: task.status,
                        dataHora: task.dataHora,
                        ativo: task.ativo,
                        habito: task.habito,
                        tempoInicio: task.tempoInicio,
                        tempoFinal: task.tempoFinal,
                        idHabito: task.idHabito,
                        tarefa: task,
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(height: 10),
                    itemCount: widget.tasks.length,
                  ),
                ),
              ),

            Text(
              "Seus Livros",
              style: GoogleFonts.sora(
                  color: black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16
              ),
            ),
            Container(
              height: 380,
              padding: EdgeInsets.all(5),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                      CardLendo(),
                      CardQueroLer(),
                      CardLido(),
                      CardAbandonei(),
                  ],
                ),
              )
            ),
          ],
        ),
      ),
    );
  }

  List<StatusModel> filterBooksByStatus(String status) {
    return widget.status.where((s) => s.nome == status).toList();
  }
}
