import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'package:organizeme/widgets/input_field.dart';
import 'package:provider/provider.dart';
import '../../../constants/colors.dart';
import '../../../data/models/tarefas_model.dart';
import '../../../stores/tarefas_store.dart';
import '../home.dart';

class PageTask extends StatefulWidget {
  const PageTask({super.key});

  @override
  State<PageTask> createState() => _PageTaskState();
}

class _PageTaskState extends State<PageTask> {
  DateTime _selectedDate = DateTime.now();
  final DateTime _currentDate = DateTime.now();
  Color _taskColor = yellow;
  Color? _selectedColorTask;
  final Color _tagColor = inputWhite;
  Color _changeTagColor = inputWhite;
  Color? _selectedColorTag;

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _tempoController = TextEditingController();
  final TextEditingController _tagController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        alignment: Alignment.center,
        width: 395,
        height: 657,
        margin: const EdgeInsets.only(top: 50),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
               "Nova Tarefa",
                style: GoogleFonts.sora(
                  color: black,
                  fontSize: 22
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  bottom: 10,
                  top: 10,
                  left: 98
                ),
                  alignment: Alignment.center,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _taskColorButton(strongGreen),
                      _taskColorButton(blue),
                      _taskColorButton(yellow),
                      _taskColorButton(red),
                    ],
                  )
          
              ),
          
              Container(
                alignment: Alignment.center,
                width: 328,
                height: 298,
                padding: EdgeInsets.only(top: 10, bottom: 10),
                margin: EdgeInsets.only(top: 50, bottom: 100, left: 20),
                decoration: BoxDecoration(
                  color: _taskColor,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InputField(
                      hint: 'Nome da Tarefa',
                      read: false,
                      widget: IconButton(
                          icon: const Icon(
                            Icons.edit_outlined,
                            color: black,
                            size: 20,
                          ),
                        onPressed: () {  },
                      ), inputColor: _tagColor,
                      controller: _nomeController,
                    ),
                    InputField(
                        hint: getHint(_selectedDate),
                        widget: IconButton(
                          icon: const Icon(
                            Icons.calendar_month,
                            color: black,
                            size: 20,
                          ), onPressed: () {
                            print('Clicou no calendário');
                            _showDatePicker();
                        },

                        ),
                      read: true,
                      inputColor: _tagColor,

                    ),
                    InputField(
                        hint: 'Tempo',
                      widget: IconButton(
                        icon: const Icon(
                          Icons.alarm,
                          color: black,
                          size: 20,
                        ), onPressed: () {  },
                      ),
                      read: false,
                      inputColor: _tagColor,
                    ),
                    InputField(
                        hint: 'Nome da Tag',
                      widget: IconButton(
                        icon: const Icon(
                          Icons.label_outlined,
                          color: black,
                          size: 20,
                        ), onPressed: () {  },
                      ), read: false,
                      inputColor:  _changeTagColor,
                      controller: _tagController,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 24),
                      child: Row(
                        children: [
                          _tagColorButton(strongGreen),
                          _tagColorButton(circleBlue),
                          _tagColorButton(pastelYellow),
                          _tagColorButton(red),
                        ],
                      ),
                    )
                  ],
                ),

              ),
          
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      _createTarefa();
                    },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: yellow
                  ),
                    child: Text(
                      "Criar Tarefa",
                      style: GoogleFonts.sora(
                        color: black,
                        fontSize: 16
                      ),
                    ),
                ),
              )
            ],
          ),
        ),

      ),

    );
  }

  String getHint(DateTime selectedDate) {
    final today = DateTime(
        _currentDate.year, _currentDate.month, _currentDate.day);
    final tomorrow = today.add(Duration(days: 1));

    if (selectedDate.year == today.year && selectedDate.month == today.month &&
        selectedDate.day == today.day) {
      return "Hoje";
    } else if (selectedDate.year == tomorrow. year && selectedDate.month == tomorrow.month &&
    selectedDate.day == tomorrow.day) {
      return "Amanhã";
    }else {
      return DateFormat('MMM dd, yyyy', 'pt_BR').format(selectedDate);
    }
  }

  void _createTarefa() async {
    final nomeTask = _nomeController.text;
    final nomeTag = _tagController.text;
    final tempo = _tempoController.text;

    final novaTarefa = TarefasModel(
      nome: _nomeController.text,
      nomeTag: _tagController.text,
      corTarefa: stringFromColor(_selectedColorTask),
      corTag: stringFromColor(_selectedColorTag),
      status: false,
      ativo: true,
      habito: false,
      dataHora: _selectedDate,
      tempoInicio: null,
      tempoFinal: null,
    );

    print('Objeto novaTarefa: ${novaTarefa.toMap()}');

    // Chama o método createTarefa no store
    try {
      await context.read<TarefasStore>().createTarefa(novaTarefa.toMap());
      Navigator.pop(context); // Voltar para a tela anterior após criar a tarefa
    } catch (e) {
      // Lidar com erro, mostrar mensagem de erro, etc.
    }
  }

  _showDatePicker() async {
    DateTime? _pickerDate = await showDatePicker(
        context: context,
        firstDate: DateTime(2000),
        lastDate: DateTime(2050),
      initialDate: DateTime.now()
    );
    if( _pickerDate!=null){
      setState(() {
        _selectedDate = _pickerDate;
      });
    }
  }

  _getTimeUser(){
    var pickedTime = _showTimePicker();
    String formateTime = pickedTime.format(context);

  }
  _showTimePicker(){}


  Widget _taskColorButton(Color color) {
    return RawMaterialButton(
      onPressed: () {
        print('Mudou a cor da task');
        setState(() {
          _taskColor = color;
          _selectedColorTask = color;
        });
      },
      fillColor: color,
      shape: const CircleBorder(),
      constraints: const BoxConstraints.tightFor(
        width: 28,
        height: 28,
      ),
      child: _selectedColorTask == color
          ? const Icon(
          Icons.check,
        color: white,
        size: 20,
      ) : null,
    );
  }

  Widget _tagColorButton(Color color) {
    return Container(
      width: 20,
      height: 20,
      margin: const EdgeInsets.only(left: 6),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: white, width: 2),
      ),
      child: RawMaterialButton(
        onPressed: () {
         print('Mudou a cor da tag');
         setState(() {
           _changeTagColor = color;
           _selectedColorTag= color;
         });
        },
        fillColor: color,
        shape: const CircleBorder(),
        constraints: const BoxConstraints.tightFor(
          width: 20,
          height: 20,
        ),
          child: _selectedColorTag == color
              ? const Icon(
            Icons.check,
            color: white,
            size: 14,
          ) : null,
      ),
    );
  }

  String? stringFromColor(Color? color) {
    if (color == null) {
      return null;
    }
    return '#${color.value.toRadixString(16).padLeft(8, '0')}';
  }
}
