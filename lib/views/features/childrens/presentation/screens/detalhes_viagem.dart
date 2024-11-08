import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:e_mobi/pallete_colors.dart';
import 'package:e_mobi/views/features/childrens/presentation/screens/avaliacao_motorista.dart';
import 'package:e_mobi/views/features/parents/presentation/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetalhesViagem extends StatelessWidget {
  const DetalhesViagem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
            child: Text(
              "Detalhes da viagem".toUpperCase(),
              style: const TextStyle(
                fontSize: 18,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w900,
                color: PalleteColors.primaryColor,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Image.asset(
            "assets/images/mapa.png",
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 200,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      width: 1,
                      color: Colors.black,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 5),
                                const CustomText(
                                  text: "12/12/2022 12:00",
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                ),
                                const SizedBox(height: 2),
                                CustomText(
                                  text: "Veiculo de transporte".toUpperCase(),
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ],
                            ),
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 5),
                              CustomText(
                                text: "R\$ 100,00",
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                              ),
                              SizedBox(height: 2),
                              CustomText(
                                text: "• Destino da Escola\n Sao Paulo - SP",
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const CustomText(
                        text: "• Endereço de Embarque\n Sao Paulo - SP",
                        fontSize: 12,
                        color: Colors.black,
                      ),
                      const SizedBox(height: 10),
                      const CustomText(
                        text: "• Destino da Escola\n Sao Paulo - SP",
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  height: 90,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      width: 1,
                      color: Colors.black,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/images/crianca.jpg"),
                        radius: 20,
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomText(
                            text: "Motorista",
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                          const SizedBox(height: 4),
                          const Text("Lucas Lima Pereira"),
                          AnimatedRatingStars(
                            initialRating: 5,
                            minRating: 0.0,
                            maxRating: 5.0,
                            filledColor: Colors.black,
                            emptyColor: Colors.grey,
                            filledIcon: Icons.star,
                            halfFilledIcon: Icons.star_half,
                            emptyIcon: Icons.star_border,
                            onChanged: (double rating) {
                              // Handle the rating change here
                              print('Rating: $rating');
                            },
                            displayRatingValue: true,
                            interactiveTooltips: true,
                            customFilledIcon: Icons.star,
                            customHalfFilledIcon: Icons.star_half,
                            customEmptyIcon: Icons.star_border,
                            starSize: 8.0,
                            animationDuration:
                                const Duration(milliseconds: 300),
                            animationCurve: Curves.easeInOut,
                            readOnly: false,
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                InkWell(
                    onTap: () {
                      Navigator.push(context, CupertinoPageRoute(builder: (_) {
                        return const AvaliacaoMotorista();
                      }));
                    },
                    child: const CardAvalicaoMotorista()),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CardAvalicaoMotorista extends StatelessWidget {
  const CardAvalicaoMotorista({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          width: 1,
          color: Colors.black,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset("assets/images/caneta.png"),
          const SizedBox(width: 10),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: "Deixe uma avaliação\npara o motorista",
                fontSize: 12,
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
              SizedBox(height: 4),
              CustomText(
                text:
                    "Seu feedback é muito importante para \naprimorar os nossos serviços",
                fontSize: 11,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ],
          )
        ],
      ),
    );
  }
}
