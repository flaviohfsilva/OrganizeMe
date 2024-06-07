import 'package:flutter/material.dart';

class LivroSelecionado extends StatefulWidget {
  @override
  _LivroSelecionadoState createState() => _LivroSelecionadoState();
}

class _LivroSelecionadoState extends State<LivroSelecionado> {
  String _tipoSelecionado = 'Livro'; // Valor padrão
  String _statusSelecionado = 'Quero Ler'; // Valor padrão

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Container azul com imagem e detalhes do livro
          Container(
            color: Colors.blue.shade200,
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/book-hp.jpeg',
                  fit: BoxFit.cover,
                  height: 150.0,
                ),
                SizedBox(height: 10),
                Text(
                  'Harry Potter e a Pedra Filosofal',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'J.K. Rowling',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Rocco',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          // Container branco com sinopse, status do livro e detalhes
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _tipoSelecionado = 'Livro';
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _tipoSelecionado == 'Livro'
                            ? Color(0xFFA4C4FF)
                            : Color(0xFFFEFAED),
                      ),
                      child: Text('Livro'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _tipoSelecionado = 'Ebook';
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _tipoSelecionado == 'Ebook'
                            ? Color(0xFFA4C4FF)
                            : Color(0xFFFEFAED),
                      ),
                      child: Text('Ebook'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _tipoSelecionado = 'Áudio-livro';
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _tipoSelecionado == 'Áudio-livro'
                            ? Color(0xFFA4C4FF)
                            : Color(0xFFFEFAED),
                      ),
                      child: Text('Áudio-livro'),
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
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _statusSelecionado = 'Quero Ler';
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _statusSelecionado == 'Quero Ler'
                            ? Color(0xFFA4C4FF)
                            : Color(0xFFFEFAED),
                      ),
                      child: Text('Quero Ler'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _statusSelecionado = 'Lendo';
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _statusSelecionado == 'Lendo'
                            ? Color(0xFFA4C4FF)
                            : Color(0xFFFEFAED),
                      ),
                      child: Text('Lendo'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _statusSelecionado = 'Lido';
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _statusSelecionado == 'Lido'
                            ? Color(0xFFA4C4FF)
                            : Color(0xFFFEFAED),
                      ),
                      child: Text('Lido'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _statusSelecionado = 'Abandonei';
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _statusSelecionado == 'Abandonei'
                            ? Color(0xFFA4C4FF)
                            : Color(0xFFFEFAED),
                      ),
                      child: Text('Abandonei'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: LivroSelecionado(),
  ));
}
