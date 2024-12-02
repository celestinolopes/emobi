part of 'cadastro_motorista_bloc.dart';

@immutable
sealed class CadastroMotoristaState {}

final class CadastroMotoristaInitial extends CadastroMotoristaState {}

class CadastroMotoristaLoading extends CadastroMotoristaState {
  final String message;
  CadastroMotoristaLoading({required this.message});
}

class CadastroMotoristaError extends CadastroMotoristaState {
  final String message;
  CadastroMotoristaError({required this.message});
}

class CadastroMotoristaSuccess extends CadastroMotoristaState {
  final String message;
  CadastroMotoristaSuccess({required this.message});
}
