import 'package:e_mobi/pallete_colors.dart';
import 'package:e_mobi/views/features/drivers/presentation/screeens/aceitar_motorista.dart';
import 'package:e_mobi/views/features/drivers/presentation/screeens/recusar_motorista.dart';
import 'package:e_mobi/widgets/button_custom_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NovaViagemMotorista extends StatelessWidget {
  const NovaViagemMotorista({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PalleteColors.primaryColor,
      appBar: AppBar(
        backgroundColor: PalleteColors.primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Text(
                  "Nova Viagem".toUpperCase(),
                  style: const TextStyle(
                    fontSize: 18,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Image.asset("assets/images/map.png"),
              const SizedBox(height: 20),
              Container(
                height: 350,
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        "R\$ 40,34 ".toUpperCase(),
                        style: const TextStyle(
                          fontSize: 25,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(
                            "assets/images/crianca.jpg",
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Maria Fernandes Montenegro",
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/logo_splash.png",
                              width: 50,
                            ),
                            Container(
                              color: PalleteColors.primaryColor,
                              width: 2,
                              height: 100,
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 3),
                              padding: const EdgeInsets.all(4),
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                color: PalleteColors.primaryColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Container(
                                width: 4,
                                height: 4,
                                decoration: BoxDecoration(
                                  color: PalleteColors.accentColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            )
                          ],
                        ),
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Tempo de embarque (distancia)"),
                                Text("Endereço de embarque"),
                                Text("Cidade"),
                              ],
                            ),
                            SizedBox(height: 20),
                            Text("Tempo de corrida (Km)"),
                            SizedBox(height: 30),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Destino final"),
                                Text("Estado Cidade"),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 150,
                      child: ButtonCustom(
                        icon: Icons.close,
                        backgroundColor: Colors.red,
                        height: 30,
                        fontSize: 11,
                        textColor: Colors.white,
                        marginLeftIcon: 0,
                        onPressed: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (_) => const RelatarProblema(),
                            ),
                          );
                        },
                        text: "Recusar".toUpperCase(),
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      child: ButtonCustom(
                        icon: Icons.check,
                        backgroundColor: PalleteColors.green,
                        height: 30,
                        fontSize: 11,
                        textColor: Colors.white,
                        marginLeftIcon: 0,
                        onPressed: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (_) => const AceitarMotorista(),
                            ),
                          );
                        },
                        text: "Aceitar".toUpperCase(),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 14),
      height: 100,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey,
          )),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            "assets/images/info_green.png",
            width: 50,
          ),
          const SizedBox(width: 10),
          const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Tema da notificação",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4),
                Text("Mensagem curta da notificação")
              ],
            ),
          ),
          const SizedBox(width: 10),
          const Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Há 10 minutos",
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
