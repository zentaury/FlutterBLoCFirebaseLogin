class Validators {

  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  static final RegExp _passwordRegExp = RegExp(
    r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
  );
  //isValidEmail (para validar el email con expresiones regulares)
  static isValidEmail(String email){
    return _emailRegExp.hasMatch(email);
  }

  //isValidPassword (para validar el email con expresiones regulares)
  static isValidPassword(String password){
    return _passwordRegExp.hasMatch(password);
  }
}