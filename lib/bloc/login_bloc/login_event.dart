import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}
//Cinco Eventos:
// Email Changed - cambio en el email (notifica al bloc que el usuario a cambiado el correo electronico)
class EmailChanged extends LoginEvent {
  final String email;

  const EmailChanged({@required this.email});

  @override
  List<Object> get props => [email];

  @override
  String toString() => 'EmailChanged {email: $email}';
}
// Password Changed - cambio de contraseña (notifica al bloc que el usuario a cambiado la contraseña)
class PasswordChanged extends LoginEvent {
  final String password;

  const PasswordChanged({@required this.password});

  @override
  List<Object> get props => [password];

  @override
  String toString() => 'PasswordChanged {password: $password}';
}
// Submited - enviado (notifica al bloc que el usuario ha cambiado el formulario)
class Submited extends LoginEvent {
  final String email;
  final String password;

  const Submited({@required this.email, @required this.password});

  @override
  List<Object> get props => [email, password];

  @override
  String toString() => 'Submited {email: $email, password: $password}'; 
}
// LoginWithGooglePressed - Login con google (notifica al bloc que el usuario ha presionado el boton de iniciar sesion de google)
class LoginWithGooglePressed extends LoginEvent {}
// LoginWithCredentialsPressed - Login con credenciales (notifica al bloc que el usuario ha presionado iniciar con credenciales)
class LoginWithCredentialsPressed extends LoginEvent {
  final String email;
  final String password;

  const LoginWithCredentialsPressed({@required this.email, @required this.password});

  @override
  List<Object> get props => [email, password];

  @override
  String toString() => 'LoginWithCredentialsPressed {email: $email, password: $password}';
}