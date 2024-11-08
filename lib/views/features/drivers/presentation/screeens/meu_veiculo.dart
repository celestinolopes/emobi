import 'package:e_mobi/pallete_colors.dart';
import 'package:e_mobi/views/features/parents/presentation/widgets/custom_archive_button.dart';
import 'package:e_mobi/views/features/parents/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:galleryimage/galleryimage.dart';

class MeuVeiculo extends StatelessWidget {
  const MeuVeiculo({super.key});

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
        child: Column(
          children: [
            Center(
              child: Text(
                "Veículo".toUpperCase(),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: PalleteColors.white,
                ),
              ),
            ),
            const SizedBox(height: 90),
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Positioned(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    height: 210,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 60),
                        Center(
                          child: CustomText(
                            text: "Modelo do veiculo",
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CustomText(
                              text: "Situação atual:",
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                            SizedBox(width: 10),
                            CustomText(
                              text: "Regular",
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: Colors.green,
                            ),
                          ],
                        ),
                        SizedBox(height: 2),
                        CustomText(
                          text: "Ano de fabricação: 2010",
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                        SizedBox(height: 2),
                        CustomText(
                          text: "Lugares: 12",
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                        SizedBox(height: 2),
                        CustomText(
                          text: "Modelo: Unitário",
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                        SizedBox(height: 2),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: -60,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://revistacarro.com.br/wp-content/uploads/2023/08/Fiat-980x551.jpg"),
                      radius: 50,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GalleryImage(
                    imageUrls: const [
                      "https://revistacarro.com.br/wp-content/uploads/2023/08/Fiat-980x551.jpg",
                      "https://revistacarro.com.br/wp-content/uploads/2023/08/Fiat4-980x551.jpg",
                      "https://revistacarro.com.br/wp-content/uploads/2023/08/Fiat2-980x551.jpg",
                      "https://s2-autoesporte.glbimg.com/dpQ9vMMD_9jbUPeK-pIoA0nZ0Pk=/0x0:1400x788/888x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_cf9d035bf26b4646b105bd958f32089d/internal_photos/bs/2024/0/u/8GcVyeR7SUfGRswq6jsA/fiat-toro-endurance-.jpg",
                      "https://transpodata.com.br/wp-content/uploads/2023/12/15-747x420.png",
                      "https://transpodata.com.br/wp-content/uploads/2023/12/18.png"
                    ],
                    numOfShowImages: 6,
                    titleGallery: "Imagens do veiculo",
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 60,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CustomText(
                        text: "DOCUMENTO:",
                        fontSize: 13,
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                      ),
                      SizedBox(width: 10),
                      CustomText(
                        text: "OK",
                        fontSize: 13,
                        fontWeight: FontWeight.w900,
                        color: Colors.green,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            SizedBox(
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
          ],
        ),
      ),
    );
  }
}
