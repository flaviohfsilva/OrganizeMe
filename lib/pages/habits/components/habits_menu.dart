import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:organizeme/constants/colors.dart';
import 'package:organizeme/data/models/habits_model.dart';
import 'package:organizeme/widgets/card_habits.dart';

class HabitsMenu extends StatefulWidget {

  final List<HabitsModel> habits;

  const HabitsMenu({super.key, required this.habits});

  @override
  State<HabitsMenu> createState() => _HabitsMenuState();
}

class _HabitsMenuState extends State<HabitsMenu> {

  int _filtroSelecionado = 0;

  
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
            color: iceWhite,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))
        ),
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              height: 32,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildFilterButton('Todos', 0),
                  SizedBox(width: 10),
                  _buildFilterButton('Melhorar rotina', 1),
                  SizedBox(width: 10),
                  _buildFilterButton('Saúde', 2),
                  SizedBox(width: 10),
                  _buildFilterButton('Finanças', 3),
                  SizedBox(width: 10),
                  _buildFilterButton('Novas habilidades', 4),
                ],
              ),
            ),
            Container(
              height: 580,
              margin: EdgeInsets.only(top: 20, bottom: 50),
              child: SingleChildScrollView(
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final habitos = widget.habits[index];
                    return CardHabits(habitos: habitos);
                  },
                  separatorBuilder: (context, index) => SizedBox(height: 20),
                  itemCount: widget.habits.length,
                ),
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
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        backgroundColor:
        _filtroSelecionado == index ? lightBlue2 : greyBtn.withOpacity(0.4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            color: _filtroSelecionado == index ? Colors.transparent: gray.withOpacity(0.4),
            width: 1,
          ),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 12,
          color: black,
          fontWeight: FontWeight.bold
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

}
