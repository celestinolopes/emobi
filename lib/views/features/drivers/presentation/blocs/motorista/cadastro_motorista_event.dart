part of 'cadastro_motorista_bloc.dart';

@immutable
sealed class CadastroMotoristaEvent {}

class CadastrarMotoristaEvent extends CadastroMotoristaEvent {
  final CadastroMotoristaParams params;
  CadastrarMotoristaEvent({required this.params});
}
