import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:organizeme/widgets/input_field.dart';
import 'package:provider/provider.dart';
import '../../../constants/colors.dart';
import '../../../data/models/tarefas_model.dart';
import '../../../stores/tarefas_store.dart';
import '../home.dart';

class EditTaskPage extends StatefulWidget {
  final TarefasModel tarefa;

  const EditTaskPage({Key? key, required this.tarefa}) : super(key: key);

  @override
  State<EditTaskPage> createState() => _EditTaskPageState();
}

class _EditTaskPageState extends State<EditTaskPage> {
  late DateTime _selectedDate;
  Color _taskColor = yellow;
  Color _tagColor = inputWhite;
  Color _changeTagColor = inputWhite;
  Color? _selectedColorTag;
  Color? _selectedColorTask;


  late TextEditingController _nomeController;
  late TextEditingController _tempoController;
  late TextEditingController _tagController;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.tarefa.dataHora;
    _taskColor = colorFromString(widget.tarefa.corTarefa) ?? yellow;
    _changeTagColor = colorFromString(widget.tarefa.corTag) ?? inputWhite;

    _selectedColorTask = _taskColor;
    _selectedColorTag = _changeTagColor;

    _nomeController = TextEditingController(text: widget.tarefa.nome);
    _tempoController = TextEditingController(text: widget.tarefa.tempoInicio?.toString() ?? '');
    _tagController = TextEditingController(text: widget.tarefa.nomeTag);
  }

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
                "Editar Tarefa",
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
                      _taskColorButton(pastelYellow),
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
                        onPressed: () {},
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
                        ), onPressed: () {},
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
                        ), onPressed: () {},
                      ), read: false,
                      inputColor: _changeTagColor,
                      controller: _tagController,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 24),
                      child: Row(
                        children: [
                          _tagColorButton(strongGreen),
                          _tagColorButton(circleBlue),
                          _tagColorButton(yellow),
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
                    _updateTarefa();
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: yellow
                  ),
                  child: Text(
                    "Atualizar Tarefa",
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
        DateTime.now().year, DateTime.now().month, DateTime.now().day);
    final tomorrow = today.add(Duration(days: 1));

    if (selectedDate.year == today.year && selectedDate.month == today.month &&
        selectedDate.day == today.day) {
      return "Hoje";
    } else if (selectedDate.year == tomorrow.year && selectedDate.month == tomorrow.month &&
        selectedDate.day == tomorrow.day) {
      return "Amanhã";
    } else {
      return DateFormat('MMM dd, yyyy', 'pt_BR').format(selectedDate);
    }
  }

  void _updateTarefa() async {
    final updatedTarefa = widget.tarefa.copyWith(
      nome: _nomeController.text,
      nomeTag: _tagController.text,
      dataHora: _selectedDate,
      corTarefa: stringFromColor(_taskColor),
      corTag: stringFromColor(_changeTagColor),
    );

    try {
      await context.read<TarefasStore>().updateTarefa(widget.tarefa.id, updatedTarefa);
      Navigator.pop(context); // Voltar para a tela anterior após criar a tarefa
    } catch (e) {
      // Lidar com erro, mostrar mensagem de erro, etc.
    }
    // Verifica se a tarefa foi atualizada e atualiza o widget pai
    //if (updatedTarefa != null) {
      //widget.onUpdate();
    //}
  }

  _showDatePicker() async {
    DateTime? _pickerDate = await showDatePicker(
        context: context,
        firstDate: DateTime(2000),
        lastDate: DateTime(2050),
        initialDate: DateTime.now()
    );
    if (_pickerDate != null) {
      setState(() {
        _selectedDate = _pickerDate;
      });
    }
  }

  Widget _taskColorButton(Color color) {
    return RawMaterialButton(
      onPressed: () {
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
          setState(() {
            _changeTagColor = color;
            _selectedColorTag = color;
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

  Color? colorFromString(String? colorString) {
    if (colorString == null || colorString.isEmpty) {
      return null;
    }
    final buffer = StringBuffer();
    if (colorString.length == 6 || colorString.length == 7) buffer.write('ff');
    buffer.write(colorString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  String? stringFromColor(Color? color) {
    if (color == null) {
      return null;
    }
    return '#${color.value.toRadixString(16).padLeft(8, '0')}';
  }
}
