import 'package:e_mobi/pallete_colors.dart';
import 'package:e_mobi/views/features/drivers/presentation/screeens/alunos_motorista.dart';
import 'package:e_mobi/views/features/drivers/presentation/screeens/desembarque_motorista.dart';
import 'package:e_mobi/views/features/drivers/presentation/screeens/embarque_motorista.dart';
import 'package:e_mobi/views/features/drivers/presentation/screeens/escolas_motoristas.dart';
import 'package:e_mobi/views/features/drivers/presentation/screeens/informe_pais.dart';
import 'package:e_mobi/views/features/drivers/presentation/screeens/meu_veiculo.dart';
import 'package:e_mobi/views/features/drivers/presentation/screeens/perfil_motorista.dart';
import 'package:e_mobi/views/features/drivers/presentation/screeens/trajetos.dart';
import 'package:e_mobi/views/features/parents/presentation/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as map;
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'notificacoes_motorista.dart';

class HomeMotorista extends StatelessWidget {
  const HomeMotorista({super.key});
  final _kGooglePlex = const CameraPosition(
      target: LatLng(-23.54693592897848, -46.68576382353099), zoom: 17.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (_) => const PerfilDoMotorista(),
                  ),
                );
              },
              icon: const Icon(
                Icons.account_circle,
                size: 40,
                color: PalleteColors.primaryColor,
              ))
        ],
        title: Image.asset(
          "assets/images/logo.png",
          width: 100,
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 15),
          Flexible(
            child: Container(
              height: 40,
              width: 320,
              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
              decoration: BoxDecoration(
                color: PalleteColors.primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: CustomText(
                      text: "Situação atual",
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  Flexible(
                    child: CustomText(
                      text: "Pendente",
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 45),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomDashBoardButton(
                  isDark: true,
                  onPressed: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (_) => const MeuVeiculo(),
                      ),
                    );
                  },
                  assetIcon: "veiculo.png",
                  title: "Meu Veículo",
                ),
                CustomDashBoardButton(
                  isDark: true,
                  onPressed: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (_) => const AlunosMotorista(),
                      ),
                    );
                  },
                  assetIcon: "alunos.png",
                  title: "Alunos",
                ),
                CustomDashBoardButton(
                  isDark: true,
                  onPressed: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (_) => const NotificacoesMotorista(),
                      ),
                    );
                  },
                  assetIcon: "notification.png",
                  title: "Notificações",
                ),
                CustomDashBoardButton(
                  isDark: true,
                  onPressed: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (_) => EscolasMotoristas(),
                      ),
                    );
                  },
                  assetIcon: "escola00.png",
                  title: "Escolas",
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 410,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(0),
                ),
                child: GoogleMap(
                  minMaxZoomPreference: const map.MinMaxZoomPreference(15, 16),
                  zoomGesturesEnabled: true,
                  compassEnabled: false,
                  trafficEnabled: true,
                  myLocationButtonEnabled: false,
                  onCameraMove: (position) {},
                  initialCameraPosition: _kGooglePlex,
                  onMapCreated: (GoogleMapController controller) {},
                ),
              ),
              Positioned(
                bottom: -30,
                left: 80,
                child: Container(
                  width: 95,
                  height: 95,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2F8820),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (_) => const EmbarqueMotorista(),
                        ),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 5),
                        const Text(
                          "Embarque",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 10,
                          ),
                        ),
                        Image.asset(
                          "assets/images/embarque.png",
                          width: 35,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: -30,
                right: 80,
                child: Container(
                  width: 95,
                  height: 95,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: const Color(0xFFC7391D),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (_) => const DesembarqueMotorista(),
                        ),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 5),
                        const Text(
                          "Desembarque",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 10,
                          ),
                        ),
                        Image.asset(
                          "assets/images/desembarque.png",
                          width: 50,
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (_) => const InformeAoPais(),
                      ),
                    );
                  },
                  child: Container(
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(
                        color: PalleteColors.primaryColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.white,
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              "Informe aos pais",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 15,
                              ),
                            ),
                          )
                        ],
                      )),
                ),
                const SizedBox(height: 5),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (_) => const Trajetos(),
                      ),
                    );
                  },
                  child: Container(
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(
                        color: PalleteColors.primaryColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.white,
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              "Trajetos",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 15,
                              ),
                            ),
                          )
                        ],
                      )),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

class CustomDashBoardButton extends StatelessWidget {
  const CustomDashBoardButton(
      {super.key,
      required this.assetIcon,
      this.isDark = false,
      required this.onPressed,
      required this.title});

  final String assetIcon;
  final bool isDark;
  final VoidCallback onPressed;

  final String title;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      overlayColor: WidgetStateProperty.all(Colors.transparent),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: isDark ? PalleteColors.primaryColor : Colors.white,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/$assetIcon",
                    width: 40,
                    height: 40,
                  ),
                ],
              )),
          const SizedBox(height: 5),
          Center(
            child: Text(
              title,
              style: TextStyle(
                color: isDark ? PalleteColors.primaryColor : Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ),
          )
        ],
      ),
    );
  }
}
