part of 'meus_alunos_bloc.dart';

@immutable
sealed class MeusAlunosState {}

final class MeusAlunosInitial extends MeusAlunosState {}

class MeusAlunosLoading extends MeusAlunosState {
  final String message;
  MeusAlunosLoading({required this.message});
}

class GetMeusAlunosError extends MeusAlunosState {
  final String message;
  GetMeusAlunosError({required this.message});
}

class GetMeusAlunosSuccess extends MeusAlunosState {
  final String message;
  final MeusAlunosModel data;
  GetMeusAlunosSuccess({required this.message, required this.data});
}
