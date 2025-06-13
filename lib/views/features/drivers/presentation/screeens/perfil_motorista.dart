import 'package:e_mobi/pallete_colors.dart';
import 'package:e_mobi/views/features/drivers/presentation/screeens/informacoes_juridicas.dart';
import 'package:e_mobi/views/features/drivers/presentation/screeens/minha_turma.dart';
import 'package:e_mobi/views/features/parents/presentation/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'minhas_viagens_motorista.dart';

class PerfilDoMotorista extends StatelessWidget {
  const PerfilDoMotorista({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PalleteColors.primaryColor,
      appBar: AppBar(
        backgroundColor: PalleteColors.primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: ListView(
          children: [
            const Center(
              child: Text(
                "MEU PERFIL",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: PalleteColors.white,
                ),
              ),
            ),
            const SizedBox(height: 70),
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Positioned(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    height: 270,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 80),
                        Center(
                          child: CustomText(
                            text: "Marcos de Souza Filho",
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: "marcos@gmail.com",
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ],
                        ),
                        SizedBox(height: 2),
                        CustomText(
                          text: "Cpf: 48*****4",
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                        SizedBox(height: 2),
                        CustomText(
                          text: "Data de nascimento: 29/02/1992",
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                        SizedBox(height: 2),
                        CustomText(
                          text: "Telefone: (16) 99191-0000",
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                        SizedBox(height: 2),
                        CustomText(
                          text: "Responsável por: Breno Silva",
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: -40,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const CircleAvatar(
                      backgroundImage: AssetImage("assets/images/avatar.jpg"),
                      radius: 50,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            CustomButton(
              onClick: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const MinhasViagensMotorista(),
                  ),
                );
              },
              label: "Minhas Viagens",
              imagUrl: "assets/images/viagens_white.png",
            ),
            CustomButton(
              onClick: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const MinhaTurma(),
                  ),
                );
              },
              label: "Crianças",
              imagUrl: "assets/images/criancas.png",
            ),
            CustomButton(
              onClick: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const InformacoesJuridicas(),
                  ),
                );
              },
              label: "Informações",
              imagUrl: "assets/images/informacoes.png",
            ),
            CustomButton(
              onClick: () {},
              label: "Biometria Facial",
              imagUrl: "assets/images/biometria_white.png",
            ),
            /* const Center(
              child: Text(
                "Informações do veículo",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: PalleteColors.white,
                ),
              ),
            ),
            const SizedBox(height: 50),
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Positioned(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    height: 270,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 80),
                        Center(
                          child: CustomText(
                            text: "Mercedes-Benz Sprinter",
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: "Ano do veículo",
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ],
                        ),
                        SizedBox(height: 2),
                        CustomText(
                          text: "Número de lugares: 4",
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                        SizedBox(height: 2),
                        CustomText(
                          text: "Matricula: FG-FK-34",
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                        SizedBox(height: 2),
                        CustomText(
                          text: "Marca: Mercedes",
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                        SizedBox(height: 2),
                        CustomText(
                          text: "Modelo: Sprinter",
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: -40,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const CircleAvatar(
                      backgroundImage: AssetImage("assets/images/vam.jpeg"),
                      radius: 50,
                    ),
                  ),
                ),
              ],
            ),
           */
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.imagUrl,
    required this.label,
    required this.onClick,
  });
  final VoidCallback onClick;
  final String label;
  final String imagUrl;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        height: 50,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label.toUpperCase(),
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
            Image.asset(
              imagUrl,
              width: 40,
            )
          ],
        ),
      ),
    );
  }
}
