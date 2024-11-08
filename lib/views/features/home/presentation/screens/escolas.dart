import 'package:e_mobi/pallete_colors.dart';
import 'package:e_mobi/views/features/home/presentation/screens/escola_detalhes.dart';
import 'package:e_mobi/views/features/parents/presentation/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Escolas extends StatelessWidget {
  const Escolas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PalleteColors.primaryColor,
      appBar: AppBar(
        backgroundColor: PalleteColors.primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const Center(
                child: Text(
                  "Escolas",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: PalleteColors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              EscolaCard(
                onPressed: () {
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
                nomeEscola: "Escola 1",
                imageSchool: "assets/images/escola1.jpeg",
              ),
              EscolaCard(
                nomeEscola: "Escola 2",
                imageSchool: "assets/images/escola2.jpeg",
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}

class EscolaCard extends StatelessWidget {
  const EscolaCard(
      {super.key,
      required this.nomeEscola,
      required this.onPressed,
      required this.imageSchool});
  final String nomeEscola;
  final VoidCallback onPressed;
  final String imageSchool;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: PalleteColors.white,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              imageSchool,
              width: 200,
            ),
            CustomText(
              text: nomeEscola,
              fontSize: 20,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
