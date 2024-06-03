import 'package:flutter/material.dart';
import '../../pages/habits/habits.dart';
import 'package:organizeme/constants/colors.dart';

class RotinaScreen extends StatefulWidget {
  @override
  _RotinaScreenState createState() => _RotinaScreenState();
}

class _RotinaScreenState extends State<RotinaScreen> {
  List<bool> isActivated =
      List<bool>.generate(6, (index) => false); // Lista de estados dos botões
  bool isAllActivated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nova Rotina'),
      ),
      body: Padding(
        padding: EdgeInsets.all(
            20.0), // Espaço entre a borda da tela e o container externo
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(241, 252, 255, 1), // Azul claro
            borderRadius: BorderRadius.circular(
                35.0), // Bordas arredondadas para o container externo
          ),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Alinha todo o conteúdo à esquerda
            children: [
              Container(
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(164, 196, 255, 0.4), // Azul escuro
                  borderRadius: BorderRadius.circular(
                      35.0), // Bordas arredondadas para o container interno
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Rotina durma bem',
                            style: TextStyle(
                              color: Color.fromRGBO(104, 143, 215, 1),
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            'Organize sua rotina para ter tempo de\nfazer algo novo',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 11.0,
                            ), // Espaço ao redor do container interno
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20.0),
                    Image.asset(
                      'assets/images/imageSono.jpeg',
                      width: 100.0,
                      height: 100.0,
                    ),
                  ],
                ),
              ),
              SizedBox(
                  height:
                      40.0), // Espaço entre o container azul escuro e o título
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // Alinha texto à esquerda
                  children: [
                    Text(
                      'Editar Rotina',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(0, 0, 0, 1), // Azul escuro
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Selecione as tarefas que você prefere',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                  height: 40.0), // Espaço entre o título e a lista de itens
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 8.0), // Alinha conteúdo restante à esquerda
                  child: ListView.builder(
                    itemCount: 6, // Número de itens na lista
                    itemBuilder: (context, index) {
                      return _buildListItem(
                          index); // Constrói cada item da lista
                    },
                  ),
                ),
              ),
              // Espaço entre a lista e os botões
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 30.0, vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isAllActivated = !isAllActivated;
                          for (int i = 0; i < isActivated.length; i++) {
                            isActivated[i] = isAllActivated;
                          }
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        disabledBackgroundColor: Color.fromRGBO(
                            241, 252, 255, 1), // Removendo cor de fundo
                        elevation: 0, // Removendo sombra
                      ),
                      child: Row(
                        children: [
                          Icon(
                            isAllActivated
                                ? Icons.check
                                : Icons.radio_button_unchecked,
                            color: isAllActivated
                                ? Color.fromARGB(255, 0, 0, 0)
                                : Colors.black,
                            size: 16.0,
                          ),
                          SizedBox(width: 10.0),
                          Text(
                            'Adicionar todos',
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Color.fromRGBO(0, 0, 0, 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HabitsScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(205, 255, 154, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: BorderSide(
                              color: const Color.fromRGBO(
                                  141, 205, 46, 1)), // Borda preta
                        ),
                      ),
                      child: Text(
                        'Comece agora',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListItem(int index) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(
              right: 17.0), // Margem uniforme para todos os botões
          child: GestureDetector(
            onTap: () {
              setState(() {
                isActivated[index] = !isActivated[index];
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color: isActivated[index] ? Colors.green : Colors.white,
                shape: BoxShape.circle,
                border: isActivated[index]
                    ? null
                    : Border.all(
                        color: Colors.black,
                        width: 2.0), // Remove a borda se estiver ativado
              ),
              padding: EdgeInsets.all(6.0), // Reduzindo o tamanho do botão
              child: Icon(
                isActivated[index] ? Icons.check : Icons.add,
                color: isActivated[index]
                    ? Colors.white
                    : Colors.black, // Cor da borda do ícone de +
                size: 20.0, // Reduzindo o tamanho do ícone
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: isActivated[index]
                  ? Color.fromRGBO(155, 190, 255, 1)
                  : Color.fromRGBO(255, 223, 125, 1),
              borderRadius: BorderRadius.circular(20.0),
            ),
            padding: EdgeInsets.all(14.0),
            margin: EdgeInsets.only(bottom: 12.0),
            child: Text(
              _getListItemTitle(index),
              style: TextStyle(
                color: isActivated[index] ? Colors.black : Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }

  String _getListItemTitle(int index) {
    switch (index) {
      case 0:
        return 'Suspender o uso de cafeína no período do final da noite';
      case 1:
        return 'Tomar banho relaxante';
      case 2:
        return 'Vista seu pijama';
      case 3:
        return 'Refletir sobre o dia';
      case 4:
        return 'Monitorar o sono';
      case 5:
        return 'Estabelecer uma rotina de sono';
      default:
        return '';
    }
  }
}
