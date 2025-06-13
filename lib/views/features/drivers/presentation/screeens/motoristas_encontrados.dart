import 'package:e_mobi/pallete_colors.dart';
import 'package:e_mobi/views/features/parents/presentation/screens/confirmar_motorista.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MotoristasEncontrados extends StatelessWidget {
  const MotoristasEncontrados({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Center(
              child: Text(
                "Selecionar Motorista".toUpperCase(),
                style: const TextStyle(
                  fontSize: 18,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w900,
                  color: PalleteColors.primaryColor,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const SizedBox(height: 10),
            const CardMotorista(
              nome: "João Fernando",
              setor: "Setor de viagem",
              total: "total de viagens",
            ),
          ],
        ),
      ),
    );
  }
}

class CardMotorista extends StatelessWidget {
  const CardMotorista({
    super.key,
    required this.nome,
    required this.setor,
    required this.total,
  });
  final String nome;
  final String setor;
  final String total;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (_) => const ConfirmarMotorista(),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 5),
        height: 100,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.grey,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(
                "assets/images/crianca.jpg",
              ),
            ),
            const SizedBox(width: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nome,
                  style: const TextStyle(
                    fontSize: 18,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(setor),
                const SizedBox(height: 1),
                Text(total),
              ],
            )
          ],
        ),
      ),
    );
  }
}
