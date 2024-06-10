import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:organizeme/constants/colors.dart';
import 'package:organizeme/data/models/tarefas_model.dart';
import 'package:provider/provider.dart';

import '../../../data/models/habits_model.dart';
import '../../../stores/habitos_store.dart';
import '../../../widgets/card_task.dart';
import '../../home/components/edit_task_page.dart';
import '../../home/home.dart';

class RoutineHabits extends StatefulWidget {

  final List<TarefasModel> tarefas;
  final HabitsModel habitos;

  const RoutineHabits({super.key, required this.tarefas, required this.habitos});

  @override
  State<RoutineHabits> createState() => _RoutineHabitsState();
}

class _RoutineHabitsState extends State<RoutineHabits> {


  late List<bool> isAllActivated;

  bool isActivated = false;
  bool taskActivated = false;

  @override
  void initState() {
    super.initState();
    // Inicializa a lista isActivated com base no estado das tarefas
    isAllActivated = widget.habitos.tarefas.map((tarefa) => tarefa.ativo!).toList();
    // Define isAllActivated com base na lista isActivated
    isActivated = isAllActivated.every((ativo) => ativo);
    taskActivated = isAllActivated.every((ativo) => ativo);
  }

  @override
  Widget build(BuildContext context) {

    final habitosStore = Provider.of<HabitosStore>(context, listen: false);

    return  Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(
            20.0), // Espaço entre a borda da tela e o container externo
        child: Container(
          decoration: BoxDecoration(
            color: iceWhite, // Azul claro
            borderRadius: BorderRadius.circular(
                35.0), // Bordas arredondadas para o container externo
          ),
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: colorFromString(widget.habitos.corHabito), 
                  borderRadius: BorderRadius.circular(
                      35.0), // Bordas arredondadas para o container interno
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.habitos.nome,
                            style: TextStyle(
                              color: strongBlue,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Container(
                            width: 180,
                            child: Text(
                             widget.habitos.subTitulo,
                              style: GoogleFonts.sora(
                                color: black,
                                fontSize: 12.0,
                              ), // Espaço ao redor do container interno
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20.0),
                    Image.asset(
                      'assets/images/${widget.habitos.thumbImg}',
                      width: 120.0,
                      height: 100.0,
                    ),
                  ],
                ),
              ),
              SizedBox(
                  height:
                  40.0), // Espaço entre o container azul escuro e o título
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start, // Alinha texto à esquerda
                  children: [
                    Text(
                      'Editar Rotina',
                      style: GoogleFonts.sora(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(0, 0, 0, 1), // Azul escuro
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Selecione as tarefas que você prefere',
                      style: GoogleFonts.sora(
                        fontSize: 14.0,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                  height: 40.0), // Espaço entre o título e a lista de itens
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 8.0), // Alinha conteúdo restante à esquerda
                  child: ListView.separated(

                    itemCount: widget.habitos.tarefas.length,
                    // Número de itens na lista
                    itemBuilder: (context, index) {
                      final tarefas = widget.habitos.tarefas[index];
                      return _buildListItem(tarefas); // Constrói cada item da lista
                    }, separatorBuilder: (context, index) => SizedBox(height: 20),
                  ),
                ),
              ),
              // Espaço entre a lista e os botões
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                         setState(() {
                           isActivated = !isActivated;
                         });
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                      ),
                      child: Row(
                        children: [
                          Icon(
                              isActivated
                                  ? Icons.check_circle_rounded
                                  : Icons.radio_button_unchecked,
                              color: isActivated ? strongGreen : gray,
                              size: 16.0,
                          ),
                          SizedBox(width: 10.0),
                          Text(
                            'Adicionar todos',
                            style: GoogleFonts.sora(
                              fontSize: 12.0,
                              color: gray,
                            ),
                          ),
                        ],
                      ),
                    ),

                    ElevatedButton(
                      onPressed: () {
                        habitosStore.addHabitTasksToRoutine(widget.habitos.id);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Home(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: BorderSide(
                              color: strongGreen
                          ), // Borda preta
                        ),
                      ),
                      child: Text(
                        'Começar agora',
                        style: GoogleFonts.sora(
                          fontSize: 14.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListItem(TarefasModel tarefa) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                taskActivated = !taskActivated;
              });
            },
            icon: Icon(
              isActivated
                  ? Icons.check_circle_rounded
                  : Icons.add_circle_outline,
              color: isActivated ? strongGreen : gray,
            ),
          ),
          Container(
            width: 275,
            height: 42,
            padding: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
                color: colorFromString(tarefa.corTarefa),
                borderRadius: BorderRadius.circular(15)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  tarefa.nome,
                  style: GoogleFonts.sora(
                      color: black
                  ),
                ),

                IconButton(
                  onPressed: () {
                    _editTask(tarefa);
                  },
                  icon: Icon(
                    Icons.more_vert,
                    color: black,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void _editTask(TarefasModel tarefa) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditTaskPage(tarefa: tarefa),
      ),
    );
  }

  Color? colorFromString(String? colorString) {
    if (colorString == null || colorString.isEmpty) {
      return null;
    }
    final buffer = StringBuffer();
    if (colorString.length == 6 || colorString.length == 7) buffer.write('ff');
    buffer.write(colorString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
