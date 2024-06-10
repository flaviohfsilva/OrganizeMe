import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:organizeme/pages/home/components/edit_task_page.dart';
import 'package:organizeme/widgets/dialog_delete.dart';
import 'package:provider/provider.dart';
import '../constants/colors.dart';
import '../data/models/tarefas_model.dart';
import '../pages/home/components/page_new_task.dart';
import '../stores/tarefas_store.dart';

class CardTask extends StatefulWidget {
  final TarefasModel tarefa;
  final int? id;
  final String nome;
  final String? nomeTag;
  final bool? status;
  final DateTime dataHora;
  final bool? ativo;
  final bool habito;
  final DateTime? tempoInicio;
  final DateTime? tempoFinal;
  final int? idHabito;
  final String? taskColor;
  final String? tagColor;

  const CardTask({
    Key? key,
    required this.nome,
    this.nomeTag,
    this.status,
    required this.dataHora,
    this.ativo,
    required this.habito,
    this.tempoInicio,
    this.tempoFinal,
    this.idHabito,
    this.taskColor,
    this.tagColor,
    this.id,
    required this.tarefa,
  }) : super(key: key);

  @override
  _CardTaskState createState() => _CardTaskState();
}

class _CardTaskState extends State<CardTask> {
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    isChecked = widget.status!;
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(
          motion: ScrollMotion(),
          children: [
              _SlidableAction(
                context: context,
                color: red,
                iconColor: white,
                textColor: white,
                icon: Icons.delete_forever_outlined,
                label: 'Excluir',
                onTap: () => _deleteTask(widget.id),
              ),
            _SlidableAction(
              context: context,
              color: lightBlue2,
              iconColor: black,
              textColor: black,
              icon: Icons.edit_outlined,
              label: 'Editar',
              onTap: () => _editTask(widget.tarefa),
            ),
          ]
      ),
      child: Container(
        width: double.infinity,
        height: 80,
        margin: EdgeInsets.symmetric(vertical: 5),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: colorFromString(widget.taskColor) ?? white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        child: Row(
          children: [
            // Checkbox
            GestureDetector(
              onTap: () {
                setState(() {
                  isChecked = !isChecked;
                });
              },
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: isChecked ? null : Border.all(color: black, width: 2),
                  color: isChecked ? white : Colors.transparent,  // Cor da borda do círculo
                ),
                child: isChecked
                    ? Icon(Icons.check_circle, size: 22, color: strongGreen) // Ícone de marcação quando isChecked é true
                    : null, // Se isChecked for false, não mostrar nada
              ),
            ),
            SizedBox(width: 10),

            // Nome e Datas
            Expanded(
                child: Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text(
                        widget.nome,
                        style: GoogleFonts.sora(
                          color: black,
                          fontSize: 14,
                        ),
                      ),
                      if (widget.tempoInicio != null && widget.tempoFinal != null)
                        Text(
                          '${widget.tempoInicio!.toLocal()} - ${widget.tempoFinal!.toLocal()}',
                          style: GoogleFonts.sora(
                            color: black,
                            fontSize: 10,
                          ),
                      ),
                    ],
                  ),
                ),
              ),
            Container(
              width: 64,
              height: 22,
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: colorFromString(widget.tagColor) ?? Colors.transparent,
                borderRadius: BorderRadius.circular(5)
              ),
              child: Text(
                widget.nomeTag ?? '',
                textAlign: TextAlign.center,
                style: GoogleFonts.sora(
                  color: white,
                  fontSize: 10
                ),

              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _SlidableAction({
    required BuildContext context,
    required Color color,
    required Color iconColor,
    required Color textColor,
    required IconData icon,
    required String label,
    required void Function() onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 70,
        height: 70,
        margin: EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20), // Adjust the radius as needed
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: iconColor,),
              SizedBox(height: 4),
              Text(
                label,
                textAlign: TextAlign.center,
                style: GoogleFonts.sora(
                    color: textColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
}

  void _deleteTask(int? id) async {
    print('Id da tarefa excluída: $id');
    showDialog(
      context: context,
      builder: (context) => DialogDelete(id: id),
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
