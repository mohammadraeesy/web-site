part of 'mager_bloc_cubit.dart';

@immutable
abstract class ManagerBlocState {}

class ManagerBlocInitial extends ManagerBlocState {}

class ManagerBlocLoading extends ManagerBlocState {}

class ManagerBlocLoaded extends ManagerBlocState {
  final List<MassageModel> loadedMassage;

  ManagerBlocLoaded({this.loadedMassage});
}
