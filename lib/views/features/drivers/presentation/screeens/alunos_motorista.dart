import 'package:e_mobi/core/di/di_container.dart';
import 'package:e_mobi/pallete_colors.dart';
import 'package:e_mobi/views/features/drivers/presentation/blocs/meus_alunos/meus_alunos_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Aluno {
  final String foto;
  final String nome;
  final String estado;

  Aluno({required this.foto, required this.nome, required this.estado});
}

class AlunosMotorista extends StatefulWidget {
  const AlunosMotorista({super.key});

  @override
  State<AlunosMotorista> createState() => _AlunosMotoristaState();
}

class _AlunosMotoristaState extends State<AlunosMotorista> {
  final List<Aluno> _escolas = [
    Aluno(
      foto: "assets/images/crianca.png",
      nome: "Escola Santo Antonio",
      estado: "",
    )
  ];
  bool isLoading = false;
  @override
  void initState() {
    getIt<MeusAlunosBloc>().add(GetMeusAlunosEvent(idMotorista: 19));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MeusAlunosBloc, MeusAlunosState>(
      bloc: getIt<MeusAlunosBloc>(),
      listener: (context, state) {
        if (state is MeusAlunosLoading) {
          setState(() {
            isLoading = true;
          });
        }
        if (state is GetMeusAlunosSuccess) {
          setState(() {
            isLoading = false;
          });
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
            ),
            backgroundColor: Colors.white,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      "Alunos".toUpperCase(),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: PalleteColors.primaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  if (state is GetMeusAlunosSuccess)
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.data.alunos!.length,
                        itemBuilder: (context, index) {
                          final aluno = state.data.alunos![index];
                          return SchoolCard(
                            imageUrl: "assets/images/crianca.jpg",
                            nome: aluno.nome!,
                            estado: "Confirmado para embarque",
                            icon: Icons.check,
                            iconColor: Colors.white,
                            color: PalleteColors.green,
                          );
                        },
                      ),
                    ),
                  /*  const SchoolCard(
                    imageUrl: "assets/images/crianca.jpg",
                    nome: "Alice Artal",
                    estado: "Confirmado para embarque",
                    icon: Icons.check,
                    iconColor: Colors.white,
                    color: PalleteColors.green,
                  ),
                  const SchoolCard(
                    imageUrl: "assets/images/crianca.jpg",
                    nome: "Maria Eduarda",
                    estado: "Confirmado para embarque",
                    icon: Icons.close,
                    iconColor: Colors.white,
                    color: Colors.red,
                  ),  */
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class SchoolCard extends StatelessWidget {
  final String imageUrl;
  final String nome;
  final String estado;
  final Color color;
  final Color iconColor;

  final IconData icon;
  const SchoolCard({
    super.key,
    required this.imageUrl,
    required this.nome,
    required this.icon,
    required this.iconColor,
    required this.estado,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: color,
          border: Border.all(
            color: color,
          )),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage(imageUrl),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nome.toUpperCase(),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: PalleteColors.primaryColor,
                ),
              ),
              const SizedBox(height: 7),
              Row(
                children: [
                  Text(
                    estado,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                  Icon(icon, color: iconColor)
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
