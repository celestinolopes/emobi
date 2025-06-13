import 'dart:convert';

import 'package:e_mobi/core/const/const.dart';
import 'package:e_mobi/pallete_colors.dart';
import 'package:e_mobi/views/features/drivers/data/models/chat_model.dart';
import 'package:e_mobi/views/features/parents/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class InformeAoPais extends StatefulWidget {
  const InformeAoPais({super.key});

  @override
  State<InformeAoPais> createState() => _InformeAoPaisState();
}

class _InformeAoPaisState extends State<InformeAoPais> {
  final TextEditingController _messageController = TextEditingController();
  bool _isSending = false; // Estado de carregamento

  Future<List<ChatModel>> getChatTotal() async {
    http.Client client = http.Client();
    // Simulate a network call
    final result = await client.post(Uri.parse("$baseDevUrl/api/getChatTotal"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(
          {
            "Token": TOKEN,
            "User": 19,
            "Tipo": 6,
          },
        ));

    return Future.value(chatModelFromJson(result.body));
  }

  Future<bool> sendMessage({String? idUser, String? message}) async {
    setState(() {
      _isSending = true; // Ativar o estado de carregamento
    });

    http.Client client = http.Client();
    try {
      final result =
          await client.post(Uri.parse("$baseDevUrl/api/enviaMensagemChat"),
              headers: {"Content-Type": "application/json"},
              body: jsonEncode(
                {
                  "Token": TOKEN,
                  "User": idUser,
                  "Mensagem": message,
                  "Tipo": 6,
                },
              ));
      print(result.body);
      return Future.value(true);
    } finally {
      setState(() {
        _isSending = false; // Desativar o estado de carregamento
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: FutureBuilder<List<ChatModel>>(
            future: getChatTotal(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Text("Error: ${snapshot.error}");
              }
              if (snapshot.hasData) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          Center(
                            child: Text(
                              "Informe ao responsável".toUpperCase(),
                              style: const TextStyle(
                                fontSize: 18,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w900,
                                color: PalleteColors.primaryColor,
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                        ],
                      ),
                    ),
                    const CardChatResponsavel(
                      message: "",
                      image: "assets/images/crianca.jpg",
                      nome: "Lucas Lima Pereira",
                    ),
                    const SizedBox(height: 20),
                    Flexible(
                      child: ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (ctx, index) {
                            return MessageCard(
                              isMyMessage: snapshot.data![index].envio,
                              message: snapshot.data![index].mensagem,
                            );
                          }),
                    )
                  ],
                );
              }
              return const SizedBox();
            }),
      ),
      bottomNavigationBar: Container(
        height: 120,
        decoration: BoxDecoration(
          border: BorderDirectional(
              top: BorderSide(
            width: 1,
            color: Colors.black.withOpacity(0.4),
          )),
        ),
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.attach_file,
                color: Colors.black,
              ),
            ),
            Expanded(
                child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: Colors.grey.shade400,
                  )),
              child: TextField(
                controller: _messageController,
                style: const TextStyle(
                  color: Colors.black,
                ),
                cursorColor: Colors.black,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Digite uma mensagem",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    )),
              ),
            )),
            IconButton(
              onPressed: _isSending
                  ? null // Desativar o botão enquanto está enviando
                  : () async {
                      if (_messageController.text.isNotEmpty) {
                        await sendMessage(
                          idUser: "19",
                          message: _messageController.text,
                        );
                        _messageController.clear(); // Limpar o campo de texto
                      }
                    },
              icon: _isSending
                  ? const CircularProgressIndicator() // Exibir indicador de carregamento
                  : const Icon(
                      Icons.send_outlined,
                      color: Colors.black,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardChatResponsavel extends StatelessWidget {
  const CardChatResponsavel({
    super.key,
    required this.image,
    required this.nome,
    required this.message,
  });
  final String image;
  final String nome;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
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
          Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(50),
            ),
            child: const CircleAvatar(
              backgroundImage: AssetImage("assets/images/crianca.jpg"),
              radius: 20,
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                text: "Responsável",
                fontSize: 12,
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w700,
              ),
              const CustomText(
                text: "Lucas Lima Pereira",
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class MessageCard extends StatelessWidget {
  const MessageCard(
      {super.key, required this.isMyMessage, required this.message});
  final bool isMyMessage;
  final String message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMyMessage ? Alignment.topRight : Alignment.topLeft,
      child: Container(
        width: 300,
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          border:
              isMyMessage ? const Border() : Border.all(color: Colors.black),
          color: isMyMessage ? PalleteColors.primaryColor : PalleteColors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                message,
                style: TextStyle(
                  color: isMyMessage ? Colors.white : Colors.black,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Text(
                "10:41",
                style: TextStyle(
                  color: Colors.grey.shade800,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
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
      ),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            Icons.check_circle_outline,
            size: 50,
            color: Colors.green,
          ),
          SizedBox(width: 10),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Escola/Casa",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 6),
                Text("Aluno: Alice Artal"),
                Text("Local: Prof. Renato Jardim, 645")
              ],
            ),
          ),
          SizedBox(width: 10),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Data: 12/12/2020",
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),
                Text(
                  "14:23",
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
