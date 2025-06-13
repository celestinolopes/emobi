import 'package:e_mobi/views/features/drivers/presentation/screeens/nova_viagem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificacoesMotorista extends StatelessWidget {
  const NotificacoesMotorista({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Text(
                  "Novas notificações".toUpperCase(),
                  style: const TextStyle(
                    fontSize: 18,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const NotificationCard(),
              const NotificationCard(),
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
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (_) => const NovaViagemMotorista(),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.grey,
            )),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 14),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Tema da notificaçãoe",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text("Mensagem curta da notificação")
                  ],
                ),
              ),
            ),
            const SizedBox(width: 4),
            Container(
              height: 100,
              width: 1,
              color: Colors.grey,
              margin: const EdgeInsets.symmetric(horizontal: 2),
            ),
            const CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(
                "assets/images/crianca.jpg",
              ),
            ),
            const SizedBox(width: 5),
            const Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Julia Arantes",
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "Escola xpto",
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
