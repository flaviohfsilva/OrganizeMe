import 'package:flutter/material.dart';

class LivroSelecionado extends StatefulWidget {
  @override
  _LivroSelecionadoState createState() => _LivroSelecionadoState();
}

class _LivroSelecionadoState extends State<LivroSelecionado> {
  String _tipoSelecionado = 'Livro';
  String _statusSelecionado = 'Quero Ler';

  void _mostrarDadosLivro() {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: '',
      transitionDuration: Duration(milliseconds: 300),
      pageBuilder: (context, animation1, animation2) {
        return Center(
          child: Container(
            padding: EdgeInsets.all(20.0),
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Material(
              type: MaterialType.transparency,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Dados do livro',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.black),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        _buildDadosLivroRow('Editora', 'Rocco'),
                        _buildDadosLivroRow('Páginas', '333'),
                        _buildDadosLivroRow('Lançado em', '2020'),
                        _buildDadosLivroRow('ISBN', '123456789101112'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, animation1, animation2, child) {
        return FadeTransition(
          opacity: animation1,
          child: ScaleTransition(
            scale: animation1,
            child: child,
          ),
        );
      },
    );
  }

  Widget _buildDadosLivroRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 16.0),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 16.0, color: Colors.blue),
          ),
        ],
      ),
    );
  }

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
          Container(
            color: Colors.blue.shade200,
            padding: EdgeInsets.all(20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/book-hp.jpeg',
                  fit: BoxFit.cover,
                  height: 150.0,
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
              ],
            ),
          ),
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
                  onTap: _mostrarDadosLivro,
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
                      child: Text(
                        'Livro',
                        style: TextStyle(color: Colors.black), // Cor do label
                      ),
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
                      child: Text(
                        'Ebook',
                        style: TextStyle(color: Colors.black), // Cor do label
                      ),
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
                      child: Text(
                        'Áudio-livro',
                        style: TextStyle(color: Colors.black), // Cor do label
                      ),
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
                      child: Text(
                        'Quero Ler',
                        style: TextStyle(color: Colors.black), // Cor do label
                      ),
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
                      child: Text(
                        'Lendo',
                        style: TextStyle(color: Colors.black), // Cor do label
                      ),
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
                      child: Text(
                        'Lido',
                        style: TextStyle(color: Colors.black), // Cor do label
                      ),
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
                      child: Text(
                        'Abandonei',
                        style: TextStyle(color: Colors.black), // Cor do label
                      ),
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
