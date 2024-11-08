import 'package:e_mobi/pallete_colors.dart';
import 'package:flutter/material.dart';

class NotificacoesAlunos extends StatelessWidget {
  const NotificacoesAlunos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: PalleteColors.primaryColor,
        title: Text(
          "Notificações".toUpperCase(),
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 22),
        child: SingleChildScrollView(
          child: Column(
            children: [
              NotificacoesAlunosCard(
                title: "Desembarque",
                isSuccess: true,
                nome: "Alice Martal",
                endereco: "Prof. Renato Jardim, 645",
              ),
              NotificacoesAlunosCard(
                title: "Ops! ... Problema com o veículo",
                isSuccess: false,
                nome: "Alice Martal",
                endereco: "Prof. Renato Jardim, 645",
              ),
              NotificacoesAlunosCard(
                title: "Biometria Validada",
                isSuccess: true,
                nome: "Alice Martal",
                endereco: "Prof. Renato Jardim, 645",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NotificacoesAlunosCard extends StatelessWidget {
  const NotificacoesAlunosCard({
    super.key,
    required this.isSuccess,
    required this.title,
    required this.endereco,
    required this.nome,
  });
  final String title;
  final String nome;
  final String endereco;
  final bool isSuccess;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 14),
      height: 100,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: PalleteColors.primaryColor,
          )),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          isSuccess
              ? const Icon(
                  Icons.check_circle_outline,
                  size: 50,
                  color: Colors.green,
                )
              : Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.red, width: 2)),
                  child: const Icon(
                    Icons.close,
                    color: Colors.red,
                    size: 40,
                  )),
          const SizedBox(width: 10),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),
                Text("Aluno: $nome"),
                Text("Local: $endereco")
              ],
            ),
          ),
        ],
      ),
    );
  }
}
