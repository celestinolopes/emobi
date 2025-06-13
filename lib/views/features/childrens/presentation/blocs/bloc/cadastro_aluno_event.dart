part of 'cadastro_aluno_bloc.dart';

@immutable
sealed class CadastroAlunoEvent {}

class CadastrarAlunoEvent extends CadastroAlunoEvent {
  final CadastroAlunoParams params;
  CadastrarAlunoEvent({required this.params});
}
