// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:e_mobi/core/di/di_container.dart';
import 'package:e_mobi/core/widgets/confirm_terms_button.dart';
import 'package:e_mobi/views/features/childrens/presentation/blocs/bloc/cadastro_aluno_bloc.dart';
import 'package:e_mobi/views/features/childrens/presentation/screens/forma_pagamento.dart';
import 'package:e_mobi/views/features/drivers/presentation/controllers/helper.dart';
import 'package:e_mobi/views/features/drivers/presentation/widgets/custom_upload_card.dart';
import 'package:e_mobi/views/features/parents/presentation/controllers/aluno_comprovante.dart';
import 'package:e_mobi/views/features/parents/presentation/controllers/aluno_photo_upload.dart';
import 'package:e_mobi/widgets/button_custom_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:toastification/toastification.dart';

import '../../../../../pallete_colors.dart';
import '../../../../../widgets/textfield_widget.dart';
import '../../../parents/presentation/widgets/custom_archive_button.dart';
import '../../domain/repositories/cadastro_aluno_repository.dart';

class RegistarCrianca extends StatefulWidget {
  final int idResponsavel;
  const RegistarCrianca({super.key, required this.idResponsavel});

  @override
  State<RegistarCrianca> createState() => _RegistarCriancaState();
}

class _RegistarCriancaState extends State<RegistarCrianca> {
  var dateInputFormater = MaskTextInputFormatter(
    mask: '##/##/####',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  var celularMaskedInputIntel = MaskTextInputFormatter(
    mask: '+##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  var celularMaskInputNumber = MaskTextInputFormatter(
    mask: '#####-####',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  final uploadPhotoAlunoController = Get.put(UploadFotoAllunoController());

  final uploadComprovanteController =
      Get.put(UploadComprovanteAlunoController());
  bool isPPageLoading = false;

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _dataController = TextEditingController();

  final TextEditingController _escolaController = TextEditingController();
  final TextEditingController _serieController = TextEditingController();
  final TextEditingController _enderecoController = TextEditingController();
  final TextEditingController _numeroController = TextEditingController();
  bool isAcepted = false;

  final List<String> _periodos = [
    "Manhã",
    "Tarde",
    "Noite"
  ]; // Lista de períodos
  String? _periodoSelecionado; // Período selecionado

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CadastroAlunoBloc, CadastroAlunoState>(
        bloc: getIt<CadastroAlunoBloc>(),
        listener: (context, state) {
          if (state is CadastroAlunoLoading) {
            log("carregando ...");
            setState(() {
              isPPageLoading = true;
            });
          }
          if (state is CadastroAlunoError) {
            toastification.show(
              title: Text(state.message),
              style: ToastificationStyle.fillColored,
              autoCloseDuration: const Duration(seconds: 3),
              type: ToastificationType.error,
            );
            log(state.message);
            setState(() {
              isPPageLoading = false;
            });
          }
          if (state is CadastroAlunoSuccess) {
            log(state.data.toJson().toString());
            toastification.show(
              title: Text(state.message),
              style: ToastificationStyle.fillColored,
              autoCloseDuration: const Duration(seconds: 3),
              type: ToastificationType.success,
            );
            setState(() {
              isPPageLoading = false;
            });

            Navigator.push(
              context,
              CupertinoPageRoute(
                  builder: (_) => const FormaPagamentoScrren() // HomeUsuario(),
                  ),
            );
          }
        },
        builder: (context, snapshot) {
          return Scaffold(
              appBar: AppBar(
                backgroundColor: PalleteColors.primaryColor,
                elevation: 0,
                iconTheme: const IconThemeData(
                  color: Colors.white,
                ),
              ),
              backgroundColor: PalleteColors.primaryColor,
              body: ModalProgressHUD(
                inAsyncCall: isPPageLoading,
                child: SafeArea(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                    child: Center(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Center(
                              child: Text(
                                "Cadastro do aluno",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w800,
                                  color: PalleteColors.accentColor,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              "Nome e sobrenome do aluno",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 8),
                            TextFieldWidget(
                              controller: _nomeController,
                              textColor: Colors.white,
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 20),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white.withOpacity(0.8),
                                ),
                                borderRadius: BorderRadius.circular(17),
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              "Data de nascimento",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 8),
                            TextFieldWidget(
                              controller: _dataController,
                              textColor: Colors.white,
                              keyboadType: TextInputType.number,
                              maskFormatter: [dateInputFormater],
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white.withOpacity(0.8),
                                ),
                                borderRadius: BorderRadius.circular(17),
                              ),
                            ),
                            const SizedBox(height: 8),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Escola",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 15),
                            TextFieldWidget(
                              controller: _escolaController,
                              textColor: Colors.white,
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 20),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white.withOpacity(0.8),
                                ),
                                borderRadius: BorderRadius.circular(17),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "Período das aulas",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.8),
                                ),
                                borderRadius: BorderRadius.circular(17),
                              ),
                              child: DropdownButton<String>(
                                value: _periodoSelecionado,
                                isExpanded: true,
                                dropdownColor: PalleteColors.primaryColor,
                                hint: const Text(
                                  "Selecione o período",
                                  style: TextStyle(color: Colors.white),
                                ),
                                icon: const Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.white,
                                ),
                                underline: const SizedBox(),
                                items: _periodos.map((String periodo) {
                                  return DropdownMenuItem<String>(
                                    value: periodo,
                                    child: Text(
                                      periodo,
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (String? novoPeriodo) {
                                  setState(() {
                                    _periodoSelecionado = novoPeriodo;
                                  });
                                },
                              ),
                            ),
                            const SizedBox(height: 15),
                            const Text(
                              "Série",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 8),
                            TextFieldWidget(
                              controller: _serieController,
                              textColor: Colors.white,
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 20),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white.withOpacity(0.8),
                                ),
                                borderRadius: BorderRadius.circular(17),
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "CEP",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 8),
                            TextFieldWidget(
                              textColor: Colors.white,
                              keyboadType: TextInputType.number,
                              maskFormatter: [
                                MaskTextInputFormatter(
                                  mask: '#####-###',
                                  filter: {"#": RegExp(r'[0-9]')},
                                  type: MaskAutoCompletionType.lazy,
                                )
                              ],
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 20),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white.withOpacity(0.8),
                                ),
                                borderRadius: BorderRadius.circular(17),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Endereço de embarque",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    SizedBox(
                                      width: 204,
                                      child: TextFieldWidget(
                                        controller: _enderecoController,
                                        textColor: Colors.white,
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color:
                                                Colors.white.withOpacity(0.8),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(17),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Número",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      SizedBox(
                                        width: 150,
                                        child: TextFieldWidget(
                                          controller: _numeroController,
                                          textColor: Colors.white,
                                          keyboadType: TextInputType.text,
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  Colors.white.withOpacity(0.8),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(17),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 13),
                            const Center(
                              child: Text(
                                "Documentos do aluno",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w800,
                                  color: PalleteColors.accentColor,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            CustomArchiveButton(
                              text: "Foto do aluno",
                              color: Colors.white,
                              textColor: PalleteColors.primaryColor,
                              assetIcon: "photos.png",
                              onClick: () {
                                uploadPhotoAlunoController.uploadPhoto();
                              },
                            ),
                            const SizedBox(height: 5),
                            GetBuilder(
                                init: uploadPhotoAlunoController,
                                id: "photoAluno",
                                builder: (context) {
                                  return ListView.separated(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 14),
                                    itemCount: uploadPhotoAlunoController
                                        .filesList.length,
                                    itemBuilder: (context, idx) {
                                      return CustomCardUploadFile(
                                        onTap: () => uploadPhotoAlunoController
                                            .removeItem(idx),
                                        isLoading: uploadPhotoAlunoController
                                                .photoAlunotatusUpload ==
                                            PhotoAlunotatusUpload.loading,
                                        isSended: uploadPhotoAlunoController
                                                .photoAlunotatusUpload ==
                                            PhotoAlunotatusUpload.success,
                                        isFail: uploadPhotoAlunoController
                                                .photoAlunotatusUpload ==
                                            PhotoAlunotatusUpload.fail,
                                        index: idx,
                                        name: UploadController.getFileName(
                                          uploadPhotoAlunoController
                                              .filesList[idx],
                                        ),
                                        icon: UploadController.checkTypeFile(
                                          uploadPhotoAlunoController
                                              .filesList[idx],
                                        ),
                                        size: UploadController.getFileSize(
                                          uploadPhotoAlunoController
                                              .filesList[idx],
                                        ),
                                      );
                                    },
                                    separatorBuilder:
                                        (BuildContext context, int index) {
                                      return const SizedBox(
                                        height: 5,
                                      );
                                    },
                                  );
                                }),
                            CustomArchiveButton(
                              color: Colors.white,
                              textColor: PalleteColors.primaryColor,
                              text: "Comprovante de residência",
                              assetIcon: "file_white.png",
                              onClick: () {
                                uploadComprovanteController
                                    .handleUploadFile(context);
                              },
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            GetBuilder(
                                init: uploadComprovanteController,
                                id: "comprovanteDocAluno",
                                builder: (context) {
                                  return ListView.separated(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 14),
                                    itemCount: uploadComprovanteController
                                        .filesList.length,
                                    itemBuilder: (context, idx) {
                                      return CustomCardUploadFile(
                                        isSended: uploadComprovanteController
                                                .comprovanteStatusUpload ==
                                            ComprovanteAlunoStatusUpload
                                                .success,
                                        isLoading: uploadComprovanteController
                                                .comprovanteStatusUpload ==
                                            ComprovanteAlunoStatusUpload
                                                .loading,
                                        isFail: uploadComprovanteController
                                                .comprovanteStatusUpload ==
                                            ComprovanteAlunoStatusUpload.fail,
                                        onTap: () => uploadComprovanteController
                                            .removeItem(idx),
                                        index: idx,
                                        name: UploadController.getFileName(
                                          uploadComprovanteController
                                              .filesList[idx],
                                        ),
                                        icon: UploadController.checkTypeFile(
                                          uploadComprovanteController
                                              .filesList[idx],
                                        ),
                                        size: UploadController.getFileSize(
                                          uploadComprovanteController
                                              .filesList[idx],
                                        ),
                                      );
                                    },
                                    separatorBuilder:
                                        (BuildContext context, int index) {
                                      return const SizedBox(
                                        height: 5,
                                      );
                                    },
                                  );
                                }),
                            CustomArchiveButton(
                              color: PalleteColors.accentColor,
                              textColor: PalleteColors.primaryColor,
                              text: "Cadastrar 3º aluno",
                              assetIcon: "arrow_down.png",
                              onClick: () {},
                            ),
                            const SizedBox(height: 10),
                            const Center(
                              child: Text(
                                'Ou',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            ConfirmCheckButton(
                              isAccepted: isAcepted,
                              invertColor: true,
                              fillColor: Colors.white,
                              subtitleColor: Colors.white,
                              onChecked: (value) {
                                setState(() {
                                  isAcepted = !isAcepted;
                                });
                              },
                            ),
                            const SizedBox(height: 8),
                            const SizedBox(height: 20),
                            Center(
                              child: SizedBox(
                                width: 200,
                                child: ButtonCustom(
                                  IsEnabled: isAcepted,
                                  iconRigth: Icons.arrow_forward,
                                  backgroundColor: PalleteColors.accentColor,
                                  textColor: Colors.white,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  fontWeight: FontWeight.w900,
                                  size: const Size(40, 30),
                                  height: 40,
                                  onPressed: () async {
                                    if (_periodoSelecionado == null) {
                                      toastification.show(
                                        title: const Text(
                                            "Selecione o período das aulas"),
                                        style: ToastificationStyle.fillColored,
                                        autoCloseDuration:
                                            const Duration(seconds: 3),
                                        type: ToastificationType.warning,
                                      );
                                      return;
                                    }

                                    getIt<CadastroAlunoBloc>().add(
                                      CadastrarAlunoEvent(
                                        params: CadastroAlunoParams(
                                          nome: _nomeController.text,
                                          idPai:
                                              widget.idResponsavel.toString(),
                                          dataNascimento: _dataController.text,
                                          escola: _escolaController.text,
                                          serie: _serieController.text,
                                          endereco: _enderecoController.text,
                                          numero: _numeroController.text,
                                        ),
                                      ),
                                    );
                                  },
                                  text: "Continuar",
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ));
        });
  }
}
