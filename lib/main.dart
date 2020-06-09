import 'package:FlutterLoginFirebase/screens/home_screen.dart';
import 'package:FlutterLoginFirebase/screens/login_screen.dart';
import 'package:FlutterLoginFirebase/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:FlutterLoginFirebase/bloc/authentication_bloc.dart';
import 'package:FlutterLoginFirebase/bloc/authentication_event.dart';
import 'package:FlutterLoginFirebase/repository/user_repository.dart';
import 'bloc/authentication_state.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final UserRepository userRepository = UserRepository();
  runApp(BlocProvider(
    create: (context) =>
        AuthenticationBloc(userRepository: userRepository)..add(AppStarted()),
    child: App(userRepository: userRepository),
  ));
}

class App extends StatelessWidget {

  final UserRepository _userRepository;
  //BlocSupervisor.delegate = SimpleBlocDelegate();

  App({Key key, @required UserRepository userRepository})
    : assert (userRepository != null),
    _userRepository = userRepository,
    super(key:key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is Uninitialized) {
            return SplashScreen();
          }
          if (state is Authenticated) {
            return HomeScreen(name: state.displayName,);
          }
          if (state is Unauthenticated) {
            return LoginScreen(userRepository: _userRepository);
          }
          return Container(

          );
        },
      ),
    );
  }
}