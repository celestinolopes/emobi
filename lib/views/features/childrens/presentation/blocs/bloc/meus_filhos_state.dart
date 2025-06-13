part of 'meus_filhos_bloc.dart';

@immutable
sealed class MeusFilhosState {}

final class MeusFilhosInitial extends MeusFilhosState {}

class MeusFilhosLoading extends MeusFilhosState {
  final String message;
  MeusFilhosLoading({required this.message});
}

class MeusFilhosError extends MeusFilhosState {
  final String message;
  MeusFilhosError({required this.message});
}

class MeusFilhosLoad extends MeusFilhosState {
  final String message;
  final List<MeusFilhosModel> data;
  MeusFilhosLoad({required this.message, required this.data});
}
