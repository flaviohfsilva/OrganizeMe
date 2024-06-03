import 'package:flutter/material.dart';
import 'package:organizeme/pages/habits/DurmaBem.dart';

class HabitsScreen extends StatefulWidget {
  @override
  _HabitsScreenState createState() => _HabitsScreenState();
}

class _HabitsScreenState extends State<HabitsScreen> {
  int _filtroSelecionado = 0;

  List<Map<String, dynamic>> habits = [
    {
      'title': 'Rotina durma bem',
      'subtitle': 'Organize sua rotina para ter tempo de fazer algo novo',
      'category': 'Saúde',
      'imagePath': 'assets/images/sono.jpeg',
      'route': RotinaSonoScreen(),
    },
    {
      'title': 'Atividade em casa',
      'subtitle': 'Organize sua rotina para ter tempo de fazer algo novo',
      'category': 'Finança',
      'imagePath': 'assets/images/atividade_casa.jpeg',
    },
    {
      'title': 'Hábitos essenciais',
      'subtitle': 'Organize sua rotina para ter tempo de fazer algo novo',
      'category': 'melhorar rotina',
      'imagePath': 'assets/images/sono.jpeg',
    },
    {
      'title': 'Termine suas tarefas',
      'subtitle': 'Organize sua rotina para ter tempo de fazer algo novo',
      'category': 'novas habilidades',
      'imagePath': 'assets/images/sono.jpeg',
    },
    {
      'title': 'Finanças pessoais',
      'subtitle': 'Organize sua rotina para ter tempo de fazer algo novo',
      'category': 'Finança',
      'imagePath': 'assets/images/sono.jpeg',
    },
  ];

  final List<Color> cardColors = [
    Color.fromRGBO(164, 196, 255, 0.4),
    Color.fromRGBO(255, 223, 125, 1),
    const Color.fromRGBO(205, 255, 154, 1),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Habits'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Plano de rotina',
              style: TextStyle(
                fontSize: 16.0,
                color: const Color.fromRGBO(104, 143, 215, 1),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Nós preparamos uma rotina para te ajudar na organização do seu dia',
              style: TextStyle(
                fontSize: 11.0,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 25.0),
            Container(
              height: 25,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildFilterButton('Todos', 0),
                  SizedBox(width: 10),
                  _buildFilterButton('Saúde', 1),
                  SizedBox(width: 10),
                  _buildFilterButton('Finança', 2),
                  SizedBox(width: 10),
                  _buildFilterButton('novas habilidades', 3),
                  SizedBox(width: 10),
                  _buildFilterButton('melhorar rotina', 4),
                ],
              ),
            ),
            SizedBox(height: 15.0), // Ajusta a distância entre filtros e cards
            Expanded(
              child: ListView.builder(
                itemCount: _getFilteredHabits().length,
                itemBuilder: (context, index) {
                  Map<String, dynamic> habit = _getFilteredHabits()[index];
                  return GestureDetector(
                    onTap: index == 0
                        ? () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => habit['route']),
                            );
                          }
                        : null,
                    child: SizedBox(
                      height: 107, // Defina a altura desejada aqui
                      child: Card(
                        color: cardColors[
                            index % cardColors.length], // Cor do card
                        elevation: 0, // Remove a sombra
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              33), // Ajuste o raio do arredondamento
                        ),
                        margin: EdgeInsets.symmetric(
                            vertical:
                                5), // Aumenta a margem vertical para separar mais os cards
                        child: Padding(
                          padding: EdgeInsets.all(
                              16.0), // Ajuste o espaçamento interno
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      habit['title'],
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Color.fromRGBO(104, 143, 215, 1),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      habit['subtitle'],
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 10),
                              Image.asset(
                                habit['imagePath'],
                                width: 80.0, // Aumente o tamanho da imagem
                                height: 80.0, // Aumente o tamanho da imagem
                                errorBuilder: (context, error, stackTrace) {
                                  return Icon(Icons.error);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterButton(String label, int index) {
    return TextButton(
      onPressed: () {
        setState(() {
          _filtroSelecionado = index;
        });
      },
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        backgroundColor:
            _filtroSelecionado == index ? Colors.blue : Colors.grey[300],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            color: _filtroSelecionado == index ? Colors.blue : Colors.grey,
            width: 2,
          ),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 14,
          color: _filtroSelecionado == index ? Colors.white : Colors.black,
        ),
      ),
    );
  }

  List<Map<String, dynamic>> _getFilteredHabits() {
    if (_filtroSelecionado == 0) {
      return habits;
    } else if (_filtroSelecionado == 1) {
      return habits.where((habit) => habit['category'] == 'Saúde').toList();
    } else if (_filtroSelecionado == 2) {
      return habits.where((habit) => habit['category'] == 'Finança').toList();
    } else if (_filtroSelecionado == 3) {
      return habits
          .where((habit) => habit['category'] == 'novas habilidades')
          .toList();
    } else {
      return habits
          .where((habit) => habit['category'] == 'melhorar rotina')
          .toList();
    }
  }
}
