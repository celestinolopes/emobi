import 'package:e_mobi/views/features/drivers/presentation/screeens/embarque.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmbarqueMotorista extends StatelessWidget {
  const EmbarqueMotorista({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Text(
                  "Selecionar Aluno(a)".toUpperCase(),
                  style: const TextStyle(
                    fontSize: 18,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const SizedBox(height: 20),
              const CardAluno(),
              const CardAluno(),
              const CardAluno(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class CardAluno extends StatelessWidget {
  const CardAluno({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (_) => const Embarque(),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 5),
        height: 90,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.grey,
          ),
        ),
        child: const Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(
                "assets/images/crianca.jpg",
              ),
            ),
            SizedBox(width: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Teste Aluno",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text("Endereço de embarque")
              ],
            )
          ],
        ),
      ),
    );
  }
}
