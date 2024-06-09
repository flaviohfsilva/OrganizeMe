import 'package:flutter/material.dart';
import 'third_introduction.dart';

class SecondIntroduction extends StatelessWidget {
  const SecondIntroduction({super.key});

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
              'imgs/imgs_introduction/moca_lendo.png',
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
                  //minibotão1
                  onPressed: () {},
                ),
                ElevatedButton(
                  //minibotao2
                  onPressed: () => {},
                  style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      minimumSize: const Size(15, 15),
                      backgroundColor: const Color.fromRGBO(134, 189, 201, 1)),
                  child: null,
                ),
                SmallButton(
                  //minibotão3
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Título abaixo dos botões
            const Text(
              'Crie hábitos e melhore sua saúde mental e físca.',
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
              child: Text(
                'Hábitos saudáveis, podem melhorar significativamente a saúde mental e o bem-estar emocional.',
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
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const ThirdIntroduction(),
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
