import 'package:e_mobi/pallete_colors.dart';
import 'package:e_mobi/views/features/parents/presentation/widgets/custom_archive_button.dart';
import 'package:e_mobi/views/features/parents/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';

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
      body: ListView(
        children: [
          const Center(
            child: Text(
              "António Cesário",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
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
                  height: MediaQuery.of(context).size.height - 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 80),
                      Center(
                        child: Image.asset(
                          "assets/images/logo.png",
                          width: 70,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.all(50),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.black,
                            )),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  text: "Telefone",
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                                CustomText(
                                  text: "Editar",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                            SizedBox(height: 2),
                            CustomText(
                              text: "Endereço",
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                            SizedBox(height: 2),
                            CustomText(
                              text: "CEP",
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                            SizedBox(height: 20),
                            CustomText(
                              text: "Data de nascimento",
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                            SizedBox(height: 2),
                            CustomText(
                              text: "CPF",
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                            SizedBox(height: 2),
                            CustomText(
                              text: "RG",
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 100),
                      Center(
                        child: SizedBox(
                          width: 200,
                          child: CustomArchiveButton(
                            text: "Salvar",
                            centered: true,
                            space: 10,
                            assetIcon: "",
                            showIcon: false,
                            color: PalleteColors.accentColor,
                            textAlign: TextAlign.center,
                            onClick: () {},
                          ),
                        ),
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
                    backgroundImage: AssetImage("assets/images/crianca.jpg"),
                    radius: 50,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
