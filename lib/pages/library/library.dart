import 'package:flutter/material.dart';

class Biblioteca extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Container azul com visão
          Container(
            width: double.infinity,
            color: Colors.blue.shade200,
            padding: EdgeInsets.symmetric(vertical: 40.0), // Aumente o valor do padding aqui
            child: Column(
              children: [
                Text(
                  'Viaje pelas páginas e explore novos mundos',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50.0),
                  child: Container(
                    margin: EdgeInsets.only(top: 20.0), // Adiciona margem superior
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Busque por autor, título ou ISBN',
                        hintStyle: TextStyle(
                          color: Colors.blue.shade200, // Cor do hint text
                        ),
                        suffixIcon: Icon(
                          Icons.search,
                          color: Colors.blue.shade400, // Cor do ícone
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      style: TextStyle(
                        color: Colors.blue.shade400, // Cor do texto
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Container livros sugeridos
          Expanded(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: ListView(
                children: [
                  // Sugerido para você
                  Text(
                    'Sugerido para você',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 200.0,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 120.0,
                          margin: const EdgeInsets.only(right: 10.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/book-hp.jpeg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Conheça novos títulos
                  Text(
                    'Conheça novos títulos',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 200.0,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 120.0,
                          margin: const EdgeInsets.only(right: 10.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/book-hp.jpeg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Biblioteca(),
  ));
}
