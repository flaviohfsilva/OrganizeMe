import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';
import '../pages/home/components/page_new_task.dart';

class ButtonNewTask extends StatefulWidget {
  const ButtonNewTask({super.key});

  @override
  State<ButtonNewTask> createState() => _ButtonNewTaskState();
}

class _ButtonNewTaskState extends State<ButtonNewTask> {
  @override
  Widget build(BuildContext context) {
    return   FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context)  => const PageTask(),
          );
        },
        backgroundColor: strongBlue,
        child: Icon(
            Icons.add
        ),
      elevation: 0,
      tooltip: 'Adicionar Tarefa',
      shape: const CircleBorder(),
    );
  }
}
