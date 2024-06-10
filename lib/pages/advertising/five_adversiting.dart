import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'last_adversiting.dart';

int clicado = -1;

class FiveAdversiting extends StatelessWidget {
  const FiveAdversiting({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CustomScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CustomScreen extends StatelessWidget {
  const CustomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
      const Color.fromRGBO(249, 253, 254, 1), // Define a cor de fundo
      //   appBar: AppBar(
      //     title: const Text('Tela Customizada'),
      //),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: Image.asset('assets/images/imgs_adversiting/btn_voltar.png'),
                onPressed: () {
                  Navigator.pop(context);
                  // Ação do botão
                },
                iconSize: 10,
              ),
            ),
            // 5 Botões pequenos lado a lado
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SmallButton(
                  //botão1
                  onPressed: () {},
                ),
                SmallButton(
                  //botão2
                  onPressed: () {},
                ),
                SmallButton(
                  //botão3
                  onPressed: () {},
                ),
                SmallButton(
                  //botão4
                  onPressed: () {},
                ),
                ElevatedButton(
                  onPressed: () => {},
                  style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      minimumSize: const Size(12, 12),
                      backgroundColor: const Color.fromRGBO(134, 189, 201, 1)),
                  child: null,
                ),
              ],
            ),
            const SizedBox(height: 10), // Espaço entre os botões e o título
            // Título
            const SizedBox(
              child: Text(
                'Você costuma praticar exercícios?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Codec', //fonte codec
                  fontSize: 25,
                  //fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10), // Espaço entre o título e a imagem
            // Imagem
            Image.asset(
              'assets/images/imgs_adversiting/exercicio_adversiting.png',
              width: 220,
              height: 220,
              fit: BoxFit.contain,
            ),
            const SizedBox(
                height: 20), // Espaço entre a imagem e os botões "Teste"
            //botões com bordas azuis ao clicar na coluna abaixo
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SelectableButtons(),
                SizedBox(
                    height: 16), //espaçamento entre seleção e botão continuar
              ],
            ),
            const SizedBox(height: 20), // Espaço entre os botões
            //----------------------------------------------------------------------------------------
            //BOTÂOCONTINUAR
            ElevatedButton(
              onPressed: () {
                if (clicado != -1) {
                  // Navegar para a ultima tela com animação personalizada
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                      const LastAdversiting(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        // Definindo a animação da transição
                        const begin =
                        Offset(1.0, 0.0); // Começa fora da tela à esquerda
                        const end =
                        Offset(0.0, 0.0); // Termina na posição original
                        const curve = Curves.easeInOut;

                        var tween = Tween(begin: begin, end: end)
                            .chain(CurveTween(curve: curve));

                        return SlideTransition(
                          position: animation.drive(tween),
                          child: child,
                        );
                      },
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(255, 200, 33, 1),
                minimumSize: const Size(250, 65),
                // side: const BorderSide(
                //   color: Color.fromRGBO(134, 189, 201, 1), // Cor da borda
                //   width: 2.0, // Largura da borda
                // ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      20), // Reduzindo o arredondamento para 8.0
                ),
                alignment: Alignment.center,
              ),
              child: const Text(
                'Continuar',
                style: TextStyle(fontFamily: 'Sora', color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget personalizado para os botões pequenos
class SmallButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SmallButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.5),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(0),
            minimumSize: const Size(12, 12),
            backgroundColor: const Color.fromRGBO(183, 227, 236, 1)),
        child: null,
      ),
    );
  }
}

//-----------------------------------------------------------------------------------------------
//Borda azul e botões quando clicados
class SelectableButtons extends StatefulWidget {
  const SelectableButtons({super.key});

  @override
  _SelectableButtonsState createState() => _SelectableButtonsState();
}

class _SelectableButtonsState extends State<SelectableButtons> {
  int selectedButtonIndex =
  -1; // Índice do botão selecionado (-1 significa nenhum botão selecionado)

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildButton(0, 'Não, não faço exercícios'),
        const SizedBox(height: 16),
        _buildButton(1, 'Não pratico com frequência'),
        const SizedBox(height: 16),
        _buildButton(2, 'Sim, mas queria melhorar a constância'),
        const SizedBox(height: 16),
        _buildButton(3, 'Sim, pratico frequentemente'),
      ],
    );
  }

  Widget _buildButton(int index, String text) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          selectedButtonIndex = index; // Atualiza o índice do botão selecionado
          clicado = index;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromRGBO(254, 250, 237, 1),
        minimumSize: const Size(350, 65),
        maximumSize: const Size(350, 65),
        side: BorderSide(
          color: selectedButtonIndex == index
              ? const Color.fromRGBO(134, 189, 201, 1)
              : Colors.transparent, // Borda azul se o botão estiver selecionado
          width: 2.0,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        alignment: Alignment.centerLeft,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Text(
          text,
          style: const TextStyle(fontFamily: 'Sora', color: Colors.black),
        ),
      ),
    );
  }
}