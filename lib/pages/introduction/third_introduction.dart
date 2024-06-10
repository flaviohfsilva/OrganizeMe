import 'package:flutter/material.dart';

import '../advertising/advertising.dart';

class ThirdIntroduction extends StatelessWidget {
  const ThirdIntroduction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
      const Color.fromRGBO(249, 253, 254, 1), // Define a cor de fundo
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Imagem no centro
            Image.asset(
              'assets/images/imgs_introduction/moca_vaso.png',
              width: 400,
              height: 400,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 20),
            // Três botões pequenos abaixo da imagem
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SmallButton(
                  //botão2
                  onPressed: () {},
                ),
                SmallButton(
                  //botão3
                  onPressed: () {},
                ),
                ElevatedButton(
                  onPressed: () => {},
                  style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      minimumSize: Size(15, 15),
                      backgroundColor: const Color.fromRGBO(134, 189, 201, 1)),
                  child: null,
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Título abaixo dos botões
            const Text(
              'Quebre padrões indesejados e mude de vida.',
              textAlign: TextAlign.center, // Centraliza o texto
              maxLines: 2, // Permite no máximo 2 linhas
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: 'Sora',
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            // Subtítulo abaixo do título
            const SizedBox(
              width: 400,
              height: 70,
              child: const Text(
                'Tire suas metas do papel com o OrganizeMe.',
                textAlign: TextAlign.center, // Centraliza o texto
                maxLines: 3, // Permite no máximo 2 linhas
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: 'Sora',
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),

            const SizedBox(
              height: 60,
              width: 60,
            ),
            // Botão de continuar abaixo
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                    const FirstAdversiting(),
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
                // Ação do botão
                //print('Botão Continuar pressionado');
                // Ação do botão
                //print('Botão Continuar pressionado');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(255, 200, 33, 1),
                minimumSize: const Size(200, 50),
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
            minimumSize: const Size(15, 15),
            backgroundColor: const Color.fromRGBO(183, 227, 236, 1)),
        child: null,
      ),
    );
  }
}