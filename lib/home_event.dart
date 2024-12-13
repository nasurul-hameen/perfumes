part of 'home_bloc.dart';

abstract class HomeEvent {}

class UpdateIndexEvent extends HomeEvent {
  final int index;

  UpdateIndexEvent(this.index);
}
