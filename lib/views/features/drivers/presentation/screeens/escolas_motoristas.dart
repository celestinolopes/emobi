import 'package:e_mobi/pallete_colors.dart';
import 'package:flutter/material.dart';

class Escola {
  final String imageUrl;
  final String nome;
  final String horario;

  Escola({required this.imageUrl, required this.nome, required this.horario});
}

class EscolasMotoristas extends StatelessWidget {
  EscolasMotoristas({super.key});
  final List<Escola> _escolas = [
    Escola(
      imageUrl: "assets/images/escola.png",
      nome: "Escola Santo Antonio",
      horario: "7:00 am - 5:00 pm",
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Center(
              child: Text(
                "Escolas".toUpperCase(),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: PalleteColors.primaryColor,
                ),
              ),
            ),
            const SizedBox(height: 50),
            const SchoolCard(
              imageUrl: "assets/images/escola1.jpeg",
              nome: "ESCOLA 001",
              horario: "7:00 am - 5:00 pm",
              endereco: "Endereco xpto ",
            ),
            const SchoolCard(
              imageUrl: "assets/images/escola2.jpeg",
              nome: "ESCOLA 002",
              horario: "7:00 am - 5:00 pm",
              endereco: "Endereco xpto ",
            )
          ],
        ),
      ),
    );
  }
}

class SchoolCard extends StatelessWidget {
  final String imageUrl;
  final String nome;
  final String horario;
  final String endereco;
  const SchoolCard({
    super.key,
    required this.imageUrl,
    required this.nome,
    required this.horario,
    required this.endereco,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          border: Border.all(
            color: Colors.black,
          )),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage(imageUrl),
          ),
          const SizedBox(width: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nome.toUpperCase(),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: PalleteColors.primaryColor,
                ),
              ),
              const SizedBox(height: 4),
              Text(endereco),
              const SizedBox(height: 2),
              Text(
                horario,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  color: PalleteColors.primaryColor,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
