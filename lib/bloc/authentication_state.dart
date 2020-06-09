import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

//Estados de Authenticacion
//No Inicializado -> splash screen
//Autenticado -> Home
//No Autenticado -> Login

class Uninitialized extends AuthenticationState{
  @override
  String toString() => 'No inicializado';
}

class Authenticated extends AuthenticationState{
  final String displayName;

  const Authenticated(this.displayName);

  @override
  List<Object> get props => [displayName];

  @override
  String toString() => 'Autenticado - displayName :$displayName';
}

class Unauthenticated extends AuthenticationState {
  @override
  String toString() => 'No autenticado';
}

