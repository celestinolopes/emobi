part of 'cadastro_aluno_bloc.dart';

@immutable
sealed class CadastroAlunoState {}

final class CadastroAlunoInitial extends CadastroAlunoState {}

class CadastroAlunoLoading extends CadastroAlunoState {
  final String message;
  CadastroAlunoLoading({required this.message});
}

class CadastroAlunoError extends CadastroAlunoState {
  final String message;
  CadastroAlunoError({required this.message});
}

class CadastroAlunoSuccess extends CadastroAlunoState {
  final String message;
  final CadastroAlunoModel data;
  CadastroAlunoSuccess({required this.message, required this.data});
}
