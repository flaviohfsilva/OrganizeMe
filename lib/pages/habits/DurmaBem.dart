import 'package:flutter/material.dart';
import 'package:organizeme/pages/habits/rotina_DurmaBem.dart';

class RotinaSonoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rotina de Sono'),
      ),
      body: Padding(
        padding: EdgeInsets.all(
            16.0), // Afasta o Container principal dos cantos da tela
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(241, 252, 255, 1),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 1.0),
                        Center(
                          child: Image.asset(
                            'assets/images/imageSono.jpeg',
                            width: 400.0,
                            height: 400.0,
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Text(
                          'Como dormir melhor',
                          style: TextStyle(
                            color: Color.fromRGBO(104, 143, 215, 1),
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'Nós preparamos uma rotina para te ajudar na organização do seu dia.',
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'Aperte no botão e adicione na sua rotina',
                          style: TextStyle(
                            fontSize: 9.0,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(height: 20.0),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    bottom: 20.0), // Espaço entre o botão e a borda inferior
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RotinaScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10), // Tamanho reduzido
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: BorderSide(
                          color: const Color.fromRGBO(
                              141, 205, 46, 1), // Borda preta
                        ),
                      ),
                      backgroundColor: const Color.fromRGBO(205, 255, 154, 1),
                    ),
                    child: Text(
                      'Adicionar nova rotina',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0, // Fonte reduzida
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
