import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:organizeme/constants/colors.dart';
import 'package:organizeme/data/repositories/habits_repository.dart';
import 'package:organizeme/data/repositories/library_repository.dart';
import 'package:organizeme/data/repositories/status_repository.dart';
import 'package:organizeme/pages/home/components/menu_task.dart';
import 'package:organizeme/stores/habitos_store.dart';
import 'package:organizeme/stores/library_store.dart';
import 'package:organizeme/stores/status_store.dart';
import 'package:organizeme/widgets/button_new_task.dart';

import '../../../data/http/http_client.dart';
import '../../../data/repositories/tarefas_repository.dart';
import '../../../stores/tarefas_store.dart';
import '../../perfil/components/perfi_menu.dart';
import 'home_calendar.dart';
import 'home_menu.dart';


class BodyHome extends StatefulWidget {
  const BodyHome ({super.key});

  @override
  State<BodyHome> createState() => _BodyHomeState();
}

class _BodyHomeState extends State<BodyHome> {

  final TarefasStore taskStore = TarefasStore(
    repository: TarefasRepository(
      client: HttpClient(),
    ),
  );

  final StatusStore statusStore = StatusStore(
    repository: StatusRepository(
      client: HttpClient(),
    ),
  );

  @override
  void initState() {
    super.initState();
    taskStore.getTarefas();
    statusStore.getStatus();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([
        taskStore.isLoading,
        taskStore.erro,
        taskStore.tarefaState,
        statusStore.isLoading,
        statusStore.erro,
        statusStore.statusState
      ]),
      builder: (BuildContext context, Widget? child) {

        if (taskStore.isLoading.value && statusStore.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (taskStore.erro.value.isNotEmpty && statusStore.erro.value.isNotEmpty) {
          return Column(
            children: [
              Text('Erro: ${taskStore.erro.value}'),
              Text('Erro: ${statusStore.erro.value}')
            ],
          );
        }

        if(taskStore.tarefaState.value.isEmpty) {
          return SingleChildScrollView(
            child: Stack(
              children: [
                  Column(
                    children: [
                      HomeCalendar(),
                      Container(
                        height: 510,
                      ),
                    ],
                  ),
                Positioned(
                  top: 180,
                  left: 0,
                  right: 0,
                  child: HomeMenu(),
                ),

                Positioned(
                    bottom: 4.0,
                    right: 16.0,
                    child: ButtonNewTask()
                ),
              ],
            ),
          );
        } else {
          return SingleChildScrollView(
            child: Stack(
              children: [
                Column(
                  children: [
                    HomeCalendar(),
                    Container(
                      height: 810,
                    ),
                  ],
                ),
                Positioned(
                  top: 180,
                  left: 0,
                  right: 0,
                  child: MenuTask(tasks: taskStore.tarefaState.value, status: statusStore.statusState.value),
                ),

                Positioned(
                    bottom: 4.0,
                    right: 16.0,
                    child: ButtonNewTask()
                ),
              ],
            ),
          );
        }
      },
    );
  }
}


