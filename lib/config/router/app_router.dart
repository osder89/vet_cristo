
import 'package:go_router/go_router.dart';
import 'package:vet_cristo/view/HomeScreen.dart';
import 'package:vet_cristo/view/Inicio.dart';
import 'package:vet_cristo/view/PerfilScreen.dart';


final appRouter = GoRouter(initialLocation: '/', routes: [
 
  GoRoute(
    path: '/',
    name: LoginScreen.name,
    builder: (context, state) => const LoginScreen(),
  ),
  GoRoute(
    path: '/home',
    name: HomeScreen.name,
    builder: (context, state) => HomeScreen(),
  ),
  GoRoute(
    path: '/perfil',
    name: PerfilScreen.name,
    builder: (context, state) => PerfilScreen(),
  ),
   
]);
