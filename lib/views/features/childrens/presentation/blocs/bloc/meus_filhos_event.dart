part of 'meus_filhos_bloc.dart';

@immutable
sealed class MeusFilhosEvent {}

class GetMeusFilhosEvent extends MeusFilhosEvent {
  final int idResponsavel;
  GetMeusFilhosEvent({required this.idResponsavel});
}
