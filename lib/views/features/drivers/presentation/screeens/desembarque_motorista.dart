import 'package:e_mobi/core/di/di_container.dart';
import 'package:e_mobi/views/features/drivers/presentation/screeens/desembarque.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../blocs/bloc/desembarque_bloc.dart';

class DesembarqueMotorista extends StatefulWidget {
  const DesembarqueMotorista({super.key});

  @override
  State<DesembarqueMotorista> createState() => _DesembarqueMotoristaState();
}

class _DesembarqueMotoristaState extends State<DesembarqueMotorista> {
  @override
  void initState() {
    getIt<DesembarqueBloc>().add(GetDesembarqueEvent(idMotorista: 19));
    super.initState();
  }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DesembarqueBloc, DesembarqueState>(
      listener: (context, state) {
        if (state is DesembarqueLoading) {
          isLoading = true;
        }
        if (state is DesembarqueSuccess) {
          isLoading = false;
        }
        if (state is DesemmbarqueErrorEror) {
          isLoading = false;
        }
      },
      bloc: getIt<DesembarqueBloc>(),
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              iconTheme: const IconThemeData(),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        "Selecionar Aluno(a)".toUpperCase(),
                        style: const TextStyle(
                          fontSize: 18,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    if (state is DesembarqueSuccess)
                      SizedBox(
                        height: 500,
                        child: ListView.builder(
                            itemCount: state.data.length,
                            itemBuilder: (ctx, index) {
                              final aluno = state.data[index];
                              return CardAluno(
                                nome: aluno.nome!,
                              );
                            }),
                      ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class CardAluno extends StatelessWidget {
  const CardAluno({super.key, required this.nome});
  final String nome;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (_) => const Desembarque(),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 5),
        height: 90,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.grey,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(
                "assets/images/crianca.jpg",
              ),
            ),
            const SizedBox(width: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nome,
                  style: const TextStyle(
                    fontSize: 18,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Text("Endereço de embarque")
              ],
            )
          ],
        ),
      ),
    );
  }
}
