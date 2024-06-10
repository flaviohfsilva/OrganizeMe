import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:organizeme/constants/colors.dart';

class HomeCalendar extends StatefulWidget {
  const HomeCalendar({super.key});

  @override
  State<HomeCalendar> createState() => _HomeCalendarState();
}

class _HomeCalendarState extends State<HomeCalendar> {
  DateTime _selectedDate = DateTime.now();
  final DateTime _currentDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final daysOfWeek = ["Seg", "Ter", "Qua", "Qui", "Sex", "Sáb", "Dom"];

    DateTime startOfWeek = _selectedDate.subtract(Duration(days: _selectedDate.weekday % 7));
    final dates = List.generate(7, (index) => startOfWeek.add(Duration(days: index)));

    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity! < 0) {
          _moveToNextWeek();
        } else if (details.primaryVelocity! > 0) {
          _moveToPreviousWeek();
        }
      },
      child: Container(
        height: 285,
        padding: EdgeInsets.only(top: 50, bottom: 20),
        decoration: BoxDecoration(
          color: blue,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    getTitle(_selectedDate),
                    style: GoogleFonts.sora(
                      color: white,
                      fontSize: 16,
                    ),
                  ),
                  if (!_isToday(_selectedDate))
                    SizedBox(
                      height: 24,
                      width: 105,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: strongBlue.withOpacity(0.8),
                          shape: RoundedRectangleBorder(

                            borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20))
                          ),
                        ),
                        icon: Icon(
                          Icons.arrow_left,
                          color: black,
                        ),
                        onPressed: _resetToToday,
                        label: Text(
                          'Hoje',
                          style: GoogleFonts.sora(
                            fontSize: 12,
                            color: white
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(dates.length, (index) {
                final date = dates[index];
                final isSelected = date.day == _selectedDate.day;
                final isToday = date.year == _currentDate.year && date.month == _currentDate.month && date.day == _currentDate.day;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedDate = date;
                    });
                  },
                  child: Container(
                    width: 40,
                    height: 68,
                    margin: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      color: isSelected ? strongBlue : (isToday ? lightBlue : Colors.transparent),
                      borderRadius: BorderRadius.circular(30)
                    ),
                    child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 8, bottom: 8),
                            child: Text(
                                  daysOfWeek[date.weekday - 1],
                                  style: GoogleFonts.sora(
                                    textStyle: TextStyle(
                                      color: isSelected ? black : gray,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                            ),
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: isSelected ? lightBlue2 : (isToday ? blue : Colors.transparent),
                              shape: BoxShape.circle,
                              border: isSelected ? null : (isToday ? null : Border.all(
                                color: lightBlue2,
                                width: 3,
                              ))
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              "${date.day}",
                              style: GoogleFonts.sora(
                                textStyle: TextStyle(
                                  color: isSelected ? black : gray,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ]
                    )
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }


  String getTitle(DateTime selectedDate) {
    final today = DateTime(_currentDate.year, _currentDate.month, _currentDate.day);
    final yesterday = today.subtract(Duration(days: 1));
    final tomorrow = today.add(Duration(days: 1));

    // Ajuste do nome do mês
    String month = DateFormat('MMM', 'pt_BR').format(selectedDate);
    month = month.replaceAll('.', '');
    month = month[0].toUpperCase() + month.substring(1);

    if (selectedDate.year == today.year && selectedDate.month == today.month && selectedDate.day == today.day) {
      return "$month, Hoje";
    } else if (selectedDate.year == yesterday.year && selectedDate.month == yesterday.month && selectedDate.day == yesterday.day) {
      return "Ontem";
    } else if (selectedDate.year == tomorrow.year && selectedDate.month == tomorrow.month && selectedDate.day == tomorrow.day) {
      return "Amanhã";
    } else {
      return DateFormat('MMM dd, yyyy', 'pt_BR').format(selectedDate);
    }
  }

  bool _isToday(DateTime date) {
    return date.year == _currentDate.year && date.month == _currentDate.month && date.day == _currentDate.day;
  }

  void _moveToNextWeek(){
    setState(() {
      _selectedDate = _selectedDate.add(const Duration(days: 7));
    });
  }

  void _moveToPreviousWeek(){
    setState(() {
      _selectedDate = _selectedDate.subtract(const Duration(days: 7));
    });
  }

  void _resetToToday() {
    setState(() {
      _selectedDate = _currentDate;
    });
  }


}
