part of 'desembarque_bloc.dart';

@immutable
sealed class DesembarqueEvent {}

class GetDesembarqueEvent extends DesembarqueEvent {
  final int idMotorista;
  GetDesembarqueEvent({required this.idMotorista});
}
