import 'dart:convert';

import 'package:e_mobi/core/const/const.dart';
import 'package:e_mobi/pallete_colors.dart';
import 'package:e_mobi/views/features/drivers/data/models/escolas.dart';
import 'package:e_mobi/views/features/home/presentation/screens/escola_detalhes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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

  Future<EscolasModel> getEscolas() async {
    http.Client client = http.Client();
    // Simulate a network call
    final result = await client.post(
        Uri.parse("$baseDevUrl/api/getMinhasEscolasByMotorista"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(
          {
            "Token": TOKEN,
            "User": 19,
          },
        ));

    return Future.value(escolasModelFromJson(result.body));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: FutureBuilder<EscolasModel>(
            future: getEscolas(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text("Erro ao carregar escolas: ${snapshot.error}"),
                );
              }
              if (!snapshot.hasData || snapshot.data == null) {
                return const Center(
                  child: Text("Nenhuma escola encontrada."),
                );
              }
              if (snapshot.data!.ok == false) {
                return const Center(
                  child: Text("Nenhuma escola encontrada."),
                );
              }
              if (snapshot.data!.alunos.isNotEmpty) {
                return ListView.builder(
                  itemCount: snapshot.data!.alunos.length,
                  itemBuilder: (context, index) {
                    return SchoolCard(
                      imageUrl: "assets/images/escola1.jpeg",
                      nome: snapshot.data!.alunos[index].escola,
                      horario: "7:00 am - 5:00 pm",
                      endereco: "Rua das Flores, 123",
                    );
                  },
                );
              }
              return const Center(
                child: Text("Nenhuma escola encontrada."),
              );
            }),
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
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (_) => const EscolaDetalhes(
              detalhesEscola: "Escola 1",
              imageEscola: "assets/images/escola1.jpeg",
            ),
          ),
        );
      },
      child: Container(
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
      ),
    );
  }
}
