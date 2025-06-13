import 'package:e_mobi/core/navigation/navigation_service.dart';
import 'package:e_mobi/pallete_colors.dart';
import 'package:e_mobi/views/features/home/presentation/screens/trocar_motorista.dart'
    show MotoristaModel;
import 'package:e_mobi/views/features/parents/presentation/screens/relatar_motivo_trocaMotorista.dart';
import 'package:e_mobi/views/features/parents/presentation/widgets/custom_text.dart';
import 'package:e_mobi/widgets/button_custom_widget.dart';
import 'package:flutter/material.dart';

class InformacaoDoMotorista extends StatelessWidget {
  final MotoristaModel motorista;
  const InformacaoDoMotorista({super.key, required this.motorista});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PalleteColors.primaryColor,
      appBar: AppBar(
        backgroundColor: PalleteColors.primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const Center(
              child: Text(
                "Informações do motorista",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: PalleteColors.white,
                ),
              ),
            ),
            const SizedBox(height: 50),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 80),
                              Center(
                                child: CustomText(
                                  text: motorista.nome,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 15),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    text: motorista.nome,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 2),
                              const CustomText(
                                text: "Cpf: 48** *** 1234",
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                              const SizedBox(height: 2),
                              CustomText(
                                text:
                                    "Data de nascimento: ${motorista.dataNascimento}",
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                              const SizedBox(height: 2),
                              const CustomText(
                                text: "Telefone: (16) 99191-0000}",
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                              const SizedBox(height: 2),
                              const CustomText(
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
                            backgroundImage:
                                AssetImage("assets/images/avatar.jpg"),
                            radius: 50,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  const Center(
                    child: Text(
                      "Informações do veículo",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 80),
                              Center(
                                child: CustomText(
                                  text: motorista.veiculoNome,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 15),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    text: "Ano do veículo",
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 2),
                              const CustomText(
                                text: "Número de lugares: 4}",
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                              const SizedBox(height: 2),
                              const CustomText(
                                text: "Matricula: FG-FK-32",
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                              const SizedBox(height: 2),
                              const CustomText(
                                text: "Marca  Mecedes",
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                              const SizedBox(height: 2),
                              const CustomText(
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
                            backgroundImage:
                                AssetImage("assets/images/vam.jpeg"),
                            radius: 50,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: SizedBox(
                width: 200,
                child: ButtonCustom(
                  IsEnabled: true,
                  icon: Icons.arrow_back,
                  backgroundColor: PalleteColors.green,
                  textColor: Colors.white,
                  mainAxisAlignment: MainAxisAlignment.center,
                  fontWeight: FontWeight.w900,
                  size: const Size(40, 30),
                  height: 40,
                  onPressed: () async {
                    Navigator.of(context).pop();
                  },
                  text: "Voltar",
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: SizedBox(
                width: 200,
                child: ButtonCustom(
                  IsEnabled: true,
                  fontSize: 10,
                  icon: Icons.autorenew, // Ícone de reciclagem ou setas girando
                  backgroundColor: Colors.red, // Cor vermelha
                  textColor: Colors.white,
                  mainAxisAlignment: MainAxisAlignment.center,
                  fontWeight: FontWeight.w900,
                  size: const Size(40, 30),
                  height: 50,
                  onPressed: () async {
                    Navigator.of(context).pop();

                    NavigationService.push(
                      context: context,
                      page: RelatarMotivoTrocaMotorista(),
                    );
                  },
                  text: "Trocar\n motorista",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
