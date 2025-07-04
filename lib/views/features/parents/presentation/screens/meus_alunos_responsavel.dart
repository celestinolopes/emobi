import 'dart:developer';

import 'package:e_mobi/core/di/di_container.dart';
import 'package:e_mobi/views/features/childrens/data/models/meus_filhos_model.dart';
import 'package:e_mobi/views/features/childrens/presentation/blocs/bloc/meus_filhos_bloc.dart';
import 'package:e_mobi/views/features/childrens/presentation/screens/gerenciar_alunos.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class MeusFilhos extends StatefulWidget {
  const MeusFilhos({super.key});

  @override
  State<MeusFilhos> createState() => _MeusFilhosState();
}

class _MeusFilhosState extends State<MeusFilhos> {
  bool isPageLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    getIt<MeusFilhosBloc>().add(GetMeusFilhosEvent(idResponsavel: 19));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MeusFilhosBloc, MeusFilhosState>(
      bloc: getIt<MeusFilhosBloc>(),
      listener: (context, state) {
        if (state is MeusFilhosLoading) {
          setState(() {
            isPageLoading = true;
          });
        }
        if (state is MeusFilhosLoad) {
          setState(() {
            isPageLoading = false;
          });
          log(state.data.toString());
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isPageLoading,
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              iconTheme: const IconThemeData(),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        "Meus Filhos ".toUpperCase(),
                        style: const TextStyle(
                          fontSize: 18,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    if (state is MeusFilhosLoad)
                      SizedBox(
                        height: 600,
                        child: ListView.builder(
                            itemCount: state.data.length,
                            itemBuilder: (ctx, index) {
                              final aluno = state.data[index];
                              return CardAluno(
                                nome: aluno.nome,
                                foto: aluno.foto!,
                                data: aluno,
                                enderecoEmbarque: aluno.enderecoEmbarque,
                              );
                            }),
                      )
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
  const CardAluno({
    super.key,
    required this.enderecoEmbarque,
    required this.data,
    required this.nome,
    required this.foto,
  });
  final String? nome;
  final String? enderecoEmbarque;
  final String foto;
  final MeusFilhosModel? data;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (_) => GerenciarAlunos(
              data: data,
            ),
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
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(foto),
            ),
            const SizedBox(width: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$nome",
                  style: const TextStyle(
                    fontSize: 18,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(enderecoEmbarque!)
              ],
            )
          ],
        ),
      ),
    );
  }
}
