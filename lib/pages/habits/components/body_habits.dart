import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:organizeme/data/repositories/habits_repository.dart';
import 'package:organizeme/pages/habits/components/habits_menu.dart';
import 'package:organizeme/stores/habitos_store.dart';
import '../../../data/http/http_client.dart';
import 'habits_header.dart';

class BodyHabits extends StatefulWidget {
  const BodyHabits({super.key});

  @override
  State<BodyHabits> createState() => _BodyHabitsState();
}

class _BodyHabitsState extends State<BodyHabits> {

  final HabitosStore habitoStore = HabitosStore(
    repository: HabitsRepository(
      client: HttpClient(),
    ),
  );

  @override
  void initState(){
    super.initState();
    habitoStore.getHabitos();
  }


  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([
        habitoStore.isLoading,
        habitoStore.erro,
        habitoStore.habitoState
      ]),
      builder: (BuildContext context, Widget? child) {
        if (habitoStore.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (habitoStore.erro.value.isNotEmpty) {
          return Center(
            child: Text('Erro: ${habitoStore.erro.value}'),
          );
        }
        if (habitoStore.habitoState.value.isEmpty) {
          return SingleChildScrollView(
            child: Column(
              children: [
                HabitsHeader(),
              ],
            ),
          );

        } else {
          return SingleChildScrollView(
            child: Column(
              children: [
                HabitsHeader(),
                HabitsMenu(habits: habitoStore.habitoState.value,)
              ],
            ),
          );
        }
      }



    );
  }
}
