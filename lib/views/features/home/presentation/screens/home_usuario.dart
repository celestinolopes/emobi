import 'package:e_mobi/pallete_colors.dart';
import 'package:e_mobi/views/features/home/presentation/screens/notificacoes.dart';
import 'package:e_mobi/views/features/home/presentation/screens/perfil_usuario.dart';
import 'package:e_mobi/views/features/home/presentation/screens/selecionar_motorista.dart';
import 'package:e_mobi/views/features/home/presentation/screens/trocar_motorista.dart';
import 'package:e_mobi/views/features/parents/presentation/screens/meus_alunos_responsavel.dart';
import 'package:e_mobi/views/features/parents/presentation/widgets/custom_text.dart';
import 'package:e_mobi/views/features/transportes/presentation/transportes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as map;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:toastification/toastification.dart';

class HomeUsuario extends StatelessWidget {
  const HomeUsuario({super.key, this.isVisitante = false});
  final _kGooglePlex = const CameraPosition(
      target: LatLng(-23.54693592897848, -46.68576382353099), zoom: 17.0);
  final bool isVisitante;
  bool checkIfUserIsLoged() {
    if (isVisitante) {
      toastification.show(
        title: const Text("Cadastre-se para poder usar o aplicativo"),
        style: ToastificationStyle.fillColored,
        autoCloseDuration: const Duration(seconds: 3),
        type: ToastificationType.error,
      );

      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PalleteColors.primaryColor,
      appBar: AppBar(
        backgroundColor: PalleteColors.primaryColor,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                if (!checkIfUserIsLoged()) {
                  return;
                }
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
                color: PalleteColors.white,
              ))
        ],
        title: Image.asset(
          "assets/images/logo_branco.png",
          width: 100,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            Container(
              height: 55,
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: PalleteColors.accentColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: isVisitante ? "Olá Visitante" : "Olá, Lucas",
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 40,
              width: 300,
              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
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
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomDashBoardButton(
                  onPressed: () {
                    if (!checkIfUserIsLoged()) {
                      return;
                    }
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (_) => const MeusFilhos(),
                      ),
                    );
                  },
                  assetIcon: "escolas.png",
                  title: "Alunos",
                ),
                CustomDashBoardButton(
                  onPressed: () {
                    if (!checkIfUserIsLoged()) {
                      return;
                    }
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
                    if (!checkIfUserIsLoged()) {
                      return;
                    }
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
                    if (!checkIfUserIsLoged()) {
                      return;
                    }
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (_) =>
                              const TrocarMotoristaScreen() // InformacaoDoMotorista(),
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
              height: 200,
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
            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    if (!checkIfUserIsLoged()) {
                      return;
                    }
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (_) => const SelecionarMotoristaChat(),
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
            Image.asset(
              "assets/images/banner2.jpg",
              width: double.infinity,
            ),
            const SizedBox(height: 25),
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
      overlayColor: WidgetStateProperty.all(Colors.transparent),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.white,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset(
                      "assets/images/$assetIcon",
                      width: 40,
                      height: 40,
                    ),
                  ),
                ],
              )),
          const SizedBox(height: 5),
          Center(
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 9.sp,
              ),
            ),
          )
        ],
      ),
    );
  }
}
