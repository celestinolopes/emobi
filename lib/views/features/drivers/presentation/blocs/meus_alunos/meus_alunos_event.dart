part of 'meus_alunos_bloc.dart';

@immutable
sealed class MeusAlunosEvent {}

class GetMeusAlunosEvent extends MeusAlunosEvent {
  final int idMotorista;
  GetMeusAlunosEvent({required this.idMotorista});
}
