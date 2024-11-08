import 'package:e_mobi/pallete_colors.dart';
import 'package:flutter/material.dart';

class EscolaDetalhes extends StatelessWidget {
  final String imageEscola;
  final String detalhesEscola;
  const EscolaDetalhes(
      {super.key, required this.imageEscola, required this.detalhesEscola});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PalleteColors.primaryColor,
      appBar: AppBar(
        backgroundColor: PalleteColors.primaryColor,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: Text(
              "Escola".toUpperCase(),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: PalleteColors.white,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Image.asset(imageEscola),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              height: 240,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.white,
                    width: 1,
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "ESCOLA JESUS GUILHERME CIACOMINI".toUpperCase(),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: PalleteColors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "ENDEREÇO: RUA DA ESCOLA".toUpperCase(),
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: PalleteColors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "BAIRRO: BAIRRO XPTO".toUpperCase(),
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: PalleteColors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "HORÁRIO DE FUNCIONAMENTO: 10:00 ÀS 18:0O".toUpperCase(),
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: PalleteColors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "RESPONSÁVEL: DIRETOR".toUpperCase(),
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: PalleteColors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 60,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.white,
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Alterar escola".toUpperCase(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: PalleteColors.white,
                    ),
                  ),
                  const Icon(
                    Icons.edit,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
