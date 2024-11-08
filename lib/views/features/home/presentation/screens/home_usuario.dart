import 'package:e_mobi/pallete_colors.dart';
import 'package:e_mobi/views/features/childrens/presentation/screens/gerenciar_alunos.dart';
import 'package:e_mobi/views/features/childrens/presentation/screens/informe_motorista.dart';
import 'package:e_mobi/views/features/drivers/presentation/screeens/perfil_motorista.dart';
import 'package:e_mobi/views/features/home/presentation/screens/notificacoes.dart';
import 'package:e_mobi/views/features/home/presentation/screens/perfil_usuario.dart';
import 'package:e_mobi/views/features/parents/presentation/widgets/custom_text.dart';
import 'package:e_mobi/views/features/transportes/presentation/transportes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as map;
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeUsuario extends StatelessWidget {
  const HomeUsuario({super.key});
  final _kGooglePlex = const CameraPosition(
      target: LatLng(-23.54693592897848, -46.68576382353099), zoom: 17.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PalleteColors.primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            const SizedBox(height: 80),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                const CustomText(
                  text: "Mobi",
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (_) => const PerfilDoUsuario(),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.account_circle,
                        size: 40,
                        color: Colors.white,
                      )),
                )
              ],
            ),
            const SizedBox(height: 25),
            Container(
              height: 55,
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: PalleteColors.accentColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: "Olá, Lucas",
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            const SizedBox(height: 25),
            Flexible(
              child: Container(
                height: 40,
                width: 300,
                padding:
                    const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: CustomText(
                        text: "Status",
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: PalleteColors.primaryColor,
                      ),
                    ),
                    Flexible(
                      child: CustomText(
                        text: "No Transito",
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Colors.green,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomDashBoardButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (_) => const GerenciarAlunos(),
                      ),
                    );
                  },
                  assetIcon: "escolas.png",
                  title: "Alunos",
                ),
                CustomDashBoardButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (_) => const Transportes(),
                      ),
                    );
                  },
                  assetIcon: "transport.png",
                  title: "Transportes",
                ),
                CustomDashBoardButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (_) => const NotificacoesHome(),
                      ),
                    );
                  },
                  assetIcon: "notificacoes.png",
                  title: "Notificações",
                ),
                CustomDashBoardButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (_) => const PerfilDoMotorista(),
                      ),
                    );
                  },
                  assetIcon: "escolas.png",
                  title: "Info Motoristas",
                ),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              height: 300,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(0),
              ),
              child: GoogleMap(
                minMaxZoomPreference: const map.MinMaxZoomPreference(15, 16),
                zoomGesturesEnabled: true,
                onCameraMove: (position) {},
                initialCameraPosition: _kGooglePlex,
                onMapCreated: (GoogleMapController controller) {},
              ),
            ),
            const SizedBox(height: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (_) => const InformeAoMotorista(),
                      ),
                    );
                  },
                  child: Container(
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.white,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/location.png",
                            width: 40,
                            height: 40,
                          ),
                          const SizedBox(width: 5),
                          const Center(
                            child: Text(
                              "Informe o motorista",
                              style: TextStyle(
                                color: PalleteColors.primaryColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 15,
                              ),
                            ),
                          )
                        ],
                      )),
                ),
                const SizedBox(height: 5),
                Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.white,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/location.png",
                          width: 40,
                          height: 40,
                        ),
                        const SizedBox(width: 5),
                        const Center(
                          child: Text(
                            "Trajetos",
                            style: TextStyle(
                              color: PalleteColors.primaryColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                            ),
                          ),
                        )
                      ],
                    )),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class CustomDashBoardButton extends StatelessWidget {
  const CustomDashBoardButton(
      {super.key,
      required this.assetIcon,
      required this.onPressed,
      required this.title});

  final String assetIcon;
  final VoidCallback onPressed;

  final String title;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.white,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/$assetIcon",
                    width: 50,
                    height: 50,
                  ),
                ],
              )),
          const SizedBox(height: 5),
          Center(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ],
      ),
    );
  }
}
