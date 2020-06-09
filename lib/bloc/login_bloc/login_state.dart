import 'package:meta/meta.dart';

class LoginState {
  //Variables que ayudan a definir los estados
  final bool isEmailValid; //indica si el email ingresado es valido
  final bool isPasswordValid; //indica si la contraseña es valida
  final bool isSubmitting; //para saber si el usuario a presionado submit (enviar las credenciales de inicio de sesion)
  final bool isSuccess; //indica que se ejecuto correctamente el inicio de sesion
  final bool isFailure; //si existe algun problema al iniciar sesion

  bool get isFormValid => isEmailValid && isPasswordValid; //valida si el formulario esta bien rellenado

//Constructor
LoginState({
  @required this.isEmailValid,
  @required this.isPasswordValid,
  @required this.isSubmitting,
  @required this.isSuccess,
  @required this.isFailure,
});
//Cuatro Estados:
// - Vacio/Empty (estado inicial del login form)
factory LoginState.empty(){
  return LoginState(
    isEmailValid: true,
    isPasswordValid: true,
    isSubmitting: false,
    isSuccess: false,
    isFailure: false,
  );  
}
// - cargando/loading (estado del login form cuando se esta valiando credenciales)
factory LoginState.loading(){
  return LoginState(
    isEmailValid: true,
    isPasswordValid: true,
    isSubmitting: true,
    isSuccess: false,
    isFailure: false,
  );
}
// - Falla/failure (cuando falla un intento de inicio de sesion)
factory LoginState.failure(){
  return LoginState(
    isEmailValid: true,
    isPasswordValid: true,
    isSubmitting: false,
    isSuccess: false,
    isFailure: true,
  );
}
// - Exito/success (cuando un intento de inicio de sesión ha tenido éxito)
factory LoginState.success(){
  return LoginState(
    isEmailValid: true,
    isPasswordValid: true,
    isSubmitting: false,
    isSuccess: true,
    isFailure: false,
  );
}
// Funciones adicionales: copywith / update (se encarga de crear una copia del estado login state 
// con los valores que se asignes a las variables y update que se encarga de actualizar el estado)
  LoginState copyWith({bool isEmailValid, bool isPasswordValid, bool isSubmitting, bool isSuccess, bool isFailure}){
    return LoginState(
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
    );
  }

  LoginState update({bool isEmailValid, bool isPasswordValid}) {
    return copyWith(
      isEmailValid: isEmailValid,
      isPasswordValid: isPasswordValid,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
    );
  }

  @override
  String toString() {
    return ''' LoginState {
      isEmailValid: $isEmailValid,
      isPasswordValid: $isPasswordValid,
      isSubmitting: $isSubmitting,
      isSuccess: $isSuccess,
      isFailure: $isFailure,
    } ''';
  }
}