part of 'internet_cubit.dart';

@immutable
abstract class InternetState {}

class InternetLoading extends InternetState {}

class InternetConnectedState extends InternetState {
  final ConnectionType connectionType;

  InternetConnectedState({@required this.connectionType});
}

class InternetDisconnectedState extends InternetState {}
