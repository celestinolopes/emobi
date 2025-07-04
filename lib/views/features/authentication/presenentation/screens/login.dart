// ignore_for_file: must_be_immutable

import 'package:e_mobi/core/di/di_container.dart';
import 'package:e_mobi/core/navigation/navigation_service.dart';
import 'package:e_mobi/pallete_colors.dart';
import 'package:e_mobi/views/choice_view.dart';
import 'package:e_mobi/views/features/authentication/presenentation/blocs/authentication/authentication_bloc.dart';
import 'package:e_mobi/views/features/authentication/presenentation/screens/info.dart';
import 'package:e_mobi/views/features/authentication/presenentation/screens/recuperar_senha.dart';
import 'package:e_mobi/views/features/drivers/presentation/screeens/home_motorista.dart';
import 'package:e_mobi/views/features/home/presentation/screens/home_usuario.dart';
import 'package:e_mobi/widgets/text_field/custom_text_field_password_widget.dart';
import 'package:e_mobi/widgets/text_field/custom_text_field_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sizer/sizer.dart';
import 'package:toastification/toastification.dart';

import '../../../../../widgets/button_custom_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
    required this.choice,
  });
  final Choice choice;
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController controller = TextEditingController();

  String initialCountry = 'NG';

  PhoneNumber number = PhoneNumber(isoCode: 'BR');

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  bool isPageLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    _emailController.text = "admin@emobi.com.br";
    _passwordController.text = "emobi@123";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isPageLoading,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocConsumer<AuthenticationBloc, AuthenticationState>(
          bloc: getIt<AuthenticationBloc>(),
          listener: (context, state) {
            if (state is AuthenticationLoadingState) {
              setState(() {
                isPageLoading = true;
              });
            }
            if (state is AuthenticationValidatorState) {
              isPageLoading = false;
              toastification.show(
                title: Text(state.message),
                style: ToastificationStyle.fillColored,
                autoCloseDuration: const Duration(seconds: 3),
                type: ToastificationType.error,
              );
            }
            if (state is AuthenticationSuccessState) {
              setState(() {
                isPageLoading = false;
              });
              print("Login success: ${state.authModel!.toJson().toString()}");
              if (widget.choice == Choice.motorista) {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (_) => const HomeMotorista(),
                  ),
                );
              } else {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (_) => const HomeUsuario(),
                  ),
                );
              }
            }
            if (state is AuthenticationError) {
              setState(() {
                isPageLoading = false;
              });
              toastification.show(
                title: Text(state.message!),
                style: ToastificationStyle.fillColored,
                autoCloseDuration: const Duration(seconds: 3),
                type: ToastificationType.error,
              );
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Center(
                        child: Image.asset(
                          "assets/images/logo.png",
                          width: 150,
                          height: 150,
                        ),
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        hintText: "Email",
                        textEditingController: _emailController,
                      ),
                      CustomTextFieldPassword(
                        hintText: "Senha",
                        textEditingController: _passwordController,
                        passwordIcons: (Icons.visibility, Icons.visibility_off),
                      ),
                      const SizedBox(height: 0),
                      GestureDetector(
                        onTap: () {
                          NavigationService.push(
                            context: context,
                            page: const RecuperarSenha(),
                          );
                        },
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            "Esqueceu a senha?",
                            style: TextStyle(
                              color: PalleteColors.accentColor,
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      ButtonCustom(
                        backgroundColor: PalleteColors.primaryColor,
                        textColor: Colors.white,
                        size: const Size(40, 30),
                        height: 40,
                        onPressed: () {
                          getIt<AuthenticationBloc>().add(
                            LoginEvent(
                              password: _passwordController.text.trim(),
                              username: _emailController.text.trim(),
                              context: context,
                            ),
                          );
                        },
                        text: "Login",
                      ),
                      const SizedBox(height: 10),
                      ButtonCustom(
                        backgroundColor: PalleteColors.accentColor,
                        textColor: Colors.white,
                        size: const Size(40, 30),
                        height: 40,
                        onPressed: () {
                          switch (widget.choice) {
                            case Choice.motorista:
                              NavigationService.push(
                                context: context,
                                page:
                                    const InfoScreen(choice: Choice.motorista),
                              );
                              break;
                            case Choice.responsavel:
                              NavigationService.push(
                                context: context,
                                page: const InfoScreen(
                                    choice: Choice.responsavel),
                              );
                              break;
                            default:
                          }
                        },
                        text: "Cadastrar-se",
                      ),
                      const SizedBox(height: 40),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 1.0,
                                color: PalleteColors.primaryColor,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                'Ou',
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.sp),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 1.0,
                                color: PalleteColors.primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      ButtonCustom(
                        fontSize: 12,
                        icon: null,
                        mainAxisAlignment: MainAxisAlignment.center,
                        textColor: Colors.white,
                        text: 'Entrar como visititante',
                        backgroundColor: const Color.fromRGBO(59, 89, 149, 1.0),
                        onPressed: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (_) => const HomeUsuario(
                                isVisitante: true,
                              ),
                            ),
                          );
                        },
                      ),
                      /*  ButtonCustom(
                        fontSize: 12,
                        icon: FontAwesomeIcons.google,
                        mainAxisAlignment: MainAxisAlignment.center,
                        text: 'Entrar com o Google',
                        textColor: Colors.white,
                        backgroundColor: Colors.blue[600],
                        onPressed: () {},
                      ), */
                      const SizedBox(height: 30),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Precisa de ajuda?",
                          style: TextStyle(
                            color: PalleteColors.accentColor,
                            fontSize: 12.sp,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
