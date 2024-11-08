import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:e_mobi/pallete_colors.dart';
import 'package:e_mobi/views/features/childrens/presentation/screens/experiencia_motorista.dart';
import 'package:e_mobi/views/features/parents/presentation/widgets/custom_archive_button.dart';
import 'package:e_mobi/views/features/parents/presentation/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AvaliacaoMotorista extends StatelessWidget {
  const AvaliacaoMotorista({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PalleteColors.primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: PalleteColors.primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            Center(
              child: Text(
                "Avalie o\nmotorista".toUpperCase(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 100),
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Positioned(
                  child: Container(
                    width: double.infinity,
                    height: 400,
                    decoration: BoxDecoration(
                      color: PalleteColors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 80),
                        const Text("Lucas Lima Pereira"),
                        const SizedBox(height: 80),
                        const CustomText(
                          text: "Clique e avalie",
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                        const SizedBox(height: 10),
                        AnimatedRatingStars(
                          initialRating: 3.5,
                          minRating: 0.0,
                          maxRating: 5.0,
                          filledColor: Colors.amber,
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
                          starSize: 30.0,
                          animationDuration: const Duration(milliseconds: 300),
                          animationCurve: Curves.easeInOut,
                          readOnly: false,
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
            const SizedBox(height: 25),
            SizedBox(
              width: 200,
              child: CustomArchiveButton(
                text: "Continuar",
                centered: true,
                space: 10,
                assetIcon: "arrow.png",
                color: PalleteColors.accentColor,
                textAlign: TextAlign.center,
                onClick: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (_) => const ExperienciaMotorista(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
