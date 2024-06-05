import 'package:flutter/material.dart';

class LivroSelecionado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          // Header with book image and details
          Container(
            padding: EdgeInsets.all(20.0),
            color: Colors.blue.shade100,
            child: Column(
              children: [
                Image.network(
                  'https://link-to-harry-potter-book-cover.jpg',
                  height: 150,
                ),
                SizedBox(height: 10),
                Text(
                  'Harry Potter e a Pedra Filosofal',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'J.K. Rowling',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Rocco',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          // Sinopse
          Text(
            'Sinopse',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc eu scelerisque purus. Aenean venenatis iaculis rutrum. Donec nisl turpis, hendrerit id ligula non, tincidunt interdum turpis. Nulla nisi nulla, finibus sit amet nisi non, mollis eleifend nisi. Integer pulvinar justo dui...',
            ),
          ),
          SizedBox(height: 10),
          TextButton(
            onPressed: () {
              // Navegar para a página completa da sinopse
            },
            child: Text(
              'Ler mais',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          ),
          SizedBox(height: 20),
          // Dados do livro
          ListTile(
            leading: Icon(Icons.book),
            title: Text('Dados do livro'),
            onTap: () {
              // Navegar para a página de dados do livro
            },
          ),
          SizedBox(height: 20),
          // Tipo de livro
          Text(
            'Qual o seu tipo de livro?',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Chip(
                label: Text('Livro'),
                backgroundColor: Colors.blue.shade100,
              ),
              Chip(
                label: Text('Ebook'),
                backgroundColor: Colors.orange.shade100,
              ),
              Chip(
                label: Text('Áudio-livro'),
                backgroundColor: Colors.yellow.shade100,
              ),
            ],
          ),
          SizedBox(height: 20),
          // Status do livro
          Text(
            'Como está o seu status para esse livro?',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Chip(
                label: Text('Quero Ler'),
                backgroundColor: Colors.blue.shade100,
              ),
              Chip(
                label: Text('Lendo'),
                backgroundColor: Colors.green.shade100,
              ),
              Chip(
                label: Text('Lido'),
                backgroundColor: Colors.purple.shade100,
              ),
              Chip(
                label: Text('Abandonei'),
                backgroundColor: Colors.red.shade100,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
