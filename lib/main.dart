import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:organizeme/data/http/http_client.dart';
import 'package:organizeme/data/repositories/habits_repository.dart';
import 'package:organizeme/data/repositories/library_repository.dart';
import 'package:organizeme/data/repositories/status_repository.dart';
import 'package:organizeme/data/repositories/tarefas_repository.dart';
import 'package:organizeme/pages/home/components/body_home.dart';
import 'package:organizeme/pages/home/home.dart';
import 'package:organizeme/pages/splash_screen/splash_screen.dart';
import 'package:organizeme/stores/habitos_store.dart';
import 'package:organizeme/stores/library_store.dart';
import 'package:organizeme/stores/status_store.dart';
import 'package:organizeme/stores/tarefas_store.dart';
import 'package:provider/provider.dart';

void main() {
  Intl.defaultLocale = 'pt_BR';
  initializeDateFormatting('pt_BR', null);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TarefasStore(repository: TarefasRepository(client: HttpClient()))),
        ChangeNotifierProvider(create: (_) => HabitosStore(repository: HabitsRepository(client: HttpClient()))),
        ChangeNotifierProvider(create: (_) => LibraryStore(repository: LibraryRepository(client: HttpClient()))),
        ChangeNotifierProvider(create: (_) => StatusStore(repository: StatusRepository(client: HttpClient()))),

      ],
      child: MaterialApp(
        title: 'OrganizeMe',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
