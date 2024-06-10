// import 'package:flutter/material.dart';

// class LastAdversiting extends StatelessWidget {
//   const LastAdversiting({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: CustomScreen(),
//     );
//   }
// }

// class CustomScreen extends StatelessWidget {
//   const CustomScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       backgroundColor:
//           Color.fromRGBO(249, 253, 254, 1), // Define a cor de fundo
//       //   appBar: AppBar(
//       //     title: const Text('Tela Customizada'),
//       //),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:organizeme/pages/home/home.dart';

class LastAdversiting extends StatelessWidget {
  const LastAdversiting({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: MyCustomScreen(),

      ),
    );
  }
}

class MyCustomScreen extends StatelessWidget {
  const MyCustomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0), // Padding ao redor de toda a tela
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // ImageButton no canto superior esquerdo
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Home(),
                  ),
                );
              },
              iconSize: 20,
            ),
          ),
          // Título centralizado
          const SizedBox(height: 16),
          const Text(
            'Montamos uma rotina especial para você',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'Codec', fontSize: 30, fontWeight: FontWeight.w500
              // fontWeight: FontWeight.bold,
            ),
          ),
          // Primeiro Subtítulo
          const SizedBox(height: 8),
          SizedBox(
            width: 350,
            height: 60,
            child: RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromRGBO(
                      127, 127, 127, 1), // Defina a cor do texto, se necessário
                ),
                children: [
                  TextSpan(
                    text: 'Garanta sua rotina especial pelo valor de ',
                  ),
                  TextSpan(
                    text: 'R\$ 16,24',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(0, 0, 0, 1)),
                  ),
                  TextSpan(
                    text: ' mensal.',
                  ),
                ],
              ),
            ),
          ),
          // Segundo Subtítulo
          SizedBox(
            width: 350,
            height: 60,
            child: RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromRGBO(
                      127, 127, 127, 1), // Defina a cor do texto, se necessário
                ),
                children: [
                  TextSpan(
                    text:
                    'Teste grátis de 7 dias, após o período, renovação automática por R\$194,99/ano” ',
                  ),
                ],
              ),
            ),
          ),
          // Espaçamento antes dos três botões
          const SizedBox(height: 16),
          // Três botões quadrados lado a lado
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //valor 1 mês-----------------------------------------------------
              Stack(
                children: [
                  // Container de trás
                  Container(
                    width: 120,
                    height: 130,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(183, 227, 236, 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Column(
                      children: [
                        SizedBox(height: 3),
                        Text(
                          '',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Codec',
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Container da frente
                  Positioned(
                    top: 5, // Ajusta a posição verticalmente para que
                    //o container da frente se sobreponha ao container de trás
                    left: 5,
                    bottom: 5, // Ajusta a posição horizontalmente para
                    //que o container da frente se sobreponha ao container de trás
                    child: Container(
                      width: 110,
                      height: 120,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(255, 255, 255, 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      alignment: Alignment.center,
                      child: const Column(
                        children: [
                          SizedBox(height: 10),
                          Text(
                            '1',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Codec',
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 0),
                          Text(
                            'Mês',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Codec',
                              fontSize: 22,
                              //fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 0),
                          Text(
                            '_____________________',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'Codec',
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 0),
                          Text(
                            'R\$ 48,99 / Mês',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Sora',
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              //Valor 12 meses-------------------------------------------------------
              Stack(
                children: [
                  // Container de trás
                  Container(
                    width: 120,
                    height: 150,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(134, 189, 201, 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Column(
                      children: [
                        SizedBox(height: 3),
                        Text(
                          '7 Dias Grátis',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Codec',
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Container da frente
                  Positioned(
                    top: 25, // Ajusta a posição verticalmente para que
                    //o container da frente se sobreponha ao container de trás
                    left: 5,
                    bottom: 5, // Ajusta a posição horizontalmente para
                    //que o container da frente se sobreponha ao container de trás
                    child: Container(
                      width: 110,
                      height: 140,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(255, 255, 255, 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      alignment: Alignment.center,
                      child: const Column(
                        children: [
                          SizedBox(height: 10),
                          Text(
                            '12',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Codec',
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 0),
                          Text(
                            'Meses',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Codec',
                              fontSize: 22,
                              //fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 0),
                          Text(
                            '_____________________',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'Codec',
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 0),
                          Text(
                            'R\$ 194,99/1 ano',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Sora',
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              //valor 3 meses----------------------------------------------------------------------
              Stack(
                children: [
                  // Container de trás
                  Container(
                    width: 120,
                    height: 150,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(183, 227, 236, 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Column(
                      children: [
                        SizedBox(height: 3),
                        Text(
                          'Popular',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Codec',
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Container da frente
                  Positioned(
                    top: 25, // Ajusta a posição verticalmente para que
                    //o container da frente se sobreponha ao container de trás
                    left: 5,
                    bottom: 5, // Ajusta a posição horizontalmente para
                    //que o container da frente se sobreponha ao container de trás
                    child: Container(
                      width: 110,
                      height: 140,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(255, 255, 255, 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      alignment: Alignment.center,
                      child: const Column(
                        children: [
                          SizedBox(height: 10),
                          Text(
                            '3',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Codec',
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 0),
                          Text(
                            'Meses',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Codec',
                              fontSize: 22,
                              //fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 0),
                          Text(
                            '_____________________',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'Codec',
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 0),
                          Text(
                            'R\$ 97,99/ 3 meses',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Sora',
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          // Espaçamento antes do botão de continuar
          const SizedBox(height: 16),
          // Botão de continuar
          SizedBox(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(255, 200, 33, 1),
                minimumSize: const Size(350, 60),
                // side: const BorderSide(
                //   color: Color.fromRGBO(134, 189, 201, 1), // Cor da borda
                //   width: 2.0, // Largura da borda
                // ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      30), // Reduzindo o arredondamento para 8.0
                ),
                alignment: Alignment.center,
              ),
              child: const Text(
                'Continuar',
                style: TextStyle(fontFamily: 'Sora', color: Colors.black),
              ),
            ),
          ),
          // Outro botão abaixo do botão de continuar
          const SizedBox(height: 16),
          SizedBox(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Home(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(254, 250, 237, 1),
                minimumSize: const Size(300, 50),
                // side: const BorderSide(
                //   color: Color.fromRGBO(134, 189, 201, 1), // Cor da borda
                //   width: 2.0, // Largura da borda
                // ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      30), // Reduzindo o arredondamento para 8.0
                ),
                alignment: Alignment.center,
              ),
              child: const Text(
                'Não quero minha rotina especial',
                style: TextStyle(fontFamily: 'Sora', color: Colors.black),
              ),
            ),
          ),
          // Espaçamento antes do texto em negrito
          const SizedBox(height: 16),
          // Texto em negrito na parte inferior
          const SizedBox(
            width: 325,
            height: 65,
            child: Text(
              'Termos de serviço & política de privacidade NOTA: Cancele a assinatura pelo menos 24 horas antes do periodo de assinatura atual. Se você não tem certeza de como cancelar uma assinaturavisite nosso centro de ajuda.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                decoration:
                TextDecoration.underline, // Adiciona sublinhado ao texto
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSquareButton(BuildContext context, String text) {
    return Stack(
      children: [
        // Container de trás
        Container(
          width: 120,
          height: 150,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(183, 227, 236, 1),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        // Container da frente
        Positioned(
          top: 25, // Ajusta a posição verticalmente para que
          //o container da frente se sobreponha ao container de trás
          left: 5,
          bottom: 5, // Ajusta a posição horizontalmente para
          //que o container da frente se sobreponha ao container de trás
          child: Container(
            width: 110,
            height: 140,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(255, 255, 255, 1),
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.center,
          ),
        ),
      ],
    );
  }
}